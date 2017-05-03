require "hermes/bot/identifiable_language"
require "hermes/bot/language"
require "hermes/bot/model"

module Hermes
  module Bot
    class Translator < Olimpo::Base

      def self.translate(params = {})
        response = post("/v2/translate", body: params)

        return response.body.chop if response.success?
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

      def self.identify(text)
        response = self.post("/v2/identify", body: text, headers: { "Accept" => "application/json", "Content-Type" => "text/plain"})

        parsed_response = JSON.parse(response.body)

        return parsed_response["languages"].map do |attrs|
          Hermes::Bot::Language.new(attrs)
        end if response.success?

        raise_exception(response.code, response.body)
      end

      def self.models(filters = {})
        response = self.get("/v2/models", query: filters)

        parsed_response = JSON.parse(response.body)

        return parsed_response["models"].map do |attrs|
          Hermes::Bot::Model.new(attrs)
        end if response.success?

        raise_exception(response.code, response.body)
      end

      def self.create_model(attrs)
        response = self.post("/v2/models", body: attrs)

        parsed_response = JSON.parse(response.body)

        return Hermes::Bot::Model.new(parsed_response) if response.success?

        raise_exception(response.code, response.body)
      end

      def self.destroy_model(id)
        response = delete("/v2/models/#{id}")
        response.success?
      end

      def self.model(id)
        response = self.get("/v2/models/#{id}")

        parsed_response = JSON.parse(response.body)

        return Hermes::Bot::Model.new(parsed_response) if response.success?

        raise_exception(response.code, response.body)
      end
    end
  end
end
