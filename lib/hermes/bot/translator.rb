require "hermes/bot/connection"
require "hermes/bot/errors"

module Hermes
  module Bot
    class Translator
      include Hermes::Bot::Connection

      def self.translate(params = {})
        response = post("/v2/translate", body: params)

        return response.body if response.success?
        raise_exception(response.code, response.body)
      end

      private

      def self.raise_exception(code, body)
        raise Hermes::Bot::Error::ServerError.new(code, body) if code >= 500
        raise Hermes::Bot::Error::ClientError.new(code, body) if code < 500
      end
    end
  end
end
