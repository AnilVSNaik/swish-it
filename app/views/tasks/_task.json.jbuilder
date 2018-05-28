json.extract! task, :id, :desc, :is_complete, :priority, :attach, :user_id, :list_id, :created_at, :updated_at
json.url task_url(task, format: :json)
