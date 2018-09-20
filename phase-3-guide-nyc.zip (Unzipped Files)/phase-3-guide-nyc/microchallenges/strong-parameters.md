# Strong Parameters Microchallenge

## Learn

* [Strong Parameters by Example](http://blog.sensible.io/2013/08/17/strong-parameters-by-example.html)
* [Railscast on Strong Parameters](http://railscasts.com/episodes/371-strong-parameters) - [download](https://dl.dropboxusercontent.com/u/930145/dbc/371-strong-parameters.mp4)
* [Testing strong parameters](http://pivotallabs.com/rails-4-testing-strong-parameters/)

## Example security vulnerability

Let's say we have the following action in a ``PostsController``:

```ruby
def create
  post = Post.new
  post.created_by = current_user.id # created_by tracks which user authored the post
  post.attributes = post_params
  post.save
  
  redirect_to posts_url
end

private

def post_params
	params.require(:post).permit(:title, :content, :created_by)
end
```

Seems safe, right? And the following form in our view ``new.html.erb``:

```
<%= form_for @post do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :content %>
  <%= f.submit "Save" %>
<% end %>
```

Suppose I am a malicious user and I alter the form in Chrome DOM editor by adding the following field:
```
<input name="post[created_by]" value="9">
```

Let's walk through what would happen...

```ruby
def create
  post = Post.new
  post.created_by = current_user      # I automatically set the author to be the current logged in user
  post.attributes = params[:post] # I allow the form fields... *SHIT* - the params[:post][:created_by] was sent via my hack and will record that the post was created by author_id to 9, which is not correct!
  post.save
  
  redirect_to posts_url
end
```

We prevent against this by explictly excluding ```created_by``` from the parameters permitted in the ``PostController`` model:
```ruby
def post_params
  params.require(:post).permit(:title, :content)
end
`````

Now we're safe.

## Mass assignment

Note: `strong_parameters` were introduced in Rails 4.  The Rails 3 way to do this is `mass_assignment`.  You might work on a Rails 3 app.  

Take a look at the [mass_assignment microchallenge](./mass-assignment.md) now.

Read more

- [Lynda Mass Assignment and Strong Parameters](http://www.lynda.com/Ruby-Rails-tutorials/Mass-assignment-strong-parameters/139989/159116-4.html)
- [Yehuda Katz's proposals for more security](https://gist.github.com/wycats/1974187)
- [Railscast Mass Assignment Security Issue](http://railscasts.com/episodes/26-hackers-love-mass-assignment-revised) - [download](https://dl.dropboxusercontent.com/u/930145/dbc/026-hackers-love-mass-assignment-revised.mp4)
