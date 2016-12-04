json.extract! user_tag, :id, :user_id, :tag_id, :created_at, :updated_at
json.url user_tag_url(user_tag, format: :json)