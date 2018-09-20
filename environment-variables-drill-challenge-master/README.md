# Working with Environment Variables

## Summary
As we build more advanced applications, it's common to begin integrating with third-party services.  We might want to use the [Twitter API][] to allow users to tweet from our application, or [Amazon S3][] to store uploaded images.  When we use these services we need to authenticate ourselves with each request.  This means sending data along with our requests to verify who we are:  username and password, an access token, etc.  

Different services have different requirements, but whatever those requirements are, we want to keep our passwords and tokens secure.  We do not want to share them with anyone.  We definitely need to keep them out of GitHub.

Assume we need a token to authenticate requests to a service.  Our code needs to _know_ the value of the token.  But at the same time, we don't want that value actually saved in our code base.  How do we have access to the token while not declaring it in our code?  We can use [environment variables][wikipedia environment variables].  In this challenge we'll explore environment variables, setting them, and making them available to our ruby processes.


## Releases
### Release 0:  Environment Variables in Ruby Processes
Let's take a look at environment variables and how to access them in our ruby programs.  Open the terminal and run the `env` command:

```
$ env
```

Environment variables don't belong to a single program, they exist inside the shell (your terminal session). This command prints a list of environment variables specific to this shell.  We'll see environment variables with names like `HOME`, `USER`, `PATH`, etc.  Take a look at some of their values:

```
$ echo $HOME
/Users/Apprentice
$ echo $USER
Apprentice
```

When we run a process (program) inside this shell, these environment variables are passed to that process.  That means our environment variables are available when we run `ruby`, `irb`, `python`, or any other process.

In Ruby processes, you can access environment variables in the `ENV` object.  `ENV` is like a hash with key-value pairs.  Open IRB and access some of the environment variables:

```
$ irb
2.2.1 :001 > ENV["HOME"]
# => "/Users/Apprentice"
2.2.1 :002 > ENV["USER"]
# => "Apprentice"
```

Notice that they have the same values as they did in the terminal.  So, to make a value like a token accessible in our program, we can set it up as an environment variable in our shell.

### Release 1:  The Need for a GitHub Access Token
We have a small script written in the file `runner.rb`.  The script makes use of the [Octokit][] gem to interact with the GitHub API.  In the script, we first create a client object, passing in an access token which is used to authenticate us.  Then we ask the client to get information on the authenticated user from the GitHub API.  Finally, we display some information about that user.

Install the required gems and run the script:

```
$ bundle install
$ bundle exec ruby runner.rb
```

The script errors out, providing information on what went wrong.  The client made a GET request to `https://api.github.com/user`.  What was the response code?  [401][], noting that making the request requires authentication.

Why was our request not authenticated?  When we create our client object, we pass in an access token.  Where should the value of the token be found?  `ENV["GITHUB_ACCESS_TOKEN"]`.  So, we need to have our access token stored in the `GITHUB_ACCESS_TOKEN` environment variable.  Right now, that value is `nil`, which is why our request fails.


### Release 2:  Get an Access Token
Before we can assign an access token to an environment variable, we have to request one from GitHub.  Sign into GitHub and [generate a new access token][github new token].  In filling out the form, any description will do.  For the scopes, only check "user"; this limits the type of requests that can be made with this particular token.

When your token is generated, copy it.

### Release 3:  Make the Token Available to Ruby
Now that we have an access token, let's use it.  To start, we can assign environment variables when running our script all in one line:

```
$ GITHUB_ACCESS_TOKEN=cb229ca4df47129a8be1cb149f5d08e64d1a4eb1 ruby runner.rb
```

Running the script as shown works, but it's not terribly convenient.  The environment variable that we declare is only available for the lifetime of that one run of our ruby program, and it is lost when the process exits (i.e., when our script is done running).  The variable is not stored in the shell, so we have to declare the token every time that we run the script.

### Release 4:  Make the Token an Environment Variable in the Shell
Passing the token every time we run our script could be a little tedious.  How could we make this more convenient?  As we saw in *Release 0*, environment variables in our shell are passed to their child processes (e.g., `ruby`).  If we make our environment variable available in the shell, it will be available to all the programs we run inside that shell.

