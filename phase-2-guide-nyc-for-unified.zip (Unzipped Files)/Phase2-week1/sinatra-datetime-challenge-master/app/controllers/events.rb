get "/events" do
  @upcoming_events = Event.order(:starts_at)

  erb :"events/index"
end

get "/events/new" do
  @event = Event.new

  erb :"events/new"
end

post "/events" do
  puts params[:event]
  @event = Event.new(params[:event])

  if @event.save
    redirect "/events/#{@event.id}"
  else
    erb :"events/new"
  end
end

get "/events/:id/edit" do
  @event = Event.find(params[:id])

  erb :"events/edit"
end

put "/events/:id" do
  @event = Event.find(params[:id])
  @event.assign_attributes(params[:event])

  if @event.save
    redirect "/events/#{@event.id}"
  else
    erb :"events/edit"
  end
end

get "/events/:id" do
  @event = Event.find(params[:id])

  erb :"events/show"
end

delete "/events/:id" do
  event = Event.find(params[:id])
  event.destroy

  redirect "/events"
end
