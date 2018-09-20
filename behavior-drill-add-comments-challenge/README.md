# Behavior Drill: Add Comments


## Summary
We have a webpage that displays an article and a few user comments.  We want users to be able to add new comments, and we're going to write the JavaScript to implement this feature.  The finished product should behave like the page seen in Figure 1.

![adding comments](readme-assets/add-comments.gif)  
*Figure 1*.  Demonstration of adding comments behaviors.

*Note:* Normally, when users submit comments, we want to persist the data in a database. We're going to bypass that feature in order to focus on handling events and updating the DOM.


### Helpful jQuery Resources
This is one of the more complex behavior drills.  There are a few different moving parts we need to coordinate.  We'll rely on a JavaScript library to help us.  The library is [jQuery][].

These links should be useful in helping to complete this challenge.

- [jQuery Event Basics][]
- [Handling Events][] (e.g., a form `"submit"` event)
- [event.preventDefault()][] (e.g., to prevent the default form submission behavior)
- [.appendTo()][] / [.append()][]
- [.val()][]


## Releases
### Release 0: Implement Adding Comments
We'll do the vast majority of our work in the JavaScript file `application.js`.  HTML is provided in the file `index.html`; don't modify anything inside the `<body>` tag. CSS is also provided, and should not be modified.  Implement the behavior in Figure 1:

- When the user clicks the *New Comment* button, 
  - the button is hidden.
  - the comment form appears.
- When the user submits the form,
  - the data from the form should be added as a comment to the end of the comment list.
  - the form fields should be reset, so that the next comment can be added.
  - the form should be hidden.
  - the *New Comment* button should reappear.

Be sure to follow the specifications and remember to take it slow.  Test the code frequently, make small iterations, and write elegant code.

_Note:_ Don't worry about deleting comments until Release 2.

### Release 1: Handle Empty Form Fields
What happens if a user submits the form without adding any data in the form fields?  We just add empty comments to the comment list.  Let's update the comment-adding behavior to control for missing content:

- Prevent empty comments from appearing in the comment list.  When a user submits the form, only append the new comment if the user has entered some text into the form's text area.
- Allow anonymous comments.  If a user submits the form without providing a name, attribute the comment to *Anonymous*.

### Release 2: Deleting Comments

The "Delete Comment" button is currently not functional. It'll be up to you to make it work.

When a "Delete Comment" button is clicked, that comment should be removed from the DOM (thus removing it from the page).

The "Delete Comment" button needs to work both for the existing comments, as well as any comments we add via our comment form in the future. Be sure to test both.

You may want to revist the jQuery page about [Handling Events][], including the section on binding elements that will be rendered in the future.

## Conclusion
Handling events and manipulating the DOM are crucial JavaScript skills.  Are we confident in our understanding of how to listen for events?  What about how to handle events?  How to pull data from the DOM?  How to update the DOM?  Get clarity around these issues.


[.append()]: http://api.jquery.com/append/
[.appendTo()]: http://api.jquery.com/appendTo/
[.val()]: http://api.jquery.com/val/
[event.preventDefault()]: http://api.jquery.com/event.preventDefault/
[Handling Events]: http://learn.jquery.com/events/handling-events/
[jquery]: https://jquery.com/
[jQuery Event Basics]: http://learn.jquery.com/events/event-basics/

