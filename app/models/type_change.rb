class TypeChange < ActiveRecord::Base
	belongs_to :change
	validates :change_id ,:name, :start_dt, :amount, presence: true
#Def initialize
def initialize(params = {})
	
	@change_id=getChange_id(params[:currency_from], params[:currency_to])
	
end

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

#Get change if exist, else it is created
def getChange_id(currency_from_id, currency_to_id)
	
	if Change.where(currency_from_id: currency_from_id , currency_to_id: currency_to_id).empty?
	#Create Change
		change=Change.new({:currency_from_id => currency_from_id ,:currency_to_id => currency_to_id ,:start_dt =>Time.now ,:end_dt=>Time.now})
	else
	#Exist, get change
		change=Change.where(currency_from_id: currency_from_id , currency_to_id: currency_to_id).take
	end
	return change

end

end