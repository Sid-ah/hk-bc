get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/colors/random' do

  #Create and return a JSON object with the random cell and color given below.

  cell_to_update = rand(9)
  color_hexcode  = dbc_color_hexcode # See helpers
end
