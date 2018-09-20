# Blog 1 Anonymous Blog

## Summary

We're going to write a simple homepage with a blog.  This will be our first
many-to-many relationship inside the context of Sinatra.  Later, we'll
integrate user authentication.

Do the [Sinatra sandbox challenge][sandbox challenge] first if you don't feel
comfortable with the flow of a web application or how forms send data to the
server.

We'll have two core models: `Entry`s and `Tag`s.  A `Entry` can have many `Tag`s
and a `Tag` can be on many `Entry`s.

## Releases

### Release 0: Controllers &amp; Routes

Think about your controllers and routes.  Consider making three controller files:

1. `app/controllers/index.rb`
2. `app/controllers/entries.rb`
3. `app/controllers/tags.rb`

The `index` controller will just have the index route, displaying your
homepage.  All `Entry`-related routes will go in the `entries` controller and all
`Tag`-related routes will go in the `tags` controller.

These are features (roughly equivalent to the routes you'll need) your app should offer:

1. A homepage that shows all entries
2. A page that shows a particular entry based on id information passed in url. Each article title listed on the homepage should link to one of these URLs.
3. A page where a new entry can be created.  A link to this page should exist on the home page (page #1)
4. A page where an existing entry can be edited. A link to this edit page should exist on the page that displays a single entry (page #2)
5. The ability to delete an entry from the page that shows a single entry (page #2)
6. A page that shows all entries with a given tag. Everywhere a tag is listed, it should be a link to this page for that particular tag.  (What will this URL look like? Which controller will include this route?)

Tags will be created via the `Entry`-creation form.

### Release 1: Models &amp; Validations

Create all the necessary models and migrations to support the above.  You
should have three models &mdash; what are they?

Add the appropriate validations to your models.  Read the [Rails guide to
ActiveRecord validations][AR validations] for reference.

For example, if your `Entry` model has `body` and `title` fields, you probably
don't want to permit a `Entry` that has no `body` or `title` to be saved to the
database.  This means adding `NOT NULL` constraints to the migrations and the
following validations to your ActiveRecord model:

```ruby
class Entry < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
end
```

You'll have other fields and validations, to be sure.  What fields do you want your blog entry to have?  Author?

### Release 2: Design Simple Pages and Forms

Design simple pages and forms to implement all the above functionality.  It
doesn't need to be styled well, but if your HTML is well-structured it will
make it easier to style later.

Your forms for creating and updating `Entry` models should allow you to enter
tags.  You can decide how that works, although from a user experience
perspective it would be incredibly tedious to have to create tags elsewhere
before an entry author can use them.  However, if an entry author uses a tag that
already exists, you aren't going to want to create a new row in the `tags`
table, but rather re-use the already-existing tag.

One idea might be to permit them to enter tags like this:

```html
<label for="entry_tags">Tags:</label>
<input id="entry_tags" name="entry[tags]" value="tag1, tag2, some other tag, a fourth tag">
```

which renders as:

<label for="entry_tags">Tags:</label>
<input id="entry_tags" name="entry[tags]" value="tag1, tag2, some other tag, a fourth tag" class="span4">

All your routes should now implement their basic functionality.  You should be
able to list, show, create, update, and delete entries.  You should also be able
to see all entries for a given tag at a url like

```text
http://localhost:9393/tags/apple
```

### Release 3: Error Cases

Using [valid? and invalid?][valid_invalid] and the [errors][errors] methods,
make sure you're handling your error cases gracefully.  It doesn't need to be
perfect, but good error handling means:

1. When a user makes a mistake or breaks some rule, they're informed.
2. The user is presented with an opportunity to correct the mistake, if possible.
3. The user is given as much guidance as possible about what they need to do to fix the error.

### Release 4: Style!  Style!  Style!

You might want to do the [Layout Drill: Proper Typesetting][proper formatting challenge]
first, if you haven't.  But following the guidelines from that
challenge, spruce up your blog design.

Make it something you're proud to look at.

## Resources

* [DBC Sandbox Challenge][sandbox challenge]
* [DBC Proper Typesetting Challenge][proper formatting challenge]
* [Active Record validations][AR validations]
* [Active Record valid? and invalid?][valid_invalid]
* [Active Record errors][errors]


[sandbox challenge]: ../../../sinatra-sandbox-challenge
[proper formatting challenge]: ../../../layout-drill-proper-typesetting-challenge
[AR validations]: http://guides.rubyonrails.org/active_record_callbacks.html
[valid_invalid]: http://guides.rubyonrails.org/active_record_validations.html#valid-questionmark-and-invalid-questionmark
[errors]: http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors
