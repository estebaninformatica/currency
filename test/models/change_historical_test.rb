require 'test_helper'
require 'minitest/autorun'
require 'minitest/spec'

describe ChangeHistorical do
  describe 'Create a historical change' do
    it 'New historical change' do
      change_historical= FactoryGirl.build(:change_historical)
      change_historical.save
      ChangeHistorical.find(change_historical.id).wont_be_nil
    end

    it 'Invalid new historical change' do
      change_historical=ChangeHistorical.new
      change_historical.save.must_equal false
    end

    it 'Create new historical change and close the previous ' do
      change_historical= FactoryGirl.create(:change_historical)
      change_historical_current= FactoryGirl.build(:change_historical)
      change_historical_current.change_id=change_historical.change_id
      change_historical_current.save
      change_historical_previous=ChangeHistorical.find(change_historical.id)
     change_historical_previous.end_dt.wont_be_nil
    end
  end
end
