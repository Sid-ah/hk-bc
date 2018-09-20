# Craigslist Jr

## Learning Competencies

* Build a wireframe to model application views
* Use Active Record Associations
* Implement all four parts of [CRUD][]: create, read, update, and delete.
* Use the MVC pattern in web applications with proper allocation of code and responsibilities to each layer

## Summary

We're going to build a simple version of Craigslist.  This will be your first
web application that uses multiple models.

Keep in mind that this is not substantially different than a command-line
version.  Instead of reading in command-line arguments, we read in URL
parameters.  Instead of printing to the console, we print HTML and CSS.

We'll only have two models in a one-to-many relationship; no different than
your command-line TODO app.

The challenge repo includes a Sinatra skeleton as usual.

## Releases

### Release 0: Wireframe With Your Pair

Never heard of a web wireframe? Check out [what Wikipedia has to
say][wireframe]. **TL;DR** -- figure out what *pages* your app needs, then
sketch-out the basic *layout* of each and the *connections* between them.

The application will have two core models: `Article` and `Category`.  An `Article`
belongs to a `Category` and a `Category` has many `Articles`.

A `Category` is something like "Apartment Rentals" or "Auto Parts."

Sit down and work out with your pair what pages you're going to be building.
At a minimum, you'll need:

1. A page that lists all the categories
2. A page that lists all the articles in a given category
3. A page that lets someone create a new article in a given category
4. A page that lets someone who has created a page return to edit/update the page

If you're never used Craigslist, it doesn't have any kind of user
authentication.  Instead, when someone creates an article they're given a special
"secret" URL that grants them powers to edit that article that looks like

```text
http://craigslist.com/articles/123/edit?key=kjansd812
```

The key is randomly generated.  The person is given their "edit URL" after they
successfully create a article.  Anyone with this URL can edit the article.

Think about this like a real web application you might want someone to use.
What fields should an `Article` have?

A price, probably.  What should the column type of a money-related column be?

An email, so the author of the article could be contacted.  Title, description, etc.

Spend time enumerating the pages, deciding what should be displayed on each
one.

### Release 1: Implement Controller Structure

Our controller structure will be more complicated.  We'll want URLs that look
like `/categories/123` and `/articles/456`.  We'll be using both `get` and `post`
methods.

To create a new `Article`, for example, we'd want to submit an HTML form using the
POST http method to the `/articles` URL, like so:

```html
<form action="/articles" method="post">
  <!-- other form elements here -->
</form>
```

and to update an existing record (say with id `1234`) we'd want to post to
`/articles/1234`.

Controllers should either redirect to another URL or render a page.  Typically,
a page loaded via HTTP POST will redirect to an appropriate URL if a request
succeeds and render an error page, otherwise.

#### Organization

Keeping your code organized is an important part of any software project. Most
important is following a convention, this way a new member of your team won't
spend days trying to get their bearings.

Developers might disagree on _which_ convention to follow, but they'll all
agree any convention is better than none.

In this app you'll have both `Article` and `Category` models. The ActiveRecord
convention is for those to be described in different files:

```text
app
| - models
  | - article.rb
  | - category.rb
```

Why not do the same for your controllers? You could have one controller per
model! Each controller would handle all the requests (CRUD) for each that
model. E.g.:


```text
app
| - controllers
  | - article.rb
  | - category.rb
  | - index.rb
```

You might keep `index.rb` around for requests that aren't for a `Category` or
`Article`. Your `/` landing page would be a good fit for `index.rb`

The same organizational technique can be applied to your erb views. Instead of
filling up your `app/views` directory with a half dozen erb templates:

```text
app
| - views
  | - category_index.erb
  | - category_show.erb
  | - edit_article.erb
  | - new_article.erb
  | - article_show.erb
  | - articles_index.erb
```

Why not create an `articles` and a `categories` sub-directory?

```text
app
| - views
  | - articles
    | - edit.erb
    | - new.erb
    | - show.erb
    | - index.erb
  | - categories
    | - index.erb
    | - show.erb
```

Now with the sub-directories `articles` and `categories` our erb template names
follow a convention. Neat! One tip, you'll need to use some (ahem) interesting
syntax to render a template inside a sub-directory. Here's an example:

```ruby
get "/articles" do
  @articles = Article.all

  erb :"articles/index"
end
```

### Ship it!

Make sure the core features work.  We should be able to download your app, run
it, and do the following:

1. Choose a category to browse
2. View all articles in a particular category
3. View a particular article
4. Create my own article
5. Edit my articles by using the "secret key" that I get after creating my articles

When we say "download your app" we mean "check it out from source, run the
migrations, and start up the server."  Imagine you're showing this great idea
off to your boss or a colleage who will help you if they can get it up and
running.  How might you make sure that *they* are effective with only a basic
knowledge of the DBCstarter kit?  A good developer makes it easy to get up and
running because not wasting others' time is a virtue.

### Release 3: Add One Final Feature

One last feature to add: the "this is awesome" feature.  What does awesome
mean?  It can mean anything.  The code is awesome, there are new awesome
features, the design is awesome.

This isn't a race; there's no finish line, only a deadline (tomorrow, duh!).
Take the time to make this application something you're proud of.  It doesn't
have to be flashy &mdash; it could be a difficult technical hurdle you
overcame.

Bring 100% of your best self to this feature.  Make something meaningful; make
something great.

## Resources

* Create, Read, Update, Delete ([CRUD][])
* [Wikipedia: Wireframe][wireframe]

[CRUD]: http://en.wikipedia.org/wiki/Create,_read,_update_and_delete
[wireframe]: http://en.wikipedia.org/wiki/Website_wireframe
