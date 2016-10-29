json.extract! admin, :id, :title, :author, :date, :tag, :content, :attachment, :created_at, :updated_at
json.url admin_url(admin, format: :json)