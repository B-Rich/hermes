require 'spec_helper'


describe Hermes::Bot::Translator do

  describe ".translate" do
    before :each do
      stub_translator_response = ExampleTranslatorResponse.new
      allow(Hermes::Bot::Translator).to receive(:post).and_return(stub_translator_response)
    end
    it 'should return translated text' do
      expect(Hermes::Bot::Translator.translate("")).to eq("Hola")
    end
  end

  describe ".identify" do
    before :each do
      stub_identify_response = ExampleIdentifyResponse.new
      allow(Hermes::Bot::Translator).to receive(:post).and_return(stub_identify_response)
    end
    it "should return Hermes::Bot::Language object" do
      expect(Hermes::Bot::Translator.identify("")[0]).to be_kind_of(Hermes::Bot::Language)
    end
  end

  describe ".identifiable_languages" do
    before :each do
      stub_identify_response = ExampleIdentifyResponse.new
      allow(Hermes::Bot::Translator).to receive(:get).and_return(stub_identify_response)
    end
    it "should return Hermes::Bot::IdentifiableLanguage objects" do
      expect(Hermes::Bot::Translator.identifiable_languages[0]).to be_kind_of(Hermes::Bot::IdentifiableLanguage)
    end
  end

  describe ".models" do
    before :each do
      stub_models_response = ExampleModelsResponse.new
      allow(Hermes::Bot::Translator).to receive(:get).and_return(stub_models_response)
    end
    it "should list models" do
      expect(Hermes::Bot::Translator.models[0]).to be_kind_of(Hermes::Bot::Model)
    end
  end

  describe ".model" do
    before :each do
      stub_models_response = ExampleModelsResponse.new
      allow(Hermes::Bot::Translator).to receive(:get).and_return(stub_models_response)
    end
    it "should return Hermes::Bot::Model object" do
      expect(Hermes::Bot::Translator.model("")).to be_kind_of(Hermes::Bot::Model)
    end
  end

  describe ".create_model" do
    before :each do
      stub_create_response = ExampleModelsResponse.new
      allow(Hermes::Bot::Translator).to receive(:post).and_return(stub_create_response)
    end
    it "should create a model" do
      expect(Hermes::Bot::Translator.create_model("")).to be_kind_of(Hermes::Bot::Model)
    end
  end

  describe ".destroy_model" do
    before :each do
      stub_destroy_model_response = ExampleDeleteResponse.new
      allow(Hermes::Bot::Translator).to receive(:delete).and_return(stub_destroy_model_response)
    end
    it "should delete a model" do
      expect(Hermes::Bot::Translator.destroy_model("")).to eq(true)
    end
  end

end

class ExampleModelsResponse
  def success?
    true
  end

  def body
    '{
      "models": [{
        "model_id ": "",
        "source": "en",
        "target": "es",
        "base_model_id": "en-es",
        "customizable": "false",
        "default_model": "false",
        "domain": "travel",
        "owner": "",
        "status": "available",
        "name": "mymodel"
      }]
    }'
  end
end

class ExampleDeleteResponse
  def success?
    true
  end
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
