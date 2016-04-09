json.array!(@items) do |item|
  json.extract! item, :id, :user_id, :project_id, :value
  json.url item_url(item, format: :json)
end
