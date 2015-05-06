namespace :load do 
  task moneys: :environment do
    p "Load moneys"
    Currency.create!(description: "Moneda Peso", name: "Peso" , abbreviation: '$')
    Currency.create!(description: "Moneda Euro", name: "Euro" , abbreviation: '$')
    Currency.create!(description: "Moneda Dola", name: "Dolar" , abbreviation: '$')
  end
end