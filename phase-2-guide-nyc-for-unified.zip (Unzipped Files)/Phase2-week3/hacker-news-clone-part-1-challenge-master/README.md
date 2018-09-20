# Hacker News Clone Part 1

## Learning Competencies

* Use the MVC pattern in web applications with proper allocation of code and
  responsibilities to each layer
* Implement CRUD in an MVC application
* Implement user login and authentication in a web application

## Summary

We're going to build a [Hacker News][] clone in Sinatra.  This will be the most
fully-featured web application we've built so far.  Excited?!

## Part 1: Users, Posts and Comments

Design the flow to be as similar to [Hacker News][] as possible.  We'll add one
exception: comments don't need to be threaded.  But the rest should be similar
to Hacker News: users, posts, and comments.  Do not implement votes in this
version.

## Releases

### Release 0: Wireframes

This application is big enough you should spend time wireframing it.  Wireframe
the following pages:

1. An index page listing all the posts
2. A page showing a particular post, including comments
3. A user profile page
4. A page showing all a user's submissions
5. A page showing all a user's comments
6. A user signup and login page

### Release 1: Models &amp; Controllers

At the very least you should have the following models:

1. `Post`
2. `User`
3. `Comment`

Don't worry about threaded comments, unless you're feeling adventurous.  Even
if you are feeling adventurous, trying to implement threaded comments now might
derail your momentum: wait until you have a non-threaded version working before
you try your hand at a threaded version.

Also, don't worry about Hacker News' fancy sorting algorithms for the post
homepage and comment threads.  Just sort them in some simple way:
chronologically, alphabetically, etc.

#### Routes

Give some thought to your controller routes before creating them. Consider
following the RESTful routing convention instead of coming up with your own
convention. Here are some routes to get you thinking in a RESTful way:


|                             | HTTP Verb | URL                 |
|-----------------------------|-----------|---------------------|
| View all posts              | GET       | /posts              |
| View a single post          | GET       | /posts/:id          |
| Add a comment to a post     | POST      | /posts/:id/comments |
| View all comments by a user | GET       | /users/:id/comments |


### Release 2 : Views

Implement all the views.  Don't worry about AJAX at first.

<!-- ## Optimize Your Learning -->


## Resources

* [Hacker News][] -- *protip: don't read the comments on social issue posts*


[Hacker News]: http://news.ycombinator.com
