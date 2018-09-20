get '/user/new' do
  erb :'/user/new'
end

post '/user' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'/user/new'
  end
end

get '/user/:id/profile' do
  @user = User.find_by(id: params[:id])
  erb :'user/profile'
end

get '/user/login' do
  erb :'user/login'
end


post '/user/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Username and password did not match"]
    erb :'user/login'
  end
end

get '/user/logout' do
  session.clear
  redirect '/'
end
