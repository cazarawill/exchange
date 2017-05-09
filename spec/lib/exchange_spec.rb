require 'spec_helper'
require './lib/exchange'

describe Currency do
  context "random data" do
    it "returns number from API request" do
      json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
      currency, currency_destination = json['currency_list'].sample(2)
      quantity = rand(1..9999)

      value = Currency::exchange currency, currency_destination, quantity
      expect(value.is_a? Numeric).to eq(true)
    end

    it "returns non zero values" do
      json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
      currency, currency_destination = json['currency_list'].sample(2)
      quantity = rand(1..9999)

      value = Currency::exchange currency, currency_destination, quantity
      expect(value != 0).to eq(true)
    end
  end
end