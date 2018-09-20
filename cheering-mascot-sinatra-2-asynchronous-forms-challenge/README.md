# Cheering Mascot 2: Asynchronous Forms

## Summary
In this challenge, we are going to take a functioning Sinatra application and add some JavaScript that will both make an HTTP `POST` request to our server and handle the response that come back from our server.  In doing so, we'll need to build on our understanding of the request-response cycle.  If we don't already grasp how that cycle works, it will be difficult to understand what's going on in this challenge.

The main focus of this challenge is to practice using the [jQuery][] library to make HTTP requests and handle the responses.  In addition, we'll be looking at some related topics:

- Preventing the browser from making its normal HTTP request when a form is submitted.
- Modifying our controllers to behave differently depending on whether a request was made by JavaScript.
- Modifying the DOM.

We should already be somewhat comfortable using jQuery to assign event handlers to specific events—in other words, when the user does *X*, the event, execute *Y*, the event handler.


### AJAX
We are going to write JavaScript that will handle the request-response cycle for us, making HTTP requests and handling the responses.  Normally, when we click a link on a webpage, the browser will take the click as a cue to make a `GET` request.  Or, when we click a form's submit button, the browser will package up the data in the form's input fields and send it as part of a `POST` request.  The browser is designed to listen for these events and take action when they occur.  But, sometimes we don't want the browser to do anything.

Sometimes we want to handle those events ourselves.  And so we write JavaScript to do what we want.  In the case of clicking a link, we'll write JavaScript to make our own HTTP `GET` request.  Or, in the case of a form submission, we'll write JavaScript to package up the form's data and submit the `POST` request—which is what we'll be doing in this challenge.  When we talk about making an [AJAX][] request, this is basically what we're talking about:  making HTTP requests with JavaScript.

### Asynchronous ...
AJAX is an acronym that stands for *asynchronous JavaScript and XML*.

Asynchronous is the important part.  With AJAX, we'll generally be dealing with both making an HTTP request and handling the response sent back from the server.  When we send a request, we don't know how long it will take for the server to respond.  In the meantime, while the server is working to prepare the response to our request, we want our site to continue to be useable; we don't want to shut everything down while we wait on the server.  And whenever that response does come back, we'll to be ready to handle it.

If we need an analogy for asynchronicity, it might be helpful to picture ourselves waiting in line at the deli in a grocery store.  If the deli operates *synchronously*, we might get in line with everyone else and wait for our turn.  While we're standing in line, we might think to ourselves, "Instead of standing here doing nothing, it would be nice if we could continue shopping for the other items on our list until its our turn."

What would an *asynchronous* deli look like?  Rather than asking customers to stand in line, it might use a take-a-number system.  When we arrive as customers we take a number.  We don't know exactly how long it will be before the deli will be ready for us.  But, until it is, we can continue our shopping, and the deli will let us know when it's ready to help us.

When your browser is operating synchronously it has to sit and wait for the
server to respond before it can do anything else.  This is how a browser
normally works; it makes HTTP requests and waits for the responses.  When your browser is operating asynchronously, it can send off a request and continue on its merry way, but it also has to deal with the fact that the response could come back at any moment.


## Releases
### Pre-release: Review the Working Application
As mentioned in the *Summary*, in this challenge we are going to take a functioning site and modify it.  The site is a working version of another challenge, cheering mascot, which you might already be familiar with.

Let's make sure we understand how the code is working.  Specifically, let's trace the request-response cycle when submitting a form.

- What type of request is made?
- To which URL is the request made?
- What data is sent along with the request?
- Which controller action does the request hit?
- What communication is there between the controller and the models?
- What type of response is sent back from the server?
- What data is sent as part of the response?

Feel free to start the server and explore the application.  Once we have a solid understanding of how this application is working synchronously, we can begin to make it asynchronous.

We'll be writing our JavaScript code in the file `public/js/application.js`.

