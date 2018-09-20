get '/' do
  # Allow user to create short URLs.
  # Display a list of shortened URLs.
end

post '/urls' do
  # Create a new `Url` object.
  # Redirect back to the homepage.
end

# e.g., /c3por2d2
get '/:short_url' do
  # Redirect to appropriate "long" URL.
end
