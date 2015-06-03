class TypeChange < ActiveRecord::Base
  belongs_to :currency_to  ,  class_name: "Currency"  
  belongs_to :currency_from, class_name: "Currency" 
  belongs_to :category, class_name: "Category"
  has_many   :all_changes, class_name: "Change"

  validates :currency_from, :currency_to, :category ,:difference,:start_dt, presence: true
  validate :validate_distinct_currency, :validate_exist

  before_validation :set_start

  def validate_distinct_currency
    if currency_from_id == currency_to_id
      errors.add(:currency_from_id, "no puede ser igual a Moneda hasta")
    end
  end

  def set_start
    self.start_dt=Date.today
  end

  def validate_exist
    if not TypeChange.where(currency_from_id: currency_from_id , currency_to_id: currency_to_id, category_id: category_id ).empty?
      errors.add(:id, "Este cambio ya existe")
    end
  end


  def current
    self.all_changes.last
  end

  #method for calendar
  def current_for_date(date)
    changes_for_date=[]
    curr_for_date=self.all_changes.reverse.select {|n| Date.parse(n.start_dt.to_s) <= Date.parse(date)}

    changes_for_date << curr_for_date
    changes_for_date << curr_for_date.each {|n| self.all_changes.select }
   # changes_for_date << self.change_historicals.select {|chan| chan.start_dt = curr_for_date.end_dt } unless curr_for_date.end_dt.nil?
    changes_for_date

  end

  # changes_for_date=[]
  # curr_for_date=self.change_historicals.reverse.detect {|n| Date.parse(n.start_dt.to_s) <= Date.parse(date)}
  # changes_for_date << curr_for_date
  # changes_for_date << self.change_historicals.detect {|chan| chan.start_dt = curr_for_date.end_dt } unless curr_for_date.end_dt.nil?
  # changes_for_date

end