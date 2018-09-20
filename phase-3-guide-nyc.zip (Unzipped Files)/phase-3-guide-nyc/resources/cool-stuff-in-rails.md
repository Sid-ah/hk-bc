# Cool Stuff You'll Love In Rails

## In Controllers

#### `respond_to`

`respond_to` is used to craft different responses based around the request's `Accepts` header.

For example: if you make a request using AJAX, you're probably going to want JSON back, so jQuery sends an `Accepts: application/json` header along with the request. Using `respond_to` allows you to honor the request for JSON.

```ruby
def show
  @post = Post.find(params[:id])
  respond_to do |format|
    format.html
    format.json { render json: @post }
  end
end
```

#### `before_action`

A [`before_action`](http://guides.rubyonrails.org/action_controller_overview.html#filters) is a "filter" usually used to perform work necessary for an action to do it's work. If a `before_action` renders or redirects, the action will not run. If there are additional filters scheduled to run after that filter, they are also cancelled.

```ruby
before_action :get_post

protected

def get_post
  @post = Post.find(params[:id])
end
```

Read [more about filters](http://guides.rubyonrails.org/action_controller_overview.html#filters) here on the Rails Guides.

#### `render` vs. `redirect` vs. `head`

```ruby
# assuming a JSON request
def create
  @post = Post.create(params[:post])
  # `render`
  render json: @post
  # `redirect`
  redirect_to post_path(@post)
  # `head`, where no content is returned
  head :created, location: post_path(@post)
end
```

**Output of `render`**

```
HTTP/1.1 200 OK
Date: Mon, 23 Feb 2015 02:31:05 GMT
Server: Apache
Last-Modified: Thu, 30 Oct 2014 02:58:59 GMT
Cache-Control: max-age=300
ETag: "c390203519e6256dd476e5633f85dbf82126ff00"
Content-Type: application/json
Content-Length: 184

{"post": {"id": 1, "title": "Best Post in the World", "body": "What more needs to be said? Perfect.", "user_id": 1, "created_at": "2015-02-23T02:31:03Z", "updated_at": "2015-02-23T02:31:03Z"}}
```

**Output of `redirect`**

```
HTTP/1.1 301 Moved Permanently
Date: Mon, 23 Feb 2015 02:31:05 GMT
Server: Apache
Location: http://your-website.com/posts/1
```

**Output of `head`**

```
HTTP/1.1 201 Created
Date: Mon, 23 Feb 2015 02:31:05 GMT
Server: Apache
ETag: "c390203519e6256dd476e5633f85dbf82126ff00"
Location: http://your-website.com/posts/1
```

## In Routing

#### `namespace`

`namespace` is usually used in cases where you want to isolate a set of controllers and paths from the primary paths of your application; in this case, using `admin` to separate administrator functionality for user management.

```ruby
resources :users

namespace :admin do
  resources :users
end
#          Prefix Verb   URI Pattern                     Controller#Action
#           users GET    /users(.:format)                users#index
#                 POST   /users(.:format)                users#create
#        new_user GET    /users/new(.:format)            users#new
#       edit_user GET    /users/:id/edit(.:format)       users#edit
#            user GET    /users/:id(.:format)            users#show
#                 PATCH  /users/:id(.:format)            users#update
#                 PUT    /users/:id(.:format)            users#update
#                 DELETE /users/:id(.:format)            users#destroy
#     admin_users GET    /admin/users(.:format)          admin/users#index
#                 POST   /admin/users(.:format)          admin/users#create
#  new_admin_user GET    /admin/users/new(.:format)      admin/users#new
# edit_admin_user GET    /admin/users/:id/edit(.:format) admin/users#edit
#      admin_user GET    /admin/users/:id(.:format)      admin/users#show
#                 PATCH  /admin/users/:id(.:format)      admin/users#update
#                 PUT    /admin/users/:id(.:format)      admin/users#update
#                 DELETE /admin/users/:id(.:format)      admin/users#destroy
```

#### `only` / `except`

`only` and `except` are used to refine which routes are being handled by the Rails app. This is used for security purposes to lock down routes that aren't being supported, since Rails has default route behavior if no action or view are specified.

```ruby
resources :users, only: [:index, :show]
# Prefix Verb URI Pattern                      Controller#Action
#  users GET  /users(.:format)                 users#index
#   user GET  /users/:id(.:format)             users#show

resources :users, except: [:edit, :update]
#   Prefix Verb   URI Pattern                     Controller#Action
#    users GET    /users(.:format)                users#index
#          POST   /users(.:format)                users#create
# new_user GET    /users/new(.:format)            users#new
#     user GET    /users/:id(.:format)            users#show
#          DELETE /users/:id(.:format)            users#destroy
```

#### `member` / `collection`

`member` and `collection` are used to specify non-RESTful routes on a given resource. `collection` creates a path with no resource id in it, being used to indicate a route that deals with the entire collection. `member` creates a path in reference to a single object in the collection (in this case, `/posts/5/remind`) to indicate an action that is to be performed on a single object.

```ruby
resources :users, only: [:index, :show] do
  collection do
    get 'invited'
  end
  member do
    post 'remind'
  end
end
#           Prefix Verb  URI Pattern                      Controller#Action
#            users  GET  /users(.:format)                 users#index
#    invited_users  GET  /users/invited(.:format)         users#invited
#             user  GET  /users/:id(.:format)             users#show
#      remind_user POST  /users/:id/remind(.:format)      users#remind
```


## In Views

#### `link_to`

```ruby
<%= link_to('Home', root_path) %>
#=> <a href="/">Home</a>

<%= link_to('Home', root_path, class: 'home') %>
# <a href="/" class="home">Home</a>
```

#### `button_tag`

```ruby
<%= button_to('Upvote', post_vote_path(@post)) %>

# <form method="post" action="/posts/1/vote">
#   <input value="Upvote" type="submit" />
# </form>
```

#### `form_for`

```ruby
<%= form_for @post do |f| %>
  <%= f.label :title %>:
  <%= f.text_field :title %><br />

  <%= f.label :body %>:
  <%= f.text_field :body %><br />

  <%= f.submit %>
<% end %>

# <form action="/posts" class="new_post" id="new_post" method="post">
#   <input name="authenticity_token" type="hidden" value="NrOp5bsjoLRuK8IW5+dQEYjKGUJDe7TQoZVvq95Wteg=" />
#   <label for="post_title">Title</label>:
#   <input id="post_title" name="post[title]" type="text" /><br />
#
#   <label for="post_body">Body</label>:
#   <input id="post_body" name="post[body]" type="text" /><br />
#
#   <input name="commit" type="submit" value="Create Post" />
# </form>
```

#### `image_tag`

`image_tag` is not only shorthand for creating an `<img>`, but it also works with the Asset Pipeline to give you a correct path to a hosted asset, using asset fingerprinting.

```ruby
image_tag('icon.png', alt: 'Welcome to my blog')
# <img alt="Welcome to my blog" src="/assets/icon.png" />
```

#### Rendering partials

```ruby
<%= render 'comments' %>
# renders `app/views/posts/_comments.html.erb`

<%= render 'comment', collection: @post.comments %>
# renders `app/views/posts/_comment.html.erb` for each Comment

<%= render @comments %>
# renders `app/views/comments/_comment.html.erb` for each Comment
```

