require 'spec_helper'


describe Hermes::Bot::Translator do

  before :each do
    stub_translator_response = ExampleTranslatorResponse.new
    allow(Hermes::Bot::Translator).to receive(:post).and_return(stub_translator_response)
    @translator = Hermes::Bot::Translator.new
  end

  describe ".translate" do
    it 'translator should return translated text' do
      expect(Hermes::Bot::Translator.translate("")).to eq("Hola")
    end
  end

  # describe ".identifiable_languages" do
  #   it "list identifiable_languages" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
  #
  # describe ".identify" do
  #   it "identifies languages" do
  #     expect(@translator).to be_kind_of(Hermes::Bot::Translator)
  #   end
  # end
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
