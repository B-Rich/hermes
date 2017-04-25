require 'spec_helper'

describe Hermes::Bot do

  before :all do
    Hermes::Bot.configure do |config|
       config.username = "174f2d4d-4130-4d0d-8641-448646347489"
       config.password = "u72xDYFm4ycO"
       config.base_uri = "https://gateway.watsonplatform.net/language-translator/api"
    end
  end

  it 'has a version number' do
    expect(Hermes::Bot::VERSION).not_to be nil
  end

  it 'translator is working' do
    expect(Hermes::Bot::Translator.translate(source: "en", target: "es", text: "hello")).to eq("Hola ")
  end

  # it 'identifiable_languages is working' do
  #
  # end
  #
  # it 'identify a language is word' do
  #
  # end
  #
  # it 'models is working' do
  #
  # end
  #
  # it 'identify a model is working' do
  #
  # end
  #
  # it 'creating a model is working' do
  #
  # end

end
