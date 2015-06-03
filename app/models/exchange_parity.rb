class ExchangeParity
 # include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  
  attr_accessor :difference, :amount_peso_dolar, :amount_peso_euro, :amount_dolar_euro

  validates_presence_of :difference, :amount_peso_dolar, :amount_peso_euro, :amount_dolar_euro 
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end




  #Peso/Dolar BSP
  def create_change_for_BSP
    category_BSP=Category.find_by(name: 'BSP').type_change.take
    change=Change.new(type_change_id: category_BSP.id, amount: amount_peso_dolar)
    change.save
  end
  
  #Peso/Dolar Terrestre
  def create_change_for_terrestre
    category_terrestre=Category.find_by(name: 'Terrestre').type_change.take
    amount_for_terrestre= self.amount_peso_dolar.to_f + self.difference.to_f
    change=Change.new(type_change_id: category_terrestre.id, amount: amount_for_terrestre)
    change.save
  end

  #Peso/Euro
  def create_change_for_euro
    type_change_euro=TypeChange.joins(:currency_from, :currency_to).where('currencies.name' => 'Peso' , 'currency_tos_type_changes.name' => 'Euro' ).take
    change=Change.new(type_change_id: type_change_euro.id, amount: amount_peso_euro)
    change.save
  end

  #Dolar/Euro
  def create_change_for_dolar_euro
    type_change_dolar_euro=TypeChange.joins(:currency_from, :currency_to).where('currencies.name' => 'Dolar' , 'currency_tos_type_changes.name' => 'Euro' ).take
    change_dolar_euro=Change.new(type_change_id: type_change_dolar_euro.id, amount: amount_dolar_euro)
    change_dolar_euro.save
  end
   def persisted?
    false
  end
end