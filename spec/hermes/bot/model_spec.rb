require 'spec_helper'
require "hermes/bot/model"

describe Hermes::Bot::Model  do
  before(:each) do
    @model = Hermes::Bot::Model.new({ "model_id" => 1})
  end

  describe "boolean methods" do

    context "When status is availabel" do
      before { @model.status = "available"}
      describe "#available?" do
        it "should return true" do
          expect(@model.available?).to be true
        end
      end
    end

    context "When status is training" do
      before { @model.status = "training"}
      describe "#training?" do
        it "should return true" do
          expect(@model.training?).to be true
        end
      end
    end

    context "When status is error" do
      before { @model.status = "error"}
      describe "#error?" do
        it "should return true" do
          expect(@model.error?).to be true
        end
      end
    end



  end

end
