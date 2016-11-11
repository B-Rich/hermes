module Hermes
  module Bot
    class Model
      attr_reader :id, :source, :target, :base_model_id, :customizable,
                  :default, :domain, :owner, :status, :name

      def initialize(attrs = {})
        @id = attrs["model_id"]
        @source = attrs["source"]
        @target = attrs["target"]
        @base_model_id = attrs["base_model_id"]
        @customizable = attrs["customizable"]
        @default = attrs["default"]
        @domain = attrs["domain"]
        @owner = attrs["owner"]
        @status = attrs["status"]
        @name = attrs["name"]
      end

      def available?
        status == "available"
      end

      def training?
        status == "training"
      end

      def error?
        status == "error"
      end
    end
  end
end
