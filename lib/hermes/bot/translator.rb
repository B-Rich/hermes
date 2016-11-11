require "hermes/bot/connection"
require "hermes/bot/errors"
require "hermes/bot/identifiable_language"

module Hermes
  module Bot
    class Translator
      include Hermes::Bot::Connection

      def self.translate(params = {})
        response = post("/v2/translate", body: params)

        return response.body if response.success?
        raise_exception(response.code, response.body)
      end

      def self.identifiable_languages
        response = get("/v2/identifiable_languages")

        parsed_response = JSON.parse(response.body)

        return parsed_response["languages"].map do |attrs|
          Hermes::Bot::IdentifiableLanguage.new(attrs)
        end if response.success?

        raise_exception(response.code, response.body)
      end

      private

      def self.raise_exception(code, body)
        raise Hermes::Bot::ServerError.new(code, body) if code >= 500
        raise Hermes::Bot::ClientError.new(code, body) if code < 500
      end
    end
  end
end
