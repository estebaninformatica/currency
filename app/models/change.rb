class Change < ActiveRecord::Base
  belongs_to :currency_to  ,  class_name: "Currency"  
  belongs_to :currency_from, class_name: "Currency" 
  belongs_to :type_change, class_name: "TypeChange"
  has_many   :change_historicals

  validates :currency_from, :currency_to, :start_dt, presence: true
  validate :validate_distinct_currency, :validate_exist

  before_validation :set_start

  def validate_distinct_currency
    if currency_from_id == currency_to_id
      errors.add(:currency_from_id, "can't be equal to currency_to_id")
    end
  end

  def set_start
    self.start_dt=Date.today
  end

  def validate_exist
    if not Change.where(currency_from_id: currency_from_id , currency_to_id: currency_to_id, type_change_id: type_change_id ).empty?
      errors.add(:id, "This change exist")
    end
  end


  def current
    self.change_historicals.last
  end

  #method for calendar
  def current_for_date(date)
    changes_for_date=[]
    curr_for_date=self.change_historicals.reverse.detect {|n| Date.parse(n.start_dt.to_s) <= Date.parse(date)}
    changes_for_date << curr_for_date
    changes_for_date << self.change_historicals.detect {|chan| chan.start_dt = curr_for_date.end_dt } unless curr_for_date.end_dt.nil?
    changes_for_date
  end

end