### Release 0: Listen for a Submit Event and Stop the Browser
As mentioned earlier, our browser is designed to listen for form submissions and to take action when a submission occurs.  When we want to write our own JavaScript handler for a particular form's submission, the first thing we need to do is listen for the submission event and stop the browser from taking any action.

For *Release 0*, set up a listener for the form submission.  In the event handler, just prevent the browser from sending its own `POST` request.  In other words, when the user tries to submit the form, nothing should happen.

The following links might be helpful.

- [jQuery documentation: `.on()`][on-doc]
- [jQuery documentation: `.submit()`][submit-doc]

### Release 1: Gather Data from the Form
Once we've stopped the browser from sending its own `POST` request when our form is submitted, we can begin to build our own request.  One task that we'll need to accomplish is to gather the data from the form, so that we can send it with our request.

Recall that when data is sent along with a `POST` request, it is added to the request body as a series of key-value pairs formatted like a query string (e.g., `first_name=Corey&last_name=Haywood`).  We need to provide the key-value pairs, and we have a couple options for how to do so.

```javascript
var data = { first_name: "Corey", last_name: "Haywood" };
```
*Figure 1*. A JavaScript object representing the data to be submitted along with a `POST` request.

One option for gathering the data is to manually build a JavaScript object (see Figure 1); the object's properties and their values would be transformed into a query string.  Another option is to create the query string, using jQuery's [`.serialize()`][serialize-doc] method.

For *Release 1*, with your event handler, after preventing the browser from submitting a request, gather the data for the form using either of the approaches described above.

### Release 2: Build the Request
The jQuery library provides us with methods for making HTTP requests.  One of these methods is [`.ajax()`][ajax-doc].

Think about the data that makes up an HTTP request.  In order to build our request, what information would we need to provide.  We've already gathered the data that we'll send from our form.  What other information is necessary?  What type of request do we want to make, `GET`, `POST`, something else?  To which URL will we make our request?

Read through the documentation on jQuery's `.ajax()`.  It might be helpful to review the [examples](http://api.jquery.com/jquery.ajax/#entry-examples) near the bottom of the page.

For *Release 2*, use the `.ajax()` method to submit a request when the user submits a form—for the time being, we'll ignore the response.  When this is working we should be able to see our request being made in the [Network panel of the Developer Tools][network-panel].

### Release 3: Modify the Controller
Currently, when a `POST` request is made to the `/cheers` path, there's only one possible response:  the server is going to send back a redirect response.

Without JavaScript when the form was submitted in the conventional way, that was a perfectly fine response.  Before we decided to *AJAXify* our site, it was working just fine.  And, if a user has disabled JavaScript in their browser, we would still want to send this response.

So, if the request comes into the server, and it's a normal HTTP request, we want to continue sending back the redirect response.  However, if the request is an AJAX request, we'll want to send back a different response.

```text
POST /cheers HTTP/1.1
Host: localhost:9393
Origin: http://localhost:9393
X-Requested-With: XMLHttpRequest
Content-Type: application/x-www-form-urlencoded; charset=UTF-8

continued ...
```
*Figure 2*. Partial AJAX `POST` request.

How can we tell whether a request is an AJAX request?  In the Network panel, if we take a look at a `POST` request made when our form is submitted with JavaScript, among the headers we'll see `X-Requested-With: XMLHttpRequest` (see Figure 2).  This signals that this request was an AJAX request.

Fortunately, within our controller's request handlers, Sinatra provides us access to an object that represents the HTTP request.  This object is available to use through the variable `request`, and we can [call methods on the request object][request-methods].  We can ask the request if it's an `XMLHttpRequest`, and if it is, our controller can respond appropriately.

In this situation, what would an appropriate response to an AJAX request be?  We want to change the text on the mascot sign depending on the cheer name submitted in the form.  So, we probably just need the controller to send us back the text to put on the sign.

![](readme-assets/screenshot-ajax-response-network-panel.png)

*Figure 3*.  Developer Tools Network panel showing response to AJAX request.

