class TypeChange < ActiveRecord::Base
	belongs_to :change
	validates :change_id ,:name, :start_dt, :amount, presence: true

#This method get the last TypeChange and completed the end_dt
def generate
	lastTyChan=lastTypeChange
	if  not lastTyChan.nil?
		lastTyChan.end_dt=Time.now
		lastTyChan.save
	end
end

def lastTypeChange
	TypeChange.where("change_id = ? AND start_dt < ?" , change_id, start_dt ).order(start_dt: :desc).take
end

end