get '/horses' do
  @horses = Horse.all
  erb :"/horses/index"
end

get '/horses/new' do
  @horse = Horse.new
  erb :"/horses/new"
end

post '/horses' do
  @horse = Horse.new(params[:horse])
  if @horse.save
    redirect "/horses/#{@horse.id}"
  else
    erb :"/horses/new"
  end
end

get '/horses/:id' do
  @horse = Horse.find(params[:id])
  erb :"/horses/show"
end
