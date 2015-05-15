class ChangeHistorical < ActiveRecord::Base
  belongs_to        :change

  before_create     :set_start
  after_create      :close_before_change 
  
  validates :change_id, :amount, presence: true

  def set_start
    self.start_dt=Time.now
  end

  def close_before_change
    if self.change.change_historicals.size > 1
      changeHistory=self.change.change_historicals.last(2).first 
      changeHistory.end_dt=self.start_dt
      changeHistory.save
    end 
  end
end