require 'factory_girl'

FactoryGirl.define do
  sequence :name_currency do |n|
    "Moneda #{n}"
  end

  sequence :name_type_change do |n|
    "type_change#{n}"
  end

  factory :currency do 
    description "Moneda"
    abbreviation  "$"
    after :build do |v|
      v.name = FactoryGirl.generate(:name_currency)
    end
  end

  factory :type_change do 
    name {generate(:name_type_change)}
  end
  
  factory :change do
    currency_from  factory: :currency
    type_change factory: :type_change
    currency_to factory: :currency
  end

  factory :change_historical do
    change factory: :change
    start_dt Time.now
    amount 10
  end
end


  