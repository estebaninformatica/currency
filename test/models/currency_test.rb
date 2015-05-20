require 'test_helper'
require 'minitest/autorun'
require 'minitest/spec'

describe Currency do
  describe 'Create a currencies' do
    it 'New currency' do
      currency= FactoryGirl.build(:currency)
      currency.save
      Currency.find_by(name: currency.name).wont_be_nil
    end
    it 'Invalid new currency, validate uniqueness' do
      currency=Currency.new({name: 'Peso'})
      currency.save.must_equal false
    end
    it 'Invalid new currency, validate presence' do
      currency=Currency.new
      currency.save.must_equal false 
    end
  end
end
