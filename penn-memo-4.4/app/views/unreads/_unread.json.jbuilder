json.extract! unread, :id, :memo_id, :user_id, :notification, :created_at, :updated_at
json.url unread_url(unread, format: :json)
