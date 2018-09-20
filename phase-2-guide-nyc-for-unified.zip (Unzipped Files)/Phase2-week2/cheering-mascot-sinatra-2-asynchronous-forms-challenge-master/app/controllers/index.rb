get '/' do
  @sign_text = params[:sign_text]
  erb :index
end

post '/cheers' do
  redirect "/?sign_text=#{Mascot.sign_for(params[:cheer_name])}"
end
