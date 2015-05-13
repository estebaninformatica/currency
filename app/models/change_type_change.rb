class ChangeTypeChange < ActiveRecord::Base
  belongs_to :all_change ,class_name: 'Change'
  belongs_to :type_change
end
