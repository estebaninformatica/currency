class Currency < ActiveRecord::Base
	has_many :changes1, class_name: 'Change' 
	validates :name, :description, :abbreviation, presence: true 
end
