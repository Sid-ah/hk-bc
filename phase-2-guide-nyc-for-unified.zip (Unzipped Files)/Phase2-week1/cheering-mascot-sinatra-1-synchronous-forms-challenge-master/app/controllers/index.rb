get '/' do
  @sign_text = params[:sign_text]
  # Look in app/views/index.erb
  erb :index
end

post '/cheers' do
  "We are not handling POST requests to '/cheers' the way we want to.<br>We'll need to fix this.<br><br>Here's a look at the params hash: <code>#{params.inspect}</code>"
end
