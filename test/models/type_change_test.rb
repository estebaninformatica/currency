require 'test_helper'
require 'minitest/autorun'
require 'minitest/spec'

describe TypeChange do
  describe 'Create a type of change' do
    it 'New type of change' do
      type_change= FactoryGirl.build(:type_change)
      type_change.save
      TypeChange.find_by(name: type_change.name).wont_be_nil
      type_change.must_be_instance_of TypeChange
    end

    it 'Invalid type of change' do
      type_change2=TypeChange.last
      type_change=TypeChange.new({ name: type_change2.name})
      type_change.save.must_equal false
    end

    it 'validate parameters presents' do
      type_change=TypeChange.new()
      type_change.save.must_equal false
    end
  end
end
