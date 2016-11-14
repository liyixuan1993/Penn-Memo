json.extract! memo, :id, :title, :author, :date, :content, :priority, :created_at, :updated_at
json.url memo_url(memo, format: :json)