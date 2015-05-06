class Currency < ActiveRecord::Base
	has_many :changes, class_name: 'Change', foreign_key: 'currency_from' 
	validates :name, :description, :abbreviation, presence: true 
end