So, how can we make our token an environment variable in the shell?

To make it an environment variable, we *export* it:

```
$ export GITHUB_ACCESS_TOKEN=cb229ca4df47129a8be1cb149f5d08e64d1a4eb1
```

Now our token is assigned to an environment variable (check with `env`).  As such, it is available in the ruby `ENV` object when we run our script.  Run it:

```
$ bundle exec ruby runner.rb
```

We can now run our script multiple times without redeclaring the value of our token.  Unfortunately, this environment variable is only set for this one shell.  Open another tab or window in the terminal, and our environment variable will not be set.

*Note:*  If we want to make an environment variable available every time we use the terminal, we can set configuration details in files like `~/.bash_profile`.

### Release 5:  Setting Environment Variables in Ruby with Dotenv
In *Release 3* we set our token as an environment variable in our Ruby process, but we had to declare the variable every time we ran our script.  In *Release 4* we set the token as an environment variable in the terminal.  This meant that we only had to declare it once—but once every time we open a window or tab in the terminal.  It also made our token visible to the shell and any other processes running in the shell.

In this challenge, we're just dealing with one environment variable.  Imagine if we needed a handful of them.  Or a dozen.  We certainly wouldn't want to type them in each time we open the terminal.

The [Dotenv][] gem can help us.  Let's ensure that the gem is installed:

```
$ gem install dotenv
```

This gem provides an executable that we can use when running an application.  It runs first, reading the contents of a `.env` file if it finds one in your program's directory.

In the `.env` file, we can declare each of our environment variables on a separate line:

```
GITHUB_ACCESS_TOKEN=cb229ca4df47129a8be1cb149f5d08e64d1a4eb1
OTHER_TOKEN=ed872ca4df47129a8be1cb149f5d08e64d1a2si5
OTHER_SECRET=ue983ca0df47129a8be1cb149f5d08e64d1i6xz8
```

When `dotenv` runs, it picks up the variables in that file and makes them environment variables for the duration of your program.

Create a `.env` file and add our GitHub access token to it.  Then use Dotenv's executable to run our script:

```
$ dotenv bundle exec ruby runner.rb
```

Of course, this `.env` file now contains all of our tokens and secrets!  We need to keep it secure, so we definitely want to prevent it from being checked into our repo.   **If we're going to create a `.env` file, it's critical that we tell git to ignore it.** To do this, our repo already contains a `.gitignore` file that tells git to ignore any files named `.env`, but normally you will need to do that yourself.

## What about Teams?

Setting environment variables in your shell or using a tool like `.env` is great for an individual, but remember that you'll usually be on a team when you're developing applications. It will be up to each developer to get the appropriate keys and set their own environment variables in the manner they see fit. Make sure you communicate your keys in a safe, non-public manner!

## What about Production?

Another sticking point with environment variables can be production. You can set environment variables on your machine, but how do you set them on your production server?

Heroku provides [tools][heroku config vars] via its web interface and command-line toolchain to set environment variables on your Heroku server (they call it a dyno). When you set environment variables on your server they'll stay there until you change them, no need to reset them with every deploy.

If you're not using Heroku, then you're probably managing your own server. You will need to set environment variables for your server process on the remote machine. This process will be similar to the process you followed with your own computer.

## Conclusion
We've looked at a few different options for how to configure an application with environment variables.  In this challenge we've used them to provide our application with sensitive data that we don't want in the code base itself.

[401]: https://httpstatuses.com/401
[amazon s3]: https://aws.amazon.com/s3/
[dotenv]: https://github.com/bkeepers/dotenv
[github new token]:https://github.com/settings/tokens/new
[heroku config vars]: https://devcenter.heroku.com/articles/config-vars
[octokit]: https://github.com/octokit/octokit.rb
[twitter api]: https://dev.twitter.com/
[wikipedia environment variables]: https://en.wikipedia.org/wiki/Environment_variable
