# Blog 2: Authentication and Authorization

## Summary
In this challenge, we're going to add a feature to a blog application similar to the one that we built in the [*blog-1-anonymous-blog-challenge*][blog-1-challenge].  In that challenge, anyone could visit our site and write, edit, or delete a blog entry.  In this challenge, we're going to restrict what users can do on our site, depending on whether they're registered users and, if so, which users they are.

### Authentication and Authorization
The focus of this challenge is on who has permission to do what in our application.  Think about sites like Facebook and Twitter.  We need to register with each site before we can post status updates or tweet.  What happens after we post some content?  Can just anyone edit it or delete it, or is that behavior restricted to us as the content's author?


## Releases
### Pre-release: Setup
Before we begin implementing authentication and authorization, we need to set up the site.  The provided codebase is for a functioning one-model CRUD application:  a blog site.  Let's browse through the code, taking a look at the models, controllers, helpers, views, migrations, etc.  Then, after creating, migrating, and seeding the database, let's open the application in the browser.

*Note:* If we want to run any tests, we'll need to prepare the test database using the `db:test:prepare` Rake task.


### Release 0: User Signup
Let's begin by adding a user authentication feature.  All we want to do for this particular release is to allow users to register for our site, login, and logout.

When users signup, they will provide a username, e-mail address, and a password; they will login with their e-mail address and password.

We'll need to add a table in our database to hold user data.  Think about what constraints we should place on our database.  Do we need to add any indexes for quick lookup?  Should any fields be required and/or unique?  We'll also need a model to represent users in our applications.  Does our model need any validations?

**User Interface Changes**
- When no user is logged in, links to register and login should appear in the navigation options (see [mockup](readme-assets/auth-nav-no-user.png)).
- When a user is logged in, the user's username and a link to logout should appear in the navigation options (see [mockup](readme-assets/auth-nav-user.png)).
- When a user clicks the link to register, they should be taken to a page with a form for submitting their username, e-mail address, and password (see [mockup](readme-assets/registration-form.png)).  We'll need a similar page for login.
- If something goes wrong during registration, the user should be alerted to the problem (see [mockup](readme-assets/registration-form-show-errors.png)).  Similar feedback should be provided if logging in fails.


### Release 1: Restrict Writing Entries to Registered Users
In this release, we're going to begin to introduce authorization into our application.  Users can already register, login, and logout.  We now want to modify our application so that only users who are registered and logged in are able to create new entries.

We'll modify our user interface to hide links to the new entry form from guest users.  Just updating our user interface isn't enough.  What happens if a user navigates to the new entry form, not by clicking a link, but by entering the URL directly?  What if someone makes a request to create a new post from the command line?  Can we catch these in our route handlers?

**User Interface Changes**
- When no user is logged in, any links to the new entry form should be removed (see [user logged in mockup](readme-assets/auth-nav-user.png) and [no user mockup](readme-assets/no-user-no-link-to-form.png)).  Links for editing and deleting a post should also be hidden.
- If a request is made to get the new entry form page, to get the edit entry form page, to create a new entry, etc. but there is no user logged in, then the response should alert users that something went wrong (see [mockup](readme-assets/something-went-wrong.png)); this is already the behavior if any user tries to access an entry that does not exist.


### Release 2: Restrict Editing and Deleting to Entry Author
Our next step in adding authorization to our application will be to limit who can edit and delete a particular entry.  We want only an entry's author to be able to edit and delete it.

This means that we'll need a way to associate users with entries.  When a user creates a new entry, that new entry should be associated with that user.  Do we need to make changes to our database to support this behavior?  Do we need to update our models?  What about our controllers?

**User Interface Changes**
- The entry's author should be displayed next to the time an entry was written (see [mockup](readme-assets/index-show-author-username.png)).
- Only an entry's author should be able to see any links to edit or delete it.
- Unless the user making the request is the entry's author, if a request is made to get the edit entry form page, to update an entry, to delete an entry, etc., then the response should alert users that something went wrong (see [mockup](readme-assets/something-went-wrong.png)).


### Release 3: Show Entries by Author
Now that we can associate users and entries, let's allow users to see entries written by a particular user.  We'll want to use a nested route, something like `/users/:id/entries`—depending on your model names.  When we visit such a route, we'll see a list of all entries written by that particular user.


**User Interface Changes**
- Usernames should appears as links to a page showing all the entries written by that user (see [mockup](readme-assets/usernames-as-links.png)).
- The page showing all a particular user's entries should look similar to the page showing the most recent entries (see [mockup](readme-assets/user-entries.png)); we don't need to use the username as a link, since we're already on the page.
- If a user attempts to see the entries written by a user that doesn't exist, then the response should alert users that something went wrong (see [mockup](readme-assets/something-went-wrong.png)).


## Conclusion
Authorization is an important part of designing the user experience of a web application.  We need to control who can do what in our applications.  Sometimes we'll have behaviors limited to a small group of users (e.g., administrators).  Other times, we'll want to help protect user content, as we've done in this challenge.  When we do this, we want to be thorough and close any loopholes we can think of.  It's not enough to simply hide links on our webpages.  We need to look at our controllers, too.

[blog-1-challenge]: ../../../blog-1-anonymous-blog-challenge
