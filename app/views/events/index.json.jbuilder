json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_time, :end_time, :description
  json.url event_url(event, format: :json)
end
