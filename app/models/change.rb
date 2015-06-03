class Change < ActiveRecord::Base
  belongs_to        :type_change

  before_create     :set_start
  after_create      :close_before_change 
  
  validates :type_change_id, :amount, presence: true

  def set_start
    self.start_dt=Time.now
  end

  def close_before_change
    if self.type_change.all_changes.size > 1
      changeHistory=self.type_change.all_changes.last(2).first 
      changeHistory.end_dt=self.start_dt
      changeHistory.save
    end 
  end

end


