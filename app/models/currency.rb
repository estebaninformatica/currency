class Currency < ActiveRecord::Base
	has_many :all_changes, class_name: 'Change' 
	validates :name, :description, :abbreviation, presence: true 
end
