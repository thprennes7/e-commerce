json.extract! item, :id, :item_id, :price, :title, :description, :created_at, :updated_at
json.url item_url(item, format: :json)
