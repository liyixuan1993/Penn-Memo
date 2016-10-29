json.extract! admin, :id, :Author, :Title, :date, :tag, :Content, :file, :created_at, :updated_at
json.url admin_url(admin, format: :json)