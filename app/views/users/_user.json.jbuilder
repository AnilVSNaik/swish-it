json.extract! user, :id, :email, :password, :password_disgest, :first_name, :last_name, :username, :birthday, :created_at, :updated_at
json.url user_url(user, format: :json)
