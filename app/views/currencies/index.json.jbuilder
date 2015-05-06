json.array!(@currencies) do |currency|
  json.extract! currency, :id, :description, :name, :abbreviation
  json.url currency_url(currency, format: :json)
end
