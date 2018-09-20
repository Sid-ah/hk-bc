get '/' do
  erb :index
end


# TODO: convert this route to use AJAX
post '/rolls' do
  @die = Die.new(params[:sides].to_i)

  erb :index  # HINT: what does this do? what should we do instead?
end
