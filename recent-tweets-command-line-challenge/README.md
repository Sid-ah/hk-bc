# Recent Tweets 1 - Command Line Application

## Learning Competencies

* Use Net::HTTP to read data from a third-party API
* Use Authorization header to authenticate using OAuth
* Use the MVC pattern in web applications with proper allocation of code and responsibilities to each layer

## Summary

The goal of this challenge is to become familiar with working with third-party APIs (HTTP APIs) and the kind of architecture decisions necessary to support that.

We're going to start by building a Ruby client which talks to the Twitter API. Then we're going to build a simple web application that uses our Ruby client to fetch and display the most recent tweets for a given Twitter handle.

There should be two types of URLs: the index page with a form to enter a
Twitter username and a page to display the most recent tweets of a particular
username.

That is,

```
http://localhost:9393/devbootcamp
```

should display the most recent tweets from https://twitter.com/devbootcamp.

## Releases

### Release 0: Your First Twitter Application

You'll have to register a Twitter application on Twitter in order to connect with the Twitter API.

**Step One:** Go to Twitter's [Application Page](http://apps.twitter.com).

**Step Two:** Create a new application. (See below)

![Twitter App Home Page](http://i.imgur.com/AZT5m4a.png)

**Step Three:** Be sure to fill out all of the requirements for creating an application (this includes including a callback url). The website and callback url aren't important and can be anything.

**Step Four:** You will need Read & Write permissions in order to fully connect with the Twitter API - so make sure the following is checked under the Permissions tab. (See below)

![Permissions Page](http://i.imgur.com/W3gcoKg.png)

**Step Five:** You'll need to generate 4 tokens in order to successfully create a new Twitter client. The consumer key & consumer secret are unique to the application you're building. The access token & secret are associated with a particular user. You will need to manually generate these (see below).

For this challenge, the access tokens are associated with whichever user you're signed in as when you request the tokens from the Twitter developer page. So you'll be communicating with the Twitter API 'as' that user, through your Ruby application.

![Generate Tokens](http://i.imgur.com/OtpdyKJ.png)

This will also be your first [OAuth-based application][twitter oauth].  OAuth
is a standardized authentication protocol that allows a web application to
delegate authentication to a third-party, e.g., "Log in via Twitter," "Log in
via Facebook," "Log in via Google," etc.

You now have all the information you need to build a Twitter client.

Now Take a moment to look at the code we've already given you. Think about what each part does. Figure out how to create migrations, how to run migrations, how to run the app.

Hint: Start in `recent_tweets.rb`

### Release 1: Ruby Twitter Client

**Note: We are NOT going to be using the [Twitter gem] for this challenge. It's a fantastic gem to use, if you're _writing_ apps that interact with Twitter. That said, in this challenge we're _learning_ how to talk to the Twitter API ourselves.**

**Step One:** Start by exploring the [Twitter API]. We're interested in getting the most recent tweets for a given username. Look through the endpoints the [Twitter API] exposes to you. Look at the names: e.g. `GET statuses/show/:id` (this is a statuses endpoint for showing details for one tweet). Click through to the details of interesting endpoints. Do they give us the data we want?

**Step Two:** At this point you should have found the [user_timeline endpoint]. This is the API endpoint we'll be using in our application. Let's test it out in the [Twitter API Console]. You'll need to select OAuth 1 in the Authentication dropdown. Then select the user_timeline endpoint from the API method dropdown.

Here's what the HTTP Request looks like in the Twitter API Console:

```
GET /1.1/statuses/user_timeline.json?count=10&screen_name=mikelikesbikes HTTP/1.1
Authorization: OAuth oauth_consumer_key="DC0sePOBbQ8bYdC8r4Smg",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1411957863",oauth_nonce="1150061139",oauth_version="1.0",oauth_token="10444422-Xb1X44dnxkskzjLgPGed7Jykaxd4ea2QQYqDGfjWO",oauth_signature="5fJva9zQEnJI%2BfA9EKeoq6AF5l8%3D"
Host: api.twitter.com
X-Target-URI: https://api.twitter.com
Connection: Keep-Alive
```

A couple things to note: I included the `count` and `screen_name` parameters in my request. You can also see the Authorization header in the request:

```
Authorization: OAuth oauth_consumer_key="abcdefgBbQ8bYdC8r4Smg",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1411957863",oauth_nonce="1150061139",oauth_version="1.0",oauth_token="12345678-Xb1X44dnxkskzjLgPGed7Jykaxd4ea2QQYqDGfxyz",oauth_signature="abc123zQEnJI%2BfA9EKeoq6AF5l8%3D"
```

In order to talk to this endpoint we'll need to build this OAuth header. For that, we'll use a gem called [simple_oauth][].

**Step Three:** We're finally ready to attempt to talk to Twitter! You're already familiar with using `Net::HTTP` to make `GET` requests, we just need to add the authorization header:

Here's some code for doing just that (you can find this in the skeleton in `/lib/oauth_client.rb`):

```ruby
require 'simple_oauth'

class OAuthClient
  attr_reader :credentials

  def initialize(credentials)
    @credentials = credentials
  end

  def get(url)
    # create a get request
    request = # fill this in

    # this will set the Authorization header using the oauth_header method from above
    request["Authorization"] = oauth_header(request)

    # send the reqest to Twitter
    response = # fill this in
    
    return response
  end
  
  private

  def oauth_header(request, params = {})
    SimpleOAuth::Header.new(request.method, request.uri, {}, credentials).to_s
  end
end

#... now use to use our OAuthClient
client = OAuthClient.new(
  consumer_key: "YOUR TWITTER APP'S API KEY",
  consumer_secret: "YOU TWITTER APP'S API SECRET",
  token: "YOUR ACCESS TOKEN",
  token_secret: "YOUR ACCESS TOKEN SECRET"
)
client.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=10&screen_name=mikelikesbikes")
```

You'll need to fill in the `#get` method, so that it uses the `url` to make `GET` requests to the Twitter API. If you need a HTTP refresher, feel free to dig into the resources listed at the bottom of this challenge. 

Ok. Now we've built a simple wrapper that allows us to make Authenticated requests, using OAuth, to the Twitter API and get back responses. It's now time to parse the response and make them useful than a big string.

### Release 2: Recent Tweets from API

Create an interactive command line app that allows users to interact with the Twitter API. Next week, you'll create a live web application to execute similar actions.

Explore the [Twitter Developer Documentation](https://dev.twitter.com/overview/api) to decide which pieces of data you want your users to access. 

At an absolute minimum, a user should be able to supply a Twitter `username` and your application should display the 10 most recent tweets of the supplied Twitter
username using the client you built in Release 1. Edit `environment.rb` to add any configuration (your credentials).

Don't worry about leaking your development credentials into the public for now. 

### Release 3: Recent Tweets from your database

The above request will be pretty slow.  Every time you access it you have to make
an API request, which could take a second or more.  Let's create a local cache
of the results so it's only slow the first time we get a list of recent tweets.

Create models `Tweet` and `TwitterUser`.  Implement something like the
following:

```ruby
@user = TwitterUser.find_by_username(params[:username])
if @user.tweets.empty?
  # User#fetch_tweets! should make an API call
  # and populate the tweets table
  #
  # Future requests should read from the tweets table
  # instead of making an API call
  @user.fetch_tweets!
end

@tweets = @user.tweets.limit(10)
```

Your code doesn't have to literally look like the code above, although it is a solid foundation. You will not be penalized if you write something
different. This will not count towards your final grade.

### Release 4: Recent Tweets (cached + invalidation)

The nice thing about the cached version is that only the first request is slow.
The bad thing about the cached version is that the list of tweets quickly
becomes stale.  If there's *any* data in the database we use that data, even if
it's two years old.

We need to flag when the cache is stale and re-fetch the data if it's stale.
Let's say for now that the cache is stale if we've fetched the recent tweets
within the last 15 minutes.  Change your code to work thus:

```ruby
@user = TwitterUser.find_by_username(params[:username])
if @user.tweets_stale?
  # User#fetch_tweets! should make an API call
  # and populate the tweets table
  #
  # Future requests should read from the tweets table
  # instead of making an API call
  @user.fetch_tweets!
end

@tweets = @user.tweets
```

The logic about what a "stale tweet" means should be in the `TwitterUser`
model.

### Release 5: Fancier Invalidation

Can you think of a better way to invalidate the cached tweets?  That is, decide
when the data is stale and needs to be re-fetched?

A famous saying goes: ["There are only two hard things in computer science:
cache invalidation and naming things."][hard things].

One issue is that every user shouldn't have their cache refreshed on the same
schedule.  Someone who tweets once a year doesn't need to have their cache
refreshed every 15 minutes.

Can you modify the `User#tweets_stale?` method to do something fancier?  Maybe
look at the average time between the last N tweets and use that as the "stale"
threshold on a per-user basis?

Think of a few possibilities and discuss the pros and cons with your pair.
Implement one.

<!-- ## Optimize Your Learning -->

## Resources

* [Net HTTP Library](http://www.sitepoint.com/ruby-net-http-library/)
* [Net HTTP Cheat Sheet](http://www.rubyinside.com/nethttp-cheat-sheet-2940.html)
* [Using the Net::HTTP Library](http://danknox.github.io/2013/01/27/using-rubys-native-nethttp-library/)
* [Register an app at twitter][twitter app registry]
* [OAuth Use with Twitter][twitter oauth]
* [More on API keys][breakout session on api keys]
* [Computer Science Witticism: Hard things][hard things]


[twitter app registry]: https://dev.twitter.com/apps/new
[twitter oauth]: https://dev.twitter.com/docs/auth/oauth/faq
[breakout session on api keys]: https://gist.github.com/dbc-challenges/c513a933644ed9ba2bc8
[hard things]: http://martinfowler.com/bliki/TwoHardThings.html
[Twitter gem]: http://rdoc.info/gems/twitter
[twitter api]: https://dev.twitter.com/rest/public
[user_timeline endpoint]: https://dev.twitter.com/rest/reference/get/statuses/user_timeline
[twitter api console]: https://dev.twitter.com/rest/tools/console
[simple_oauth]: https://github.com/laserlemon/simple_oauth
