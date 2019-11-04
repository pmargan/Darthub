json.extract! item, :id, :name, :description, :condition, :price, :image, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
