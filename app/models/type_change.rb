class TypeChange < ActiveRecord::Base
	#has_many	:change_type_changes
	#has_many 	:all_changes , through: :change_type_changes
	belongs_to 	   :change
	
	after_create	 :add_change, :set_start_dt, :type_change_close
	

	attr_accessor :currency_from, :currency_to
	
	validates  :name, :start_dt, :amount, presence: true

	#add change to list of changes
	def add_change
		if change_exist?
			self.change = Change.where(currency_from_id: currency_from , currency_to_id: currency_to).take 
		else
			chan=create_change
			self.change = chan
		end
		self.save
	end

	#Find change
	def change_exist?
		not Change.where(currency_from_id: currency_from , currency_to_id: currency_to  ).empty?
	end

	#Create Change
	def create_change
		change=Change.new({:currency_from_id => currency_from ,:currency_to_id => currency_to ,:start_dt => Date.today})
		change.save
		#change.change_close
		change
	end

	def type_change_exist?
		not TypeChange.where("change_id = ? AND name = ? AND start_dt < ? AND end_dt is null", change_id, name, start_dt ).empty?
	end

	#close a type change
	def type_change_close
		if type_change_exist?
			typeChangeClose=TypeChange.where("change_id = ? AND name = ? AND start_dt < ? AND end_dt is null" , change_id, name , start_dt ).take
			typeChangeClose.end_dt=self.start_dt
			typeChangeClose.save
		end
	end

	def type_change_close2
		self.end_dt=Time.now
	end

	def set_start_dt
		self.start_dt=Time.now
		self.save
	end
end