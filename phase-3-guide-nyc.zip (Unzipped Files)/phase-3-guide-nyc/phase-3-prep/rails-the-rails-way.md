# Rails the Rails Way

This section will provide reading material on the rails conventions that are drastically different from Sinatra.  The goal here should be to learn the rails way of doing things, and also demystify some of the magic.  At the end of the day, we aren't doing anything fundamentally different.  These are really just a set of conventions, that more often than not, simply make sense to use.

Read section 2 of [What is Rails?](http://guides.rubyonrails.org/getting_started.html#what-is-rails).  This will provide a high level view of the philosophy and the many parts of rails.  You don't need to know each part in depth, but it helps to have a basic idea of what does what.  Spend some extra time to make sure you understand the concept of [REST](http://guides.rubyonrails.org/getting_started.html#rest).

## Generators

Rails provides a command for conviently creating an entire RESTful resource.  We actually strongly discourage you from using them because it is too easy to not understand what is happening.  If you were inclined to learn about them, you can read [this](http://guides.rubyonrails.org/getting_started.html#creating-a-resource).

## RESTful Routes

In practice, the concept of REST and resources is implemented with the routes.  Read sections 2.1, 2.2 and 2.3 from [here](http://guides.rubyonrails.org/routing.html).  Rails strongly encourages RESTful resources, which means exposing 7 conventional routes that map to 7 actions in the controller.  Sometimes not all pages on your website fit into the idea of a resource, so usually there will be a PagesController for handling those situations.  If you have time, try to read the other sections on routing.

## Route Helpers

In section 2.3 of the [routing guide](http://guides.rubyonrails.org/routing.html), routing helpers are mentioned.  They are helper methods available in your views and controllers which will help automatically create the string for a URL or path.  This is better than typing the strings directly because if you ever have to change a link on your website, you can just change 1 method instead of finding all the strings in your code.  Make sure to be comfortable and familiar with these helpers.

## View Helpers

There are a ton of helper methods that you can use in your view.  A couple of good examples would be:

* [link_to](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to)
* [image_tag](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#method-i-image_tag)

Take a moment to read the documentation.

These methods just save you the hassle of writing some basic HTML.  It might not make a lot of sense right now, why someone would need this, but the idea is that you want to write less HTML and more ruby.  There are a couple of advantages of staying in ruby land, for example: we can give `link_to` an object, and it can 'figure out' which URL it should create based on REST conventions.  There are several convinient options for `link_to` in the documentation.

`image_tag` is very useful, especially when it comes to production environments.  If you have time, read about [image_tag](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#method-i-image_tag) and [all asset helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html).

There are many other [View Helpers](http://apidock.com/rails/v3.2.13/ActionView/Helpers) to explore.  It isn't important to know them all, but knowing what is out there is handy only if you have the time.

## Form Helpers

Form helpers tend to be a bit confusing at the start.  Like all the other helpers, they save you the trouble of writing HTML, in this case, forms and inputs.

Read the entire section on [form helpers](http://guides.rubyonrails.org/form_helpers.html).

Another particular point of confusion is that there are two ways of writing form helpers.  `form_tag` and the related *_tag helpers just save from you writing HTML.  However, the `form_for` helper takes an object as an argument.  It tries to construct a form that intelligently extracts all the relevant data from the object.

## Action Controller

Learn more about controller objects [here](http://guides.rubyonrails.org/action_controller_overview.html).  Most of this should be familiar.

## Rendering, views, partials and layouts

Learn about about views [here](http://guides.rubyonrails.org/layouts_and_rendering.html).