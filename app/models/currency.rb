class Currency < ActiveRecord::Base
	has_many :all_changes, class_name: 'Change', foreign_key: 'currency_from_id' 
	validates :name, :description, :abbreviation, presence: true 
end
