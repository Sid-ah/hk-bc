# Tweet Now! Command Line Interface

## Learning Competencies

* Use Net::HTTP to send data to a third-party API
* Use Authorization header to authenticate using OAuth
* Use the MVC pattern in web applications with proper allocation of code and responsibilities to each layer

## Summary

In this challenge we'll be learning more about HTTP, by using it to speak to the Twitter API. We'll create a command line application that lets you tweet from the command line.

## Releases

### Release 0 - Look over the skeleton

Take a moment to look at the code we've given you. Think about what each part does. Figure out how to create migrations, how to run migrations, how to run the app.

Hint: Start in `tweet_now.rb`

### Release 1 - Tweet It!

Create an interactive command line application that tweets (actually sends and posts the Tweet on Twitter) whatever text the user inputs. 

The account from which the application tweets should be hard-coded for now. You can make it your own personal tweet page if you'd like.

We will be using similar code as yesterday, except we will be using `Net::HTTP` to make `POST` requests. Here's some code for doing just that (you can find this in the skeleton in `/lib/oauth_client.rb`):

```ruby
require 'simple_oauth'

class OAuthClient
  attr_reader :credentials

  def initialize(credentials)
    raise ArgumentError, "must provide consumer_key, consumer_secret, token, and token_secret" unless valid_credentials?(credentials)
    @credentials = credentials
  end

  def post(url)
    # create the HTTP post request

    # request =  ** fill this in
    #hint - this request is going to need some form data (aka your tweet)

    # set the Authorization Header using the oauth helper
    request["Authorization"] = oauth_header(request)

    # connect to the server and send the request
    # response = ** fill this in

    return response
  end

  private

  # A helper method to generate the OAuth Authorization header given
  # an Net::HTTP::GenericRequest object and a Hash of params
  def oauth_header(request)
    SimpleOAuth::Header.new(request.method, request.uri, URI.decode_www_form(request.body), credentials).to_s
  end

  def valid_credentials?(credentials)
    [:consumer_key, :consumer_secret, :token, :token_secret].all? { |key| credentials[key] }
  end
end

# sample usage:

client = OAuthClient.new(
    consumer_key: "YOUR TWITTER APP'S API KEY",
    consumer_secret: "YOU TWITTER APP'S API SECRET",
    token: "YOUR ACCESS TOKEN",
    token_secret: "YOUR ACCESS TOKEN SECRET"
)

p client.post("https://api.twitter.com/1.1/statuses/update.json").body

```

You'll need to fill in the `#post` method so that it uses the `url` to make `POST` requests to the Twitter API.

Note: Be sure to research how you are going to attach params to your `request`.

### Release 2

Now, combine the ability to post tweets and get the most recent tweets from a user (aka the previous challenge). After a user tweets, he or she should be able to view an updated 'twitter feed'.

