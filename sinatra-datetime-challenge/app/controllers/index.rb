get "/" do
  @todays_events = Event.order(:starts_at)
  @event = Event.new

  erb :index
end
