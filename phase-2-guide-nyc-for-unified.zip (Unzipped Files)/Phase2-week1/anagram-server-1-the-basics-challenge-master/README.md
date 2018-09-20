# Anagrams Web Application

## Summary
We're going to write a web application backed by a database.  Users will provide a word, our application will access the database to retrieve anagrams for that word, and the anagrams will be listed for the user.

As we build the application, be mindful of how data flows between the client and server. The browser will be sending data via HTTP requests to Sinatra, what should that data be? After the server receives data, a controller route handler will need to ask a model to fetch anagrams. The route handler then renders a view for the data returned by the model. Finally, the server returns that rendered HTML to the browser.


## Releases
### Pre-release: Install Gems
Ensure that the gems required for the application have been installed.  From the command line, run `bundle install`.


### Release 0: Create a Model and Migration for Words
If we're going to search a database for a given word's anagrams, we'll first need to store some words in the database.  Create a database with a `words` table and a model to represent words in Ruby.


1. Use the provided Rake tasks to generate a `Word` model and to generate a `create_words` migration (see `Rakefile`).

2. Write the migration to [create][create_table] the `words` table. What data does the table need to store?  We'll need to store each of the words listed in the file `db/fixtures/abridged_word_list.txt`.

3. Use the provided Rake tasks to create and migrate the database.


### Release 1: Seed the Database
We have a `words` table in our database.  Now we'll insert some initial data into the database; this is called *seeding* the database.  The data with which we'll seed our database is stored in the file `db/fixtures/abridged_word_list.txt`.  We need to save each word in that file as a word in our database.

Write the code that will seed our database in the file `db/seeds.rb`.  The code for reading the file with our word list has been provided.  We need to specify how to save each line from the file as a `Word` object in the database.

To execute the code in the file `db/seeds.rb`, run the provided Rake task:

```text
$ bundle exec rake db:seed
```

### Release 2: Word Model Finds Anagrams
Our application needs to find anagrams for a given word.  Our `Word` model will be responsible for this behavior.  An instance of the `Word` class will return anagrams of itself:

```ruby
class Word < ActiveRecord::Base
  def anagrams
    # Returns a collection of Word objects that are anagrams
    # of the instance on which the method is called.
  end
end
```


### Release 3: Show a Word's Anagrams
We're going to start developing our web application by allowing users to view the anagrams for a word. When users visit a URL like `http://localhost:9393/words/leaps`, the given word's anagrams should be listed (see Figure 1).  The provided route handler and view are partially working.  We need to complete them.  Make use of the `Word#anagrams` method that we wrote in *Release 2*.

*Note:* Remember that our database has a limited number of words (e.g., leaps, melon, etc.), so we won't be able to find anagrams for all English words.  If we want a more exhaustive list of words in our database, we can reseed the database using the file `db/fixtures/word_list.txt`.

![mockup animation][word page animation]

*Figure 1*.  Displaying the anagrams for a given word.


### Release 4: Request Anagrams Using a Form
To view a word's anagrams, users currently must manually enter a URL.  Add a form to the homepage that allows users to provide the word whose anagrams they'd like to see. (see Figure 2)

![mockup animation][form animation]

*Figure 2*.  Use a form to ask for a word's anagrams.


### Release 5: Add the Form to the Word Page
The form on the homepage is handy, but it's still cumbersome to view multiple words' anagrams.  To facilitate bouncing from word to word, add the form from the homepage to the word page.  (see Figure 3)

In accomplishing this, we're going to use a partial—we might be asking, "[What is a partial?][partials in sinatra]" (see cheat sheet tab).  Begin by moving the code for the form from the homepage into a partial and then include that partial on the homepage.  Using the partial should not change how the page displays in the browser.

Once we have our partial working, include the partial on the page which lists a word's anagrams.

*Note:* Be more concerned with the functionality of the form than getting it to display exactly as shown in the mockup.

![mockup animation][form on page]

*Figure 3*.  Form added to the page showing a word's anagrams.


## Conclusion
We've built a web application backed by a database.  Can we trace how data flows through our application?  When our server receives a request to show a word's anagrams, what happens?  What are the responsibilities of the model, view, and controller?


[create_table]: http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-create_table
[form animation]: readme-assets/form-animation.gif
[form on page]: readme-assets/form-on-page.gif
[word page animation]: readme-assets/word-page-animation.gif
[partials in sinatra]: https://www.learnhowtoprogram.com/lessons/partials-in-sinatra#cheat-sheet
[sinatra_partials]: http://www.sinatrarb.com/faq.html#partials
