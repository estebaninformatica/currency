class Change < ActiveRecord::Base
  belongs_to :currency_to  ,  class_name: "Currency"  
  belongs_to :currency_from, class_name: "Currency" 
  #has_many   :change_type_changes
  #has_many   :type_changes , through: :change_type_changes
  has_many   :type_changes

  validates :currency_from, :currency_to, :start_dt, presence: true
  validate :validate_distinct_currency

  def validate_distinct_currency
    if currency_from_id == currency_to_id
      errors.add(:currency_from_id, "can't be equal to currency_to_id")
    end
  end

  # def validate_exist
  #   if not Change.where(currency_from_id: currency_from_id , currency_to_id: currency_to_id, start_dt: start_dt).empty?
  #     errors.add(:id, "This change exist")
  #   end
  # end

  # def change_close
  #   chanClose=Change.where("currency_from_id = ? AND currency_to_id = ?  AND  start_dt < ? AND end_dt is null" ,currency_from_id,currency_to_id ,start_dt).take
    
  #   if not chanClose.nil?
  #     chanClose.end_dt=start_dt #Ver
  #     chanClose.save
  #   end  
  # end
  def current
    self.type_changes.last
  end

end
