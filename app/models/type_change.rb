class TypeChange < ActiveRecord::Base
	belongs_to :change
	validates :change_id ,:name, :start_dt, :amount, presence: true

#This method creates the new  "TypeChange" and get the last for complete the end_dt
  def generate
    lastTyChan=lastTypeChange
    lastTyChan.nil?
    lastTyChan.end_dt=Time.now
    lastTyChan.save
  end

  def lastTypeChange
    TypeChange.where("currency_from = ? AND currency_to = ? ", 1, 3).order(start_dt: :desc).take
  end

end