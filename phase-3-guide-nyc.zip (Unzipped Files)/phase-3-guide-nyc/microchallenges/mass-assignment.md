Let's say we have the following action in a ``PostsController``:

```ruby
def create
  post = Post.new
  post.created_by = current_user.id # `created_by` tracks which user authored the post
  post.attributes = params[:post]
  post.save
  
  redirect_to posts_url
end
```

and a ```Post``` model:

```ruby
class Post < ActiveRecord::Base
  belongs_to :user, :foreign_key => "created_by"
  
  attr_accessible :title, :content, :created_by
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
  post.attributes = params[:post] # I mass-assign the form fields... *SHIT* - the params[:post][:created_by] was sent via my hack and will record that the post was created by author_id to 9, which is not correct!
  post.save
  
  redirect_to posts_url
end
```

We prevent against this by explictly excluding ```created_by``` from the list of attributes can be mass assigned in the ``Post`` model:
```ruby
class Post < ActiveRecord::Base
  attr_accessible :title, :content
end
`````

Now we're safe.

