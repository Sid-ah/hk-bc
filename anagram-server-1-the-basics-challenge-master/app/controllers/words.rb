get '/words/:word' do
  @word = params[:word]

  # Look in app/views/anagrams/index.erb
  erb :"words/index"
end
