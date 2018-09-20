# Continuous Integration for Fun and Profit
#### by Nate Delage

### Continu-what?

__Definition:__ _the practice of frequently integrating one's new or changed code with the existing code repository -Wikipedia_

Merging new code into master often sounds awesome, but we've been learning the value of testing and the importance of a passing test __suite__.

__But,__ as your projects grow, your test suite should grow as well. We're all lazy and forget to run the entire test suite everytime we create a new commit. For large projects, running the entire test suite can take _hours_. So we do what all lazy people do, make a computer do the work for us.

### But Nate, I just wanna merge!

...and I don't want to wait for a million tests to run, don't you realize I have things to do??

### Super Build Server to your rescue

A build server will be responsible to run the entire test suite after every commit and let you know if any tests failed. That way when your change to the `User` model breaks the `Vote` creation integration test, you'll be notified (email) without having to run every test yourself.

If your build passes, then you know you're ready to merge into master.

### Keep master green

As you begin to push your apps to production, you don't want to introduce any bugs in your `master` branch (keep those in your feature branches). With `master` green you can always deploy to production without fear.

### OK. I'm convinced. I can haz build server?

Yes you can. Travis-CI is an automated, hosted build _service_ that we'll be using.

__Requirements__

- a public repository
- `.travis.yml` file (build configuration)
- tests (duh)

__Changes to Your Repo__

1. Create, add and commit a Travis-CI config file, named `.travis.yml`. See the sample `.travis.yml` at the bottom of this Gist.

__Steps on Travis CI__

1. Have the owner of your repo visit travis-ci.org and click the login button in the upper right. Travis-CI will ask you to authenticate with Github so it can view your public repositories.
2. From Travis CI, click on __Accounts__ under your username in the upper right.
3. Here, you'll see a list of your repositories. If you don't see the repository you'd like to test, click the __Sync Now__ button.
4. Once the repository is listed, enable Travis CI with the toggle swtich.

__Steps on Github__

1. Then go back to your repository (on Github) and click the __Settings__ link (on the right hand side-bar).
2. Then click on __Service Hooks__ (left hand side-bar).
3. Scroll wayyyy down and find the __Travis__ hook. Click on it.
5. Click the __Test Hook__ button

Now go back to Travis-CI and within a few moments you should see your tests running. Going forward, your entire test suite will run each time you push a new commit or feature branch up to Github.

### Sample .travis.yml file for a Rails project:

```yml
language: ruby
rvm:
  - 2.0.0
env:
  - DB=postgresql
script:
  - bundle exec rake spec
before_script:
  - bundle exec rake db:create RAILS_ENV=test
  - bundle exec rake db:migrate
  - bundle exec rake db:test:prepare
bundler_args: --binstubs=./bundler_stubs
```

