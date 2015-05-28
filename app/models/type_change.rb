class TypeChange < ActiveRecord::Base
	has_many	:change
  validates :name , presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def drop_logic
    self.drop=true
  end
end