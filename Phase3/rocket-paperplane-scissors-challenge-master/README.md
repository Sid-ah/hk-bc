# Rock, Paper, Scissors!

## Summary
We're going to build a test suite for an already functioning Rails application.  We'll learn to test the different parts of a Rails app—both what to test and how to test them.  While we normally encourage a test-first approach, in this challenge, we'll be learning to write tests by documenting the behaviors of a working application.

The application allows users to play the game "Rock, Paper, Scissors".  The user chooses to throw rock, paper, or scissors; the computer makes a random throw; and we determine the winner.

How do we determine if the user or the computer is the winner?  It depends on who throws which shape.  Rock crushes scissors, paper covers rock, and scissors cut paper.  So, if the user throws scissors and the computer throws paper, the user wins because scissors cut paper.

As was mentioned, the application does work, but we have a bunch of untested code.  Let's build up the test suite for our app.


### Testing Configuration
Our application's testing setup has been configured to differ from the Rails convention.  We're testing our application with RSpec rather than the Rails default, Minitest.  Our app uses the [rspec-rails][rspec-rails] gem, which provides methods and RSpec matchers specific to testing a Rails app.  We also use [Capybara][] which allows us to simulate a user interacting with our application in a browser and which provides its own set of methods and matchers.

*Note:*  Capybara and rspec-rails are new to us.  We're not yet familiar with the methods and matchers they provide for testing a Rails app.  That's okay.  We'll begin to learn them in this challenge.


## Releases
### Pre-release: Run the Application
We have a fully functional application—we're going to write tests for it.  Before we begin testing the application, let's explore how it works.

1. Clone the repository.
2. Install the required gems: `bundle install`.
3. Set up the database: `bundle exec rake db:setup`
4. Start the application: `bundle exec rails server`
5. Get a feel for the app by playing a few rounds.

*Note:* As you explore the application, you might notice that ties aren't recorded as ties; we'll deal with this later.


### Release 0: Model Specs
Our test suite contains a mixture of passing tests and pending tests.  We're going to work through all of the pending tests, writing them out so that they describe how our application behaves.  We've been working with model specs throughout our time at Dev Bootcamp, so we'll begin this challenge by completing the tests for our `Game` model (see `app/models/game.rb`).  The model includes a number of custom behaviors for which we need to write tests:  one class method and a handful of instance methods.

Model specs are saved in the `spec/models` directory where we'll see some tests already written in the file `spec/models/game_spec.rb`.  Some are passing, and some are pending.  Write out the pending tests to describe the behaviors of the `Game` model.

Run the model specs with `bundle exec rake spec:models`.


### Release 1: Helper Specs
Rails makes helper methods available to our views.  When we test helper methods, we test them as a mixin (i.e., a module that has been included in a class).  In helper specs, `rspec-rails` provides a `helper` object with the module's behaviors mixed in.  All we need to do is call the module's methods on the `helper` object and test their behaviors.

[Helper specs][] are saved in the `spec/helpers` directory.  We have some tests written there for our `GamesHelper` module.  Read through the tests.  Write out the pending tests to describe the behaviors of the helper module's methods.

Run the helper specs with `bundle exec rake spec:helpers`.


### Release 2: Routing Specs
Routing specs test whether or not making an HTTP request to a path results in running a specific controller action.  For example, if we make a GET request to `/games`, we expect to run the `games#index` action.

[Routing specs][] are saved in the `spec/routing` directory.  Looking there in our application, we'll see that routing tests for games have been written.  Read the tests.  Do we understand what they are testing?  Notice that they make use of the `route_to` matcher, which is part of `rspec-rails`.

Run the routing specs with `bundle exec rake spec:routing`.

The tests for the games routes are passing, but we have one pending test that we need to write ourselves.  What controller action is run when we visit the root path?  Write the test to describe which action is run when visiting the root path and then update the test description.


### Release 3: Controller Specs
Controller specs describe what happens when a controller action is run.  So, when a request leads to running the `GamesController#index` action, what does the controller do?

In our controller specs we can describe a number of different behaviors from our controllers.  Which status code is sent back in the response?  Were any instance variables made available to the view?  Was the state of the database changed?  Was a template rendered or was the browser redirected to another page?  Were any values set in the session, cookies, or the flash?

[Controller specs][] are saved in the `spec/controllers` directory.  There we'll see that tests for our `GamesController` have been written.  Write out the pending tests to describe the behaviors of the controller actions.

Run the controller specs with `bundle exec rake spec:controllers`.


***Controller Spec Helper Methods***  
Methods are provided to facilitate testing our controllers.  We can see examples of these in `spec/controllers/games_controller_spec.rb`. We'll briefly cover a couple of them so we get started on the right foot.

The `get`, `post`, `put`, and `delete` methods simulate HTTP requests to our Rails app, calling controller actions that we can then test.  The first argument to these helpers is the action of the controller that should be run (e.g., `:index`). The second argument is a hash to use as the `params` hash for the request, allowing us to, for example, simulate passing form data or provide an id for a resource.  (See Figure 1)


