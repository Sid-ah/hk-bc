# Cheering Mascot

## Summary

We're going to build a very simple web application using [Sinatra](http://www.sinatrarb.com/documentation.html), a lightweight framework for building web applications in Ruby.  We'll be exploring both how to pass data when making HTTP requests and also how to access data that's been passed with a request.  We'll take a look at both `GET` and `POST` requests.

### Mascot Module
This challenge is a web version of the Cheering Mascot Ruby command line challenge.  In case anyone is unfamiliar with that challenge or needs a refresher, here's an overview.

| CHEER NAME      | SIGN TEXT      |
| :-------------: | :------------: |
| RED HOT         | H-O-T!         |
| DO IT AGAIN     | Go, Fight, Win |
| 2 BITS          | Holler!        |
| STOMP YOUR FEET | STOMP!         |

  *Table 1*.  Cheers for which the mascot has signs.

We are leading some cheers, and we have a mascot helping us by holding up signs that correspond to our cheers.  The mascot only has signs for a handful of cheers.  The mascot will hold up the appropriate sign, if we shout the name of the cheer we want to hear (i.e., type with all caps).  But, if we call out a cheer for which the mascot has no sign or if we don't shout out the name of the cheer loud enough for the mascot to hear, the mascot holds up a generic "Go Team!" sign.

A `Mascot` module has been provided (see `app/models/mascot.rb`).  The purpose of the module is to determine the sign to hold based on the name of a given cheer.

### Sinatra Skeleton
The folder structure of this challenge has been designed to mimic the structure of a Rails application.  At DBC, the Sinatra challenges all share a similar skeleton, so it's worth taking a moment to orient ourselves to how it's organized.

Particularly noteworthy is the `app` directory.  Most of the files we'll be working with will be stored in its subfolders.

- `app/controllers` contains the files where we define how our application will respond to various HTTP requests.

- `app/helpers` contains the files where we define methods shared by our controllers and views.  We won't be defining any in this challenge.

- `app/models` contains the files where we define the classes and modules used in our application.

- `app/views` contains the files where we define templates that we'll convert to HTML and send back as responses to HTTP requests.

