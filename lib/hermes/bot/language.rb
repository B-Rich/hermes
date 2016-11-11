module Hermes
  module Bot
    class Language
      attr_reader :language, :confidence

      def initialize(attrs = {})
        @language = attrs["language"]
        @confidence = attrs["confidence"]
      end
    end
  end
end
