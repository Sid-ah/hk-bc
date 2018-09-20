# Lucky Ajax

## Learning Competencies

* Use AJAX actions to change views based on asynchronous data 
* Implement synchronous / asynchronous requests in a web application
* Enter into an existing code base and extend it

## Summary

We're going to practice converting a working **Sinatra+ActiveRecord** app into
a **Sinatra+ActiveRecord+jQuery+AJAX** app. Specifically, we're going to take an application that reloads an entire page every time the user submits a form
into one that just updates the portion of the DOM that needs to change.

## Releases

### Release 0:  Up and Running

Download the app and take it for a spin. It's working as-is, just without any AJAX. Be sure you understand how it works before moving on to the next section.

### Release 1: Figure Out What to Change

Before you start writing any code, you should fully understand how the existing
application works and use that understanding to determine which parts of the
code need to change. Specifically:

1. What happens when you click the "Roll the Die" button?
2. What *should* happen instead?
3. Is it necessary to change any of the Sinatra routes?
4. Where should your JavaScript code that handles the AJAX and DOM updates go?

### Release 2: AJAXify It!

The following questions might help you get your bearings:

1. How do you intercept a form submission event using jQuery?
2. How can we prevent the default form-submission-event action(s) from
   happening?
3. How do we do an AJAX post?
4. What should we pass for the `url` argument? How about the `type` argument?
   (*Hint:* the HTML `form` element has this for you!)
5. How do we pass data to the server when making an AJAX call?
6. When the server responds, what code gets run? How do we access the data that
   the server sends back?

If you cannot answer these questions, you'll have a tough time implementing
things. Take your time, use Google, and think it through!

## Resources

* [jQuery AJAX](http://api.jquery.com/jquery.ajax/)
