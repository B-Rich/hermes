module Hermes
  module Bot
    class IdentifiableLanguage
      attr_reader :language, :name

      def initialize(attrs = {})
        @language = attrs["language"]
        @name = attrs["name"]
      end
    end
  end
end
