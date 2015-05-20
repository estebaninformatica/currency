require 'test_helper'
require 'minitest/autorun'
require 'minitest/spec'

describe Change do
  describe 'Create a change' do
    it 'New change' do
      change= FactoryGirl.build(:change)
      change.save 
      Change.find_by(change.id).wont_be_nil
    end

    it 'Invalid new change' do
      change1=Change.last
      change=Change.new({type_change_id: change1.type_change_id })
      change.save.must_equal false
    end
  end
  describe 'Objects validations' do
    it 'Validate parameters presents' do
      change=Change.new
      change.save.must_equal false
    end
  end
end
