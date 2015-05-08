class Change < ActiveRecord::Base
  belongs_to :currency_to  ,  class_name: "Currency"  
  belongs_to :currency_from, class_name: "Currency" 
  has_many :type_changes
	validates :currency_from, :currency_to, :start_dt, :end_dt, presence: true
  validate :validate_distinct_currency, :validate_exist

  def validate_distinct_currency
    if currency_from_id == currency_to_id
      errors.add(:currency_from_id, "can't be equal to currency_to_id")
    end
  end

  def validate_exist
    if not Change.where(currency_from_id: currency_from_id , currency_to_id: currency_to_id).empty?
      errors.add(:id, "This change exist")
    end
  end

end
