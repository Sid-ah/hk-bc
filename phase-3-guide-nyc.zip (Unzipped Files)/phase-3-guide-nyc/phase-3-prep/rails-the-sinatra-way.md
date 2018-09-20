# Rails the Sinatra Way

We are going to build a Rails app the Sinatra way.  That is, we are going to skip a lot of the Rails conventions and build the app as if it were a Sinatra app.

#Creating the Skeleton

Let's jump into it.  We'll install Rails and create a Rails skeleton app called `learning-rails`:

    gem install rails        # make sure you're using Rails 4
    rails new learning-rails

You should see a bunch of files automatically generated for you in a `learning-rails` folder.  The layout should be relatively familiar to you already - with some new files and folders (you can find a full description [here](http://guides.rubyonrails.org/getting_started.html#creating-the-blog-application)).

By default, a new Rails project comes setup for a sqlite3 database.  If you want to read more about configuring your database, read [this](http://guides.rubyonrails.org/configuring.html#configuring-a-database).  That link also talks about the difference between the development, test and production environments of a rails app.  It isn't really important for now, but read it if you have time.

You have the same `rake` tasks handy like:

    rake db:create
    rake db:migrate

As with all rake tasks, you can always learn more by typing:

    rake -T

The console is no longer `rake console`, but instead `rails console`.

Instead of typing `rackup` or `shotgun`, you can startup your rails server by typing:

    rails server

or simply:

    rails s

Some important things to note:
  * rails will automatically reload changes so there is no need for `rerun` anymore.
  * rails has far more detailed logs than sinatra, so make good use of them in debugging your problems (seriously, any error you get should make you run to your logs...)
  * rails runs on localhost:3000 instead of locahost:9292

After running `rails server`, you can visit `localhost:3000` now and see the normal greeting page if everything worked fine.

## Cheering Mascot on Rails

Yes, the mascot is back.  Maybe because it is a great example for comparison to [our skeleton](../../../../sinatra-skeleton-mvc-challenge), or maybe it is because I'm just not that creative.  Either way, let's get moving.

### Routing

Okay, routing is a bit different here.  In sinatra, you'd have in `app/controllers/index.rb`:

```ruby
# in sinatra app
get '/' do
  @sign_text = params[:sign_text]
  # Look in app/views/index.erb
  erb :index
end
```

In rails, the routing part is separated from the controller code. You can still declare the same kind of match conditions like `get '/'` or `post '/create'`, but instead of going straight into your controller code, you have to specify a separate `controller` class and `action`, where your code can be found.  We will get to the `controller` in a moment.  So for now, let's just add a similar route by making `config/routes.rb` look like this:

```ruby
# in config/routes.rb
LearningRails::Application.routes.draw do
  get '/' => 'pages#index'
end
```

The string `pages#index` is specifying the `PagesController` (not yet created) and the `index` action.  "Pages" is arbitrary and doesn't have any special meaning here.  Also, you can ignore most of the comments in `routes.rb` for now.

Great you just created your first route.  *Make sure to erase public/index.html* from your skeleton.  The `public` folder is checked before your routes, and if it finds a file called `index.html`, it will return that for the `/` route (this is just a long standing web tradition that `index.html` should be the 'home' page).

Once you've *erased public/index.html*, let's visit `locahost:3000`.

    Routing Error
    uninitialized constant PagesController

You should be getting a nice big error page.  Rails tries to give friendly error messages.  This one is trying to tell us that there was a problem routing because it couldn't find the `PagesController`, naturally.

Let's create it.  Make a file `app/controllers/pages_controller.rb` with:

```ruby
# in app/controllers/pages_controller.rb
class PagesController < ApplicationController
end
```

You may have noticed there was already a file `app/controllers/application_controller.rb` already.  This is just a class that all controllers inherit from, so that common controller code can go there.  An example might be authentication code, which most controllers would want in a typical application.  Let's leave that for now and move on.

We can refresh our page on `localhost:3000`.  We should have a new error:

    Unknown Action
    The action 'index' could not be found for PagesController

Yet another great Rails error message.  This one is trying to tell us there is no `action` called `index` on the `PagesController`.  An `action` is really just a method on your controller.  Easy enough to fix.

```ruby
# in app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def index
  end
end
```

This is a good time to jump back to the Sinatra skeleton, remember this:

```ruby
# in sinatra app
get '/' do
  @sign_text = params[:sign_text]
  # Look in app/views/index.erb
  erb :index
end
```

If we compare what we have just done, we can see the routing part is complete.  Now the code that used to be between our `do` `end` block can now be put in the `index` method, with some slight modifications, which gives us:

```ruby
# in config/routes.rb
LearningRails::Application.routes.draw do
  get '/' => 'pages#index'
end
```

```ruby
# in app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def index
    @sign_text = params[:sign_text]
    # Look in app/views/pages/index.erb
  end
end
```

There are three differences to note:
  1. The view files are now within another folder.  The folder name should correspond with the controller name, in this case "pages".
  2. The file name is now `index.html.erb` instead of `index.erb`.  Sinatra assumed you would always have responses with HTML while Rails out of the box can have responses with different types, like Javascript or XML. This is why HTML is specified in the file name.
  3. We don't need to say `erb :index`, Rails assumes it will find a file with the same name as the action in a folder with the same name as the controller.

The `params` are pretty much the same old hash you have gotten to know and love.

At this point, refreshing `localhost:3000` will give you another error message:

    Template is missing
    Missing template pages/index, application/index with {:locale=>[:en], :formats=>[:html], :handlers=>[:erb, :builder, :coffee]}. Searched in: * "/Users/dbc/Desktop/learning-rails/app/views"

This one is saying that it didn't find the file it expected to.  It tried to look in `pages/index`, and then `application/index` in the `/Users/dbc/Desktop/learning-rails/app/views` folder.  `locale` is for multi-language support, `formats` is about handling different response types (for example HTML, XML, JSON, etc...) and `handlers` are the supported templating languages for creating the response.  We shouldn't worry about `locale`, `formats` or `handlers` for now, but feel free to google it if you have time.

At this point, I just copy the original `index.erb` from the Sinatra app into `app/views/pages/index.html.erb`:

```html
<div class="container">

  <section class="sidebar">
    <h1>Call a Cheer</h1>

    <form id="cheer_caller" action="/cheers" method="post">
      <label for="cheer_name">Cheer name:</label>
      <input type="text" name="cheer_name">
      <input type="submit" value="Call it out!">
    </form>
  </section>

  <main class="mascot">
    <div class="sign-text-wrap">
      <div class="sign-text">

        <% if @sign_text %>
          <span><%= @sign_text %></span>
        <% end %>

      </div>
    </div>
  </main>
</div>
```

Now, refresh `localhost:3000`. You should see something like this:

![Cheering Mascot Cheer!](http://i.imgur.com/2sSYJMd.png)

## Conclusion

Tada!  Rails isn't so bad right?
You have just built a basic Rails app the Sinatra way.

I would encourage you to revisit your [Cheering Mascot](../../../../cheering-mascot-sinatra-1-synchronous-forms-challenge) challenge and try to add the remaining functionality.  The goal here is to give you a familiar spot to fall back on when learning the Rails way gets too intense.

Just remember, at the end of the day, you are just doing what you have been doing all along.  Rails is just tries to automate as much as possible for you, so you can stop worrying about the boring details.

Once you are comfortable with these parts of Rails, go back to [Learning Rails](./learning-rails.md) and start on [Rails the Rails Way](./rails-the-rails-way.md).

## Feedback

Help make _Rails the Sinatra Way_ better for you and your fellow boots.  Leave a comment on the good and bad.
Thanks!
