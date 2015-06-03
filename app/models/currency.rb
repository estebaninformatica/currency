class Currency < ActiveRecord::Base
	has_many :type_change, class_name: 'TypeChange', foreign_key: 'currency_from_id' 
	validates :name, :description, :abbreviation, presence: true 
  validates :name, uniqueness: { case_sensitive: false }

  def drop_logic
    self.drop=true
  end
end