```ruby
# Simulate a GET request to the GamesController#show action.
# For this request, the params hash has the key "id" with value 37.
# An actual request would be a GET request to "/games/37".
get(:show, { id: 37 })

# Simulate a POST request to the GamesController#create action.
# For this request, the params hash has the key "game" whose value is a hash which has a key "user_throw" with the value "paper".
# An actual request would be a POST request to "/games".
post(:create, { game: { user_throw: "paper }})
```
*Figure 1.*  Helper methods simulate requests, allowing us to test our controllers.

We use `get`, `post`, `put`, and `delete` to begin each test, but they don't describe our expectations.  There are other helper methods and [RSpec matchers][] that we'll use to actually describe the behaviors of our controllers.

One of these methods is `assigns`, which lets us check what instance variables were assigned by a controller action. For example, we could test that the `GamesController#show` action assigns a specific game object to the instance variable `@game`.  We can see an example of this demonstrated in Figure 2.

```ruby
# When the GamesController#show action runs
# the instance variable @game should be assigned 
# to a specific game.
it "assigns the correct game as @game" do
  game = Game.create!(user_throw: "paper")
  get :show, { id: game.id }
  expect(assigns(:game)).to eq(game)
end
```
*Figure 2.*  Checking the value of an instance variable assigned by a controller action.


### Release 4: Feature Specs
Feature specs mimic an actual user visiting our site and using our application.  Each feature spec describes a user interacting with our application through the browser for a specific purpose (e.g., registering a new account).  In our application, we might have feature tests for seeing a list of recent games on the homepage, playing a new game, deleting a game, etc.

We rely on the [Capybara][] gem to mimic using our application in a browser.  Capybara provides methods for simulating a user interacting with our site: `visit` for visiting a page, `click_link` for clicking a link, etc. It also provides additional RSpec matchers like `have_content` for testing the text visible on a page.  Read through the docs to discover what all is available to us.

Feature specs are saved in the `spec/features` directory.  We have a few different files, each describing a different feature of our application.  Write out the pending tests to describe how our application works as users interact with it.

Run the feature specs with `bundle exec rake spec:features`.

***Controlling Objects' Behaviors in Tests***  
When we test how our application behaves when a user plays a game, we'll test what happens with a user wins and when a user loses.  When we create the new game, we can control the user throw by what we click on.  But that doesn't control the computer throw.

If our tests rely on the user winning or losing, we can't let the computer throw be random.  If the user throws "paper" and we're testing what happens when the user wins the game, then we need to ensure that the computer throws "rock".  Needing to force certain outcomes in tests is not uncommon.  And to get the outcomes that we want, we can override certain behaviors in our tests.

Let's say we have a specific `Game` object available in a test, and we want to make sure the computer throw for that game is always "scissors".  With RSpec, we could do this:

```ruby
game = Game.new(user_throw: "rock")
allow(game).to receive(:computer_throw).and_return("scissors")
```

This example says, "Hey, if someone calls the method `#computer_throw` on the `game` object, don't actually run the method—instead just return `"scissors"`."

This is particularly useful when we have code with random behavior, like randomly choosing a throw for the computer. We can't write reliable tests if our code has random behavior.  So, we force the outcome we want.

In the case of our feature tests, if we're going to test a user winning and a user losing a game, we need to force a specific computer throw.  However, since the feature test won't have access to any specific `Game` object, we'll override any call to `computer_throw` on any instance of `Game` like this.

```ruby
allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
```

This is an example, but we'll use something like it in our feature tests to force instances of `Game` to have a specific outcome.


### Release 5: Handle Ties
As mentioned in the *Pre-release* section, our application doesn't handle ties well; it declares a winner, even if the game was a tie.  Using *behavior-driven development*, implement the logic to handle a tie.  How ties are handled is up to us.


## Conclusion
Testing is an important skill, so be sure to clear up questions we have about the content covered in this challenge.  It's also important to realize that individuals differ in their opinions about the relative values of each type of test.  Some people will value one type of test more than other people will.  We should leave this challenge with an understanding of what to test in each type of test and familiarity with how to write each type of test.

There are many resources available for learning to test Rails apps, including books like [Everyday Rails Testing with RSpec][] and [Testing Rails][].  The following RailsCasts screencasts are highly recommended.

 - [Request Specs and Capybara][railscasts capybara]
 - [How I Test][railscasts how i test]

As noted in the *Summary*, we encourage a test-first approach to development.  In our careers, it's more likely that we'll be extending or fixing bugs on existing software than adding brand new features. Documenting our code's current functionality with tests is a great way to show team members our conscientiousness and to get feedback on how to improve our approach.


[controller specs]: https://github.com/rspec/rspec-rails#controller-specs
[everyday rails testing with rspec]: https://leanpub.com/everydayrailsrspec
[helper specs]: https://github.com/rspec/rspec-rails#helper-specs
[railscasts capybara]: http://railscasts.com/episodes/257-request-specs-and-capybara
[railscasts how i test]: http://railscasts.com/episodes/275-how-i-test
[routing specs]: https://github.com/rspec/rspec-rails#routing-specs
[rspec matchers]: https://github.com/rspec/rspec-rails#matchers
[rspec-rails]: https://github.com/rspec/rspec-rails
[testing rails]: https://gumroad.com/l/testing-rails
[capybara]: https://github.com/jnicklas/capybara

