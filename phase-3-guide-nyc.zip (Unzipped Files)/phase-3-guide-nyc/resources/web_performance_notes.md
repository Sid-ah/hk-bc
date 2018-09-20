# Web App Performance

## Back End

### N+1
```
@posts = Post.all
# …
@post.each do |post|
  puts post.comments.count
end
```
We can solve this with what Rails calls "Eager Loading"

### Indexing
If the same queries are getting slower as your add more data to a table, you'd likely benefit from an index. Indexes are like a rolodex for your data; they allow the database to quickly access the data it's interested in without scanning every piece of data.

In Rails we can create indexes in our migrations.

````
def change
#…
add_index :posts, :author_id
#…
end
````

Things to looks for in your system:

1. foreign_keys (used in associations) are indexed (e.g. `posts.author_id`)
2. common lookup fields are indexed (e.g. `posts.slug`)

### Unique indexes and Rails' `unique` constraint

Consider the following:

````
class User < ActiveRecord::Base
  validate :username, unique: true
end

User.create!(username: "mikelikesbikes")
````

Before saving to the database, how does ActiveRecord run the `unique` validation on `username`? That's right… it's going to scan the entire `users` table, and ensure that no other record has the given username. What it we have a million records? This is expensive.

Indexes to the rescue!

````
def change
  add_index :users, :username, unique: true
end
````

Now there's an index of all the usernames AND the database ensures that we never insert a record that doesn't have a unique username.

### Excessive joins/subselects or exta queries
Counts of things that depend on complicated queries or computations are usually good candidates for denormalization.

### Are you using Ruby Enumerable or SQL?
```
Post.all.select{ |post| post.published }.each do |post|
  # do something
end
```

vs

```
Post.where(published: true)
```

### Do you need all the data from a table?
Consider using `#pluck` or `#select` to load only the data you need.

```
# Returns an array of `User` objects, with only the `id` and `email` fields populated
User.all.select(:id, :email)
```

```
# Returns an array of the first 100 `User`'s `id`s
User.limit(100).pluck(:id)
```

#### Begin with the end in mind

Given this model:
```
class User
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "author_id"
end

class Post
  belongs_to :author, class_name: "User"
  has_many :comments
end

class Comment
  belongs_to :post
  belongs_to :author, class_name: "User"
end
```

__How can we find all the people who comment on my posts?__

Slow, round about approach

````
u = User.find_by(email: "mike@devbootcamp.com")
commenters = []
u.posts.each do |post|
  post.comments.each do |comment|
    commenters << comment.author
  end
end
````

__Getting to the point, with speed__

````
u = User.find_by(email: "mike@devbootcamp.com")

commenters = User.where(id: Comment.where(post_id: u.post_ids).pluck(:author_id))
````

### Caching

#### Simple per request caching
@foo ||=

#### Caching across requests
Rails.cache (maybe memcache)

#### Shorter term data storage
Redis or similar. Support for data structures like lists, hashes & arrays. Built in operations list .include?

### Long running tasks
* Switch to background jobs
* Includes email & API requests

### Links
* [query_analyzer for pg](https://github.com/trevorturk/pg_query_analyzer)
* [Google Pagespeed Insights](http://developers.google.com/speed/pagespeed/insights/)


## Front End

#### Fewer requests
This is especially important for slower (mobile) clients where latency is an issue. Imagine the cost of 80ms of latency per every request when you're dependent on 12 CSS files and 8 JS files...ugh!

The asset pipeline is a great example to follow.

#### Load less data
* Lazy load via JS
* Image resizing
* Image sprites
