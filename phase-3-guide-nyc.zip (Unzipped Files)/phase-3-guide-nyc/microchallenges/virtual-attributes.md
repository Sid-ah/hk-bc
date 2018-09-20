# Virtual Attributes

As you already know, in ActiveRecord a model's attributes are determined by its table columns. These properties are also made available to us when generating form fields using the form_for method.

But what about when we want to extend an object so it has properties and form fields that don't correspond to its table columns? For example, how would we add a form field called "tags" for a Question object?

We do so with [virtual attributes](http://railscasts.com/episodes/16-virtual-attributes).

In this micro-challenge, you will add the ability to enter a list of tags within the form for creating a new question, and save those tags (and the relationship to the question) to the database.

Please submit your solution via pull request to your project repo (not the guide). Make sure to include tests.
