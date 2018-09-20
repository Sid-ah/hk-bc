# URL Shortener

## Summary
We're going to build a [Bitly][] clone.  What does Bitly do?  URLs can be really long, which makes them difficult to share.  Bitly provides a service that creates shorter, friendlier URLs.  When users visit a shortened Bitly URL, the Bitly server responds by telling the browser to redirect to the original, longer URL.

Try it.  Click on this Bitly link:  [http://bit.ly/1dKgi4T](http://bit.ly/1dKgi4T).

What happened?  If we open the Network tab of the Developer Tools, and visit the Bitly link again, we'll see that the response from the Bitly server has a status of [301][wikipedia 301].  If we look a little deeper and look at the response headers, we'll see that a location header specifies for the browser where to go.

While building this web application, our focus is going to be on events related to the life cycle of an Active Record model.  What happens when when an Active Record model is instantiated, saved, validated, etc.?  We'll be using Active Record [callbacks][rails guides callbacks] around these life cycle events to control our objects and their data.


## Releases
### Release 0: Build the MVP
![mvp animation](readme-assets/mvp-animation.gif)  
*Figure 1*.  Mockup of URL Shortener application.


In Figure 1 we have an animation that demonstrates how our application works.  On the homepage is a form where users input a URL.  When the form is submitted, our application persists an object representing the URL.  Objects representing submitted URLs are displayed on the homepage—both the original and shortened URLs.  When a user visits the shortened URL, they are redirected to the original URL.

We'll need one resource for our application:  a `Url` model.  Our model should have two attributes:  a long URL and a short URL.  We'll be creating our `Url` objects based on user input.  Users will provide us with the long URL.  We'll need to create the short URL—use a `before_save` callback in the `Url` model.

*Note:*  The necessary route handlers have been setup for us, but we need to complete them.


### Release 1:  Count Requests for each Short URLs
Users are happy with our URL shortening service, but they have requested an additional feature.  When they share a shortened link, they want to know how many times the shortened link is used.

We need to update our application to maintain a count of how many times it receives a request for each short URL.  To complete this feature, we'll need to ...

- update our database table to keep track of visits for each URL.
- update the appropriate route handler, so that any time a short URL is requested, the counter for the appropriate `Url` is updated.
- update the homepage to display the number of times each short URL was requested ([mockup](readme-assets/counter.png)).


### Release 2:  Validate URLs and Handle Errors
We've received some user feedback saying that our short links are broken, sending users to bad URLs.  We've looked into the issue and noticed that users are supplying incomplete URLs.  For example, the user submits "google.com" rather than "http://google.com".  In other words, the problem is with the user input, but it looks like the problem is on our end, and of course, we need to do something about it.

If a user submits an invalid URL, we don't want to provide them with a short URL; instead, we want to alert them to the problem and provide the opportunity to correct the input (see Figure 2).  To accomplish this, we'll add an [Active Record validation][ActiveRecord validations] to our `Url` model.  There are different approaches to determining what constitutes a valid URL.  For our purposes, we'll say that a valid URL begins with "http://" or "https://".

Add an Active Record validation to the `Url` model to validate that a URL begins with "http://" or "https://".

![error animation](readme-assets/show-error-animation.gif)  
*Figure 2*.  Alerting users that a URL is invalid.

As we've learned in [previous challenges][validations intro challenge], when we attempt to save, create, or update an Active Record object, Active Record will first validate the object.  If any validations fail, the object is invalid, and Active Record will not try to write to the database.  But, for each failing validation, Active Record will note the failure in the object's [errors][].  We should leverage our understanding of validations and errors to update the route handler in which we persist `Url` objects.


## Conclusion
Having completed this challenge, we should be familiar with an Active Record object's life cycle events:  validation, save, update, destroy, etc.  We should be able to set up callbacks that execute when one of these events occur.  In this challenge we added a callback that executed before a `Url` object was saved to gave it a short URL.

We should also be able to provide a good user experience when something fails.  For example, in this challenge we built `Url` objects from user input.  But, we had to account for the fact that sometimes users supply invalid input.  We updated our route handler, so that we were able to inform users if something went wrong and provide an opportunity to correct the issue.


[ActiveRecord validations]: http://guides.rubyonrails.org/active_record_validations.html
[bitly]: http://bitly.com/
[errors]: http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errorsactive_record_validations.html#validations-overview-errors
[HTTP status codes]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
[HTTP status cats]: http://httpcats.herokuapp.com/
[rails guides callbacks]: http://guides.rubyonrails.org/active_record_callbacks.html
[validations intro challenge]: ../../../active-record-intro-validations-challenge
[wikipedia 301]: https://en.wikipedia.org/wiki/HTTP_301


