# Phase 3 Git & Github Workflow

## Always
- Setup [global_gitignore](https://help.github.com/articles/ignoring-files). Make sure you ignore database.yml file and log files.
- We never ever ever submit a pull request with failing tests, like ever.
- Group and Final projects must have [Travis CI](https://travis-ci.org/) setup.

## Basic Git Flow
1. Pull to update your local master
- Work in a branch
- Your work should happen in a series of small and concise commit messages. Basically, your solution shouldn't be a 1 gigantic commit.
- Rebase frequently to incorporate upstream changes on master
- Continuously push your branch to github.
- When you're done with your feature, interactive rebase and squash your commits as appropriate
- Force push your cleaned up branch to Github
- Submit a pull request to have your work reviewed and merged

## Challenges
- Clone the challenge repo.
- Create your own branch using github usernames separated by dashes, e.g. shadi-topher
- Follow [basic git flow](#basic-git-flow)
- We never ever ever push to master, like ever.

## Group & Final Projects
For group and final projects we will be using the "fork" style
Github workflow.  This is the most common workflow for
engineering teams and is an opportunity for you to practice it.

### Setup

1. Create a repository in your cohort organization with: [README file](#readme) and a [license](http://www.slideshare.net/CodeMontage/writespeakcode-open-source-licenses)
* Add a [CONTRIBUTING.md](#contributing.md) file
* Fork the repository to your Github account
* Clone the repository *in your account* to your computer
* Add a "remote" (link) to the cohort organization repository
* Follow [basic git flow](#basic-git-flow)

```
git remote add upstream https://github.com/COHORT_ORG/PROJECT_NAME
```

#### README
README should contain the following:
* Name of project
* Names and github handle for people on the team
* Description of project
* How to install the code locally
* How to use the app

#### CONTRIBUTING.md
This file should outline your agreements on
[pull request workflow](#pull-request-workflow) and [code review
workflow](#code-review-workflow), including who merges pull requests,
and [code style](#code-style).

##### Code Style
For the **final project**, you can choose your own code
style and pull-request workflow.

For the *group project*, use
- Styleguides
	- [AirBnB Ruby Styleguide](https://github.com/airbnb/ruby)
	- [AirBnB JavaScript Styleguide](https://github.com/airbnb/javascript)
- The code reviewer merges pull requests

### Pull Request Workflow
This workflow is required for the Group project.

**Make sure to set your git user and email so you get credit for your work**

1. Create a branch named for the feature you are working on
* Write Code
* Commit your code and write a [good commit message](http://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message)
* Push your branch and changes to your Github repository
* Create a Pull Request to your cohort organization

### Code Review Workflow

1. Another team mate reviews the pull request and writes code comments on Github
2. You make the desired changes (using the [Pull Request Workflow](#pull-request-workflow))
3. Repeat #1-2 until teammate has no more changes that need to be made

**Team should choose who merges Pull requests: code writer or the reviewer.**

### Getting changes

You'll need to get changes that other pairs.  Use the `upstream` remote that we created earlier.

```
git pull upstream master
```
