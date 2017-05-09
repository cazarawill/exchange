require 'rails_helper'

RSpec.describe 'Exchange Currency Process', type: :feature do
  it 'exchange value' do
    visit root_path
    within('#exchange_form') do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end
end