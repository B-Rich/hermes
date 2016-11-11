module Hermes
  module Bot
    module Connection
      def self.included klass
        klass.class_eval do
          include HTTParty
          base_uri "https://gateway.watsonplatform.net/language-translator/api"
          basic_auth Hermes::Bot.username, Hermes::Bot.password
          debug_output $stdout
        end
      end
    end
  end
end
