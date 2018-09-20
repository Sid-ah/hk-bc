# Github API Client

HTTP is handy for browsers and HTML, but the protocol itself is used with many different kinds of tools. For example, Github's entire API is exposed as HTTP. Instead of sending text back and forth, Github sends JSON because it's easier to work with in code. In fact, at Devbootcamp we build all kinds of tools that use Github's API to help us administer challenges, and all of it happens from the command line over HTTP.

We're going to build a tool that uses Github's API. We'll use Ruby's built in HTTP client, [Net::HTTP](http://www.ruby-doc.org/stdlib-2.1.3/libdoc/net/http/rdoc/Net/HTTP.html), no need to re-invent that particular wheel.

## Release 1, Hello Emoji

Produce a simple command-line app that contacts [Github's API](https://developer.github.com/v3/) in Ruby and prints out a list of every [Emoji](https://developer.github.com/v3/emojis/) it supports. It should look something like this:

```
$ ./emojis
888 Emojis:
 * 100
 * 1234
 * +1
 * -1
 * 8ball
 * a
 * ab
 * abc
 * abcd
 * accept
 * aerial_tramway
 [... snip ...]
```

You can use `curl` to hit a Github API endpoint first just to see what it sends back, but you should use Net::HTTP in Ruby to get the job done in your script.

Note that Github's API is all over [HTTPS](http://ruby-doc.org/stdlib-2.1.5/libdoc/net/http/rdoc/Net/HTTP.html#class-Net::HTTP-label-HTTPS).

## Release 2, Authenticate
Github aggressively rate-limits the number of requests we can make to their HTTP servers if we are not authenticated (only 60 reqs/hr), and those request are shared by everyone on the network. We'll run out of requests in no time as you test your code, so we need to start passing our credentials. Authenticated requests have a cap of 5000 reqs/hr — that should be enough.

You already know about request and response headers from our work on the HTTP server challenge. One of the first additions to your github client should be the [Authorization header](https://developer.github.com/v3/#authentication).

You can [generate](https://github.com/settings/tokens) an OAuth token for yourself to use in authentication, Github calls this a "Personal Access Token." You'll pass that token in the Authorization header to let Github know the request is coming from you (the user). The [docs](https://developer.github.com/v3/#authentication) have an example of that header (see the `curl -h` example).

Test your authentication by accessing the `/user` resource. If you are authenticated correctly, you should get back some information about yourself. If you're getting a `401` or `403` response from the server it means something is going wrong with authentication.

## Release 3, Github CLI Profile

You know how to access the Github API in Ruby, and you know how to send authenticated requests. Now produce a tool that prints out a simple Github profile summary given a person's Github user name.

The summary should list repositories the user owns, sorted by the number of watchers they have.

Example:

```
$./ruby-profile mattbaker
Name: Matt Baker
Location: Chicago, IL
Public Repos: 10

 * ruby-heap-viz (239 watchers)
 * Reactive.js (179 watchers)
 * Arrhythmia (17 watchers)
 * websocket-pipe (13 watchers)
 * swift-funsets (1 watchers)
 * mattbaker.github.com (1 watchers)
 * divvyviz (1 watchers)
 * is-lucas-home-yet (1 watchers)
 * ruby-tar-pit (0 watchers)
 * matasano-crypto-challenges (0 watchers)
```

## Release 4, Refactor

So far you have two entities you've been interacting with, a User and a Repository. You might have more before this is over. Instead of working with raw Ruby Hashes let's provide some encapsulation.

Produce classes for the entities that you're interacting with through the Github API. These classes should have methods that feel similar to ActiveRecord. For example, if I want to get the user "mattbaker" from Github I might do this:

```ruby
matt = User.find('mattbaker')
matt.location #=> Chicago, IL
```

In the above example I've defined a class method `#find` that talks to the Github API and returns an instance of my User class populated with data from Github.

API calls should be abstracted away inside the classes. In other words, users of your classes shouldn't know if the data comes from Github or a database. For example, if I want the repositories for a User instance in my Ruby code I might set it up so I can do this:

```ruby
matt.repos #=> Array of Repository objects
```

### Testing

You'll need to write tests for these classes, but you don't want to hit the Github API every time you run rspec, that's going to be too slow. Instead, we'll need to do some [mocking](https://github.com/rspec/rspec-mocks).

Mocking lets us say:

> we expect this object 'foo' to have a method 'bar' called on it

```ruby
expect(foo).to receive(:bar)
###
foo.bar
```

Sometimes we want to also assert that 'bar' is being called with specific arguments.

If we want to say...

> we expect this object 'foo' to have method 'bar' called on it with the argument '1234'

... we could do this:

```ruby
expect(foo).to receive(:bar).with(1234)
###
foo.bar(1234)
```

Finally, and most relevant to us, we can say:

> we expect this object foo to have a method 'bar' called on it. _Don't let that method run_, instead just pass the value 'hello' back.

```ruby
expect(foo).to receive(:bar).and_return('hello')
###
foo.bar #=> 'hello'
```

You can do something similar for methods that take blocks.

```ruby
expect(foo).to receive(:bar).and_yield('hello')
###
foo.bar do |value|
  value #=> 'hello'
end
```

Use this concept to mock `Net::HTTP` so that it returns a fake JSON response without ever making a real network request. Grab an instructor if you get stuck. Don't forget to check the [docs](https://github.com/rspec/rspec-mocks) on Rspec Mocks.

### Write the code you want to see in the world.

**Don't skimp on this refactor.** One of your cohort mates will be using your Github API Client in another challenge, so don't leave them high and dry. Your code should be well written, well organized, usable, understandable and well tested. 

## Release 5, More Detail

Let's expand our utility more. If a user passes a user _and_ a repository name, show the event feed of that repo. For example:

```
$./ruby-profile mattbaker ruby-heap-viz
Name: Matt Baker
Location: Chicago, IL
Repository: ruby-heap-viz
Events: 29

 * Watched by liberatiluca
 * Watched by airios
 * Watched by mwilkowski
 * Watched by mwilkowski
 * Watched by Krishna
 * Forked by samdunne
 * Watched by sergii
 * Watched by rohitn
 * Watched by chetan
 * Watched by taufikobet
 * Forked by epitron
 * Watched by benjreinhart
 * Watched by waymondo
 * Watched by RaVbaker
 * Watched by epitron
 * Watched by huydx
 * Watched by rhacker
 * Watched by jmdeldin
 * Watched by jcastaneyra
 * Forked by csavage-mdsol
 * Watched by rbazinet
 * Watched by pluff
 * Watched by jrhorn424
 * Watched by KaFaiC
 * Watched by Goodank
 * Watched by cromulus
 * Watched by kobtea
 * Watched by futoase
 * Forked by jeaxelrod
 * Watched by scvalencia
```

## Release 6, Expand your Abstraction

Expand your model to support pull requests. Continue the pattern of encapsulation we started in Release 4.

You should be able to:
 
 * Get Pull Requests for a repository
 * Get the list of files in a given pull request
 * Find out if a pull request has been merged
 * Merge a pull request
  * Test this on a dummy repo, please don't work against a challenge repo. You can create a new repo for yourself in the cohort organization.
