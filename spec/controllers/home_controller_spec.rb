require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response.status).to eq(200)
    end
  end
  
  describe 'POST exchange' do
    before do
      json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
      @currency, @currency_destination = json['currency_list'].sample(2)
      @quantity = rand(1..999)
    end
    subject {post :exchange, params: {currency: @currency, currency_destination: @currency_destination, quantity: @quantity }}
    
    it 'returns http success' do
      subject
      expect(response.status).to eq(200)
    end
    it 'returns a numeric value' do
      subject
      value = JSON.parse(response.body)['value']
      expect(value.is_a? Numeric).to be_truthy
    end
  end
end