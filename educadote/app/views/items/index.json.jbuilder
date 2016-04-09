json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :price, :project_id
  json.url item_url(item, format: :json)
end
