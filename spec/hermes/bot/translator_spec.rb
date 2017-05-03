require 'spec_helper'


describe Hermes::Bot::Translator do

  describe ".translate" do
    before :each do
      stub_translator_response = ExampleTranslatorResponse.new
      allow(Hermes::Bot::Translator).to receive(:post).and_return(stub_translator_response)
    end
    it 'translator should return translated text' do
      expect(Hermes::Bot::Translator.translate("")).to eq("Hola")
    end
  end

  describe ".identify" do
    before :each do
      stub_identify_response = ExampleIdentifyResponse.new
      allow(Hermes::Bot::Translator).to receive(:post).and_return(stub_identify_response)
    end
    it "identifies languages" do
      expect(Hermes::Bot::Translator.identify("")[0]).to be_kind_of(Hermes::Bot::Language)
    end
  end

  # describe ".identifiable_languages" do
  #   it "list identifiable_languages" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
  #
  #
  # describe ".models" do
  #   it "list models" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
  #
  # describe ".create_model" do
  #   it "creates model" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
  #
  # describe ".destroy_model" do
  #   it "deletes model" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
  #
  # describe ".model" do
  #   it "list model" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
end

class ExampleTranslatorResponse
  def success?
    true
  end

  def body
    "Hola "
  end
end

class ExampleIdentifyResponse
  def success?
    true
  end

  def body
    '{
    "languages": [
        {
            "confidence": 0.9143,
            "language": "en-US"
        },
        {
            "confidence": 0.0396,
            "language": "hu-HU"
        },
        {
            "confidence": 0.0093,
            "language": "ro-RO"
        },
        {
            "confidence": 0.005,
            "language": "nl-NL"
        }
      ]
    }'
  end
end
