## Lil' Twitter

## Learning Competencies

- Build a client-side-heavy Rails application.
- Consume a JSON API.
- Build Single Page App.
- write organized JavaScript code

## Summary

Your mission: build a one-page app using  Javascript to render a simple dashboard for a twitter application. The HTML, CSS, and back-end are already written for you -- all you need to do is write the JavaScript.

## Development Setup

requires ruby and rubygems.
```sh
$ bundle install
$ rake db:create && rake db:migrate && rake db:seed
$ rails server
```

## Releases

### Release 0: Architect

We'll be making a single page app, which means we never refresh. All of this will be accomplished using JavaScript. Check the Endpoint Documentation at the bottom of this document to see what data you can request from the server, then look at the Rails app to examine the specific controllers and routes that will allow your Javascript code to send and receive data from the server. You might even hit some of those routes directly in your browser to see what they return.

Your site needs to have the following functionality:

#### Milestone 1

> - Determine what should be a component on the page
> - React componentize the different parts of the app (use hard coded data where possible)

#### Milestone 2

> - On page load, the 50 most recent tweets are displayed in the 'river' running down the middle of the page.
> - On page load, the 10 most popular hashtags are displayed.

#### Milestone 3

> - A user can create a tweet, which will get saved into the database with a fake username, fake handle, and fake avatar (which is all handled server-side).
> - The new tweet should appear atop the 'river', preferrably with some sort of animation.
> - Any hashtags the tweet includes (e.g. #yolo), should also be associated with that tweet.

#### Milestone 4
> - A user can search for a specific hashtag using the search bar. The results of the search will be displayed in the river, replacing whatever was there before.
> - If the user searches for a hashtag that does not exist, the search bar turns red.


#### Milestone 5
> - A user can click on a hashtag in the trends box, which causes the river to display all tweets that are associated with that hashtag, replacing whatever was there before.



### Release 1: Composition

Componentize the different parts of the application. Use hard coded values where it is necessary (i.e. timeline).

Each component should have one responsiblity which is defined subjectively. From experience, you will have a better intuition of when a component should be broken into smaller components. In the meantime, I would caution you to not over componentize your app. It's better to have larger components that can be refactored later rather than consolidating a bunch of smaller components.

You should avoid any changes to the server-side code, although if you feel like changes are necessary, implement them and make sure the tests reflect your alterations. You will need to remove the filler elements in `app/views/index.html`. Structural changes to HTML and CSS should not be necessary.

As an example, here's a diagram that shows how you might think about the functions that control your views and how they might work together.

![views diagram](doc/views.png)

### Release 2: Fetching Data from the Server

Incorporate AJAX requests to replace the hard coded data from Release 1. You will need to utilize [React State and Lifecycle Methods](https://facebook.github.io/react/docs/component-specs.html).

To accomplish this release, you will also have to understand how to access different data sources from our API. Below is the documentation, but if this was not provided we could check out Rails route.


### Release 3: Creating Data on the Server

Add event handlers to the TweetBox form to submit a new Tweet to the database and update the UI without having to refresh the page or refetch from the server.

Tip:
- Components are not aware of each other. However if they are nested under a parent component, the parent could faciliate the data flow.
- Remember that functions in JavaScript are treated like any other data type (aka "First Class Citizens"), so they could be passed as props from the parent component to the child component.

### Endpoint Documentation

`GET /tweets/recent` returns the 50 most recently created tweets in JSON format. The response body looks like this:

  ```json
[
   {
      "avatar_url":"http://robohash.org/marco_schumm",
      "content":"Ut fugit ut labore repellendus.",
      "created_at":"2014-07-20T20:27:42Z",
      "handle":"@marco_schumm",
      "id":500,
      "updated_at":"2014-07-20T20:27:42Z",
      "username":"Adaline Bins",
      "hashtag_names":[
         "est",
         "rerum",
         "distinctio"
      ]
   }
]
  ```

`GET /tweets/search/:hashtag` returns the 50 most recent tweets associated with the given hashtag, with a format similar to the `/recent` endpoint. Will return an empty body with a status code of 404 if the hastag does not exist.

`POST /tweets` creates a new a tweet and associates it with the specified hashtags, if provided. Hashtags that did not previously exist are also created. a request body should take this format:

```json
{
   "tweet":{
      "avatar_url":"http://robohash.org/marco_schumm",
      "content":"Ut fugit ut labore repellendus.",
      "handle":"@marco_schumm",
      "username":"Adaline Bins"
   },
   "hashtags":[
      "foo",
      "bar",
      "baz"
   ]
}
```

If no data is provided for avatar_url, content, handle, or username, fake data is used instead.

The endpoint returns the created tweet as JSON.

  ```json
{
   "avatar_url":"http://robohash.org/Margot Morar II",
   "content":"This is my new tweet",
   "created_at":"2015-07-10T22:18:20Z",
   "handle":"@royal",
   "id":503,
   "updated_at":"2015-07-10T22:18:20Z",
   "username":"Margot Morar II",
   "hashtag_names":[
      "foo",
      "bar",
      "baz"
   ]
}
  ```

`GET /hashtags/popular` returns the names of the 10 most popular hashtags. The output looks like this:

```json
[
   {
      "hashtag_count":"39",
      "name":"labore"
   },
   {
      "hashtag_count":"35",
      "name":"ratione"
   },
   {
      "hashtag_count":"35",
      "name":"architecto"
   },
   {
      "hashtag_count":"33",
      "name":"vero"
   },
   {
      "hashtag_count":"32",
      "name":"ut"
   }
]
```

### Stretch

Add any or all features to your application:

 - add a system for checking if new tweets have been created since page load, using long-polling.
 - have the river of tweets only display 10 tweets, and dynamically load more when the user scrolls to the bottom of the page.
 - give the user the ability to click hashtags inside tweets, which would display tweets associated with that hashtag.
