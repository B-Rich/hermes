require "hermes/bot/version"
require "olimpo"

module Hermes
  module Bot
    extend Olimpo
    autoload :Translator, "hermes/bot/translator"
  end
end