For *Release 3* update the controller handler for `POST` requests to `/cheers`, so that for AJAX requests, the controller's response is just the text to put on the mascot sign.  When this is working, in the Network panel of the Developer Tools, we should be able to look at our request and then look at the response and see just the text on the sign (see Figure 3).

### Release 4: Handle the Response
Now that we're getting an appropriate response back from the server, it's time to do something with it.  We need to add the text returned from the server to the DOM.

We'll need to determine what exactly we want to happen once we receive the response from the server and translate that to code.  When we call `.ajax()`, we can chain other method calls that determine what should happen if the request succeeds, if it fails, or what should always happen.

- `jqXHR.done(function( data, textStatus, jqXHR ) {});`
- `jqXHR.fail(function( jqXHR, textStatus, errorThrown ) {});`
- `jqXHR.always(function( data|jqXHR, textStatus, jqXHR|errorThrown ) { });`

  *Copied from the jQuery docs. `jqXHR` refers to [the object returned][jqxhr-doc] by the `.ajax()` method.*


Notice that each of these methods takes a callback function as an argument.  In the case of `.done()`, the callback function we pass to it is executed when our request was successful.  When the callback function is executed, it is passed three arguments:  `data`, which represents the response body; `textStatus` (e.g. `"success"`); and `jqXHR`.  The `.ajax()` [examples](http://api.jquery.com/jquery.ajax/#entry-examples) demonstrate how to use these methods.

For *Release 4*, if our request is successful, take the text that is returned from the server and add it to the DOM, so that it appears to be on the sign.  If there is already text on the sign, it will need to be replaced with the new text.

### Release 5: Reset the Form
We want to be able to call one cheer after another.  It would be a lesser user experience if we had to manually remove cheer names.  So, after the form has been submitted, we always want to do two things:

- Clear the value of the input field.
- Set the focus on the input field.

For *Release 5*, after we submit the form, the value of the input field should be reset and focus should be set on the input field, so that we can enter a new cheer name without first clicking on the input field.


### Release 6:  Check Functionality without JavaScript

As noted in previous releases, when we enhance our application with JavaScript we don't want to break non-JS
functionality.  So, turn off JavaScript in the browser (see Figure 4) and manually test that the site still works.

![disabling JavaScript](readme-assets/disable-javascript.gif)  
*Figure 4*.  Disabling JavaScript from the Chrome Developer Tools (Chrome Version 51.0.2704.106 (64-bit))

### Release 7: Reenable JavaScript

Enable JavaScript. Otherwise, you or a cohort-mate will find a nasty surprise tomorrow when you try to use a computer where JavaScript is disabled. Many JavaScript developers have burned way too much time debugging because they'd disabled JS and forgotten to reenable it.

## Conclusion
Welcome to the world of AJAX.  Making HTTP requests through JavaScript—whether to submit a form, dynamically load content, etc.—offers a great way to enhance our applications.  Both to improve their performance and to improve user experience.

Having completed this challenge, we should have a basic understanding of the request-response cycle in the context of JavaScript (i.e., AJAX requests).  And while we'll need more practice to increase our familiarity with the jQuery API for making AJAX requests and handling responses, we should be familiar with the methods and syntax used to make AJAX requests (e.g., `.ajax()` and the methods that allow us to handle the responses to our requests (e.g., `.done()`).




[jQuery]: http://jquery.com/
[AJAX]: http://en.wikipedia.org/wiki/Ajax_%28programming%29
[on-doc]: http://api.jquery.com/on/
[submit-doc]: http://api.jquery.com/submit/
[serialize-doc]: http://api.jquery.com/serialize/
[ajax-doc]: http://api.jquery.com/jquery.ajax/
[jqxhr-doc]: http://api.jquery.com/jquery.ajax/#jqXHR
[done-doc]: http://api.jquery.com/deferred.done/
[fail-doc]: http://api.jquery.com/deferred.fail/
[always-doc]: http://api.jquery.com/deferred.always/
[network-panel]: https://developer.chrome.com/devtools/docs/network#network-panel-overview
[request-methods]: http://www.sinatrarb.com/intro.html#Accessing%20the%20Request%20Object
