class Change < ActiveRecord::Base
  belongs_to :currency_to  ,  class_name: "Currency"  
  belongs_to :currency_from, class_name: "Currency" 
  #has_many :type_changes
	validates :currency_from, :currency_to, :stard_dt, :end_dt, presence: true
end
