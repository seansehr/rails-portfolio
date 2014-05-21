json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :context, :approved
  json.url comment_url(comment, format: :json)
end
