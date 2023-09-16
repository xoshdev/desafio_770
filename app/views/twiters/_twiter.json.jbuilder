json.extract! twiter, :id, :description, :user_name, :created_at, :updated_at
json.url twiter_url(twiter, format: :json)