### PostgreSQL Database
We won't be creating a database for this challenge.  However, it's worth noting that the Sinatra skeleton uses [Postgres](http://www.postgresql.org/) for its database, not SQLite.  If for some reason there's a database-related error, grab an instructor to make sure the machine is configured correctly and Postgres is running.


## Releases
### Pre-release: Starting the Server with Shotgun
In order to use our application, we need to run a server to handle the HTTP requests we'll be generating in the browser.  Take a look at the `Gemfile`.  Notice two of the entries:  [`thin`](https://github.com/macournoyer/thin/) and [`shotgun`](https://github.com/rtomayko/shotgun).  We're not expected to know how these work. Suffice it to say we'll be running a thin server, and we'll start it with shotgun.

Before we try starting the server, let's make sure that all required gems have been installed. Run `bundle` to install any missing gems.

To start the server, run the following command from the application's root directory:

```text
$ bundle exec shotgun config.ru
```
*Figure 1*.  Code to start server.

The `config.ru` file loads our environment and runs our application. The `.ru` stands for "rackup". Sinatra, like Rails, is a [Rack-based](http://rack.github.com/) framework, which means the main point of entry is this `config.ru` file. Going forward, we can leave off the `config.ru` and just run `bundle exec shotgun`.  By default, `shotgun` looks for a `config.ru` file in the current directory.

```text
== Shotgun/Thin on http://127.0.0.1:9393/
Thin web server (v1.6.2 codename Doc Brown)
Maximum connections set to 1024
Listening on 127.0.0.1:9393, CTRL+C to stop
```
*Figure 2*. Console output after starting the server.

When the server starts we should see output similar to that in Figure 2.  The first and last lines contain the most relevant information.  The first line gives us the host and port where we can access our application:  `http://127.0.0.1:9393/`.  The last line informs us how to shut down our server:  `CTRL + C`.

### Release 0: Visit the Homepage

![screenshot-no-text](screenshot-no-text.png)

*Figure 3*.  Screenshot of homepage.

We should now be able to visit our web app. Rather than using host `127.0.0.1`, we can use `localhost` which always refers to *the current machine*.  Open the browser and go to `http://localhost:9393`.  Our page should look similar to the screenshot in Figure 3.

So, what's happening here?  When we went to `http://localhost:9393`, the browser sent an HTTP request to the server that we started.  More specifically, it made a `GET` request to the root URL.

```ruby
get '/' do
  @sign_text = params[:sign_text]
  # Look in app/views/index.erb
  erb :index
end
```
Figure 4.  Defining a Sinatra GET handler.

Our server obviously knew how to handle that request.  Let's take a look at the file `app/controllers/index.rb`.  At the top of the file, we'll see the code that appears in Figure 4, which defines a `GET` handler by calling the method [`Sinatra::Base#get`](https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb#L1368).  We're passing the method a path, which is in this case `"/"` and represents the root URL.  We also pass a block.  All together, we're saying that when a `GET` request is made to this specific path, execute this block of code.

What does the block of code do?  First it assigns an instance variable `@sign_text`.  We'll talk more about this in the next release.  Then, we have the line `erb :index`.  We're calling the method [`Sinatra::Templates#erb`](https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb#L665) and passing the name of a template that we want to render.

The symbol `:index` that we're passing corresponds to the name of one of our view templates:  `app/views/index.erb`.  Our template is written in embedded Ruby.  Essentially, our template is plain text with snippets of Ruby code mixed in.  When the template is rendered, the Ruby expressions get evaluated and their return values replace the snippets.

Back to our block of code.  The call to `#erb` renders our template into a string. As this is the last line of code to execute, the rendered string is what our block will return.  And, the return value of the block becomes the body of the response that our server will send back to the browser.


### Release 1: Put Words on the Sign

The sign our mascot is holding needs some words on it.  We want the text of the sign to be dynamic.  Remember, we're going to call out cheers, and our application will determine the appropriate sign.

We'll begin by looking at how to pass data when making a `GET` request.  We're going to use a [query string](http://en.wikipedia.org/wiki/Query_string).  To put it simply, we're going to add some data to the end of our URL.

```text
http://somesite.com/?first_name=Ariel&last_name=Cyrillus
```
*Figure 5*. Example URL with a query string added.

A query string is offset from the rest of the URL by a `?`.  After the `?` are key-value pairs; pairs are delimited with an `&`.  Each key-value pair is an individual query string parameter.  In the query string in Figure 5, we're passing along data for a first name, Ariel, and a last name, Cyrillus.

![screenshot with text](screenshot-with-text.png)

*Figure 6*. Screenshot of homepage with `sign_text=LOUDER` passed in the query string.

We're going to use the same technique to control the words that appear on our mascot's sign.  We'll add a key-value pair to our query string.  The key needs to be `sign_text`.  Let's give the key the value `LOUDER`.  In the browser, let's visit `http://localhost:9393/?sign_text=LOUDER`.  There should now be text on the sign (see Figure 6).

How did the value from the query string end up on the webpage?  We'll need to take a look at a couple of files:  `app/controllers/index.rb` which we've already seen and `app/views/index.erb`.

In Release 0, we discussed the `GET` handler that we defined for requests made to the root path of our application.  In the block that gets executed when a `GET` request is made to the root path (see Figure 4), we have yet to discuss the line `@sign_text = params[:sign_text]`.

```ruby
{ :sign_text => "LOUDER" }
```
*Figure 7*. Representation of `params` hash.

When HTTP requests are made to our server, the query string parameters are made available.  The key-value pairs are added to a hash assigned to the variable `params`.  In our example, the `params` hash has a key `:sign_text`.  The value of that key is the string `"LOUDER"`.  (See Figure 7)

We have access to the data passed in the query string, but what are we doing with it?  We access the value of the `params` hash's `:sign_text` key (i.e., `"LOUDER"`, and we assign that value to the instance variable `@sign_text`.

```text
<% if @sign_text %>
  <span><%= @sign_text %></span>
<% end %>
```
*Figure 8*. Snippet of code from `app/views/index.erb`.

When we assign an instance variable in the block, that instance variable is accessible when we render a template.  In our example we're rendering the template written in `app/views/index.erb` (see Figure 8).  In our template, we insert some Ruby code to say, if the instance variable `@sign_text` is truthy, when rendering the template include the following: `<span><%= @sign_text %></span>`.  Of course, the Ruby snippet `<%= @sign_text %>` will need to be evaluated.  In this example, our rendered template will include `<span>LOUDER</span>`.


### Release 2:  Use the Form to Call out Cheers

Now it's time to call out cheers.  Remember, we want to call out the name of a cheer, and our application will determine which sign the mascot will hold.

We'll use the form to submit the name of a cheer.  In `app/views/index.erb` we define a form, and we give the form some attributes.  The form has a `method` which is `post` and an `action` which is set to `"/cheers"`.  These attributes combine to determine what happens when the form is submitted.  Submitting this form will tell the browser to make a `POST` request to the path `/cheers`.

When the form is submitted, the data entered in the form is sent along as part of the request.  The input fields and their values are combined to form a line of text formatted like a query string which is added to the request body.  Each `input` element's `name` attribute is used as a key.  The value for each key is whatever was entered into the form.  These key-value pairs are added to the `params` hash and are accessible in our request handlers.

A handler for `POST` requests to the path `/cheers` has been defined for us in `app/controllers/index.rb`.  Enter the name of a cheer into the form, submit the form, and take a look at the response displayed in the browser.

Unfortunately, the handler doesn't handle the request in the way we want.  We need to rewrite the handler to do the following.

1. Figure out which cheer name was submitted with the form.
2. Determine which sign the mascot should hold up based on the cheer name.  Remember, this work can be delegated to the `Mascot` module.
3. Redirect the browser to the homepage, adding a query string containing the text to display on the sign. When the form is submitted, the browser should ultimately end up at `http://localhost:9393/?sign_text=foobar` where `foobar` is whatever text should appear on the sign. For guidance, read the Sinatra documentation on [browser redirect][].


## Conclusion
We've taken a whirlwind tour of HTTP and Sinatra: how to deal with `GET` and `POST` requests, how to pass data with a `GET` request, how data in a form is sent as part of a `POST` request, how to access data sent with a request through the `params` hash, how to define a Sinatra request handler, etc.  It's a lot to wrap our heads around.  Fortunately, we're going to get a lot of practice working with Sinatra to build web applications, and we'll grow more and more comfortable with all of this material.

Here are some reading and reference materials on Sinatra.

* [Sinatra Online Documentation][Sinatra] (_less-comprehensive but direct_)
* [Sinatra Book][Sinatra Book] (_more comprehensive, but less direct_)

[Sinatra documentation]: http://www.sinatrarb.com/intro
[browser redirect]: http://www.sinatrarb.com/intro#Browser%20Redirect
[handlers section]: http://sinatra-book.zencephalon.com/#toc_17
[Sinatra Book]: http://sinatra-book.zencephalon.com/
[Sinatra]: http://www.sinatrarb.com/
