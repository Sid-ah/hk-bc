# DBC Sinatra Overflow

## Summary

We're going to build a substantial Sinatra application from the ground up: a [StackOverflow](http://stackoverflow.com) clone.  The goal of this challenge is to build a well-structured Sinatra application with a good mixture of front-end and back-end features.  Focus on defining clear routes, creating clean templates, and enhancing your application with AJAX.  Before we jump in, peruse StackOverflow to understand its core features.

### Objectives
The requirements for the application are listed below.  They are deliberately ambiguous.  This gives us both flexibility in our implementation and because clarifying ambiguous requirements is at least 30% of an engineer's job.  At. Least.

- Users can post questions.  Other users can answer them.
- Users can comment on both questions and answers.  Like StackOverflow, the comments should just be displayed in a flat list.
- The user who posted a question can declare one of the user-submitted answers to be the best answer.
- Users can upvote and downvote questions, answers, and comments—only one vote per user for each question, answer, and comment.
- Users cannot add a question, answer, or comment or vote unless they're logged in, but they can view all of the above when logged out.
- *Stretch:*  Sort answers with the answer selected as the best answer first, followed by the most highly voted.  Sort comments chronologically with oldest first.
- *Stretch:*  Users can see questions sorted three ways: highest-voted, most recent, and "trending".


## Releases
### Release 0:  Strategy and Team Norms
Before diving too deeply into the code, our team should be clear on three things:

1. Set expectations for the project.
2. Decide on our MVP.
3. Break the MVP down into user stories and deliverable features.


Once we've broken the application down into user stories/features, we should set up an electronic tracking application to track our progress in building out each of them.  [Trello][] and [Pivotal Tracker][] are examples of electronic tracking applications.

*Optionally*,  we can integrate a chat application into our workflow (e.g., [Slack][] or [HipChat][]).  Many teams find it helpful to create a chat environment—especially those that work remotely.  Combine a chat environment with hygienic git behavior, GitHub, and continuous integration and developers can work as well separated by miles as while standing in the same room together.


### Release 1:  The First Commit
Our team needs to create a new repository inside of our cohort's GitHub organization.  Before we do anything else, our first commit should be a `README.md` containing:

 * The name of our team.
 * The names of the team members.
 * The user stories that define our MVP.


### Release 2:  Build the StackOverflow Clone
Unlike most other challenges, developing this application is not broken down into smaller releases.  Fortunately, we have already done the work of breaking the application down into user stories and features.  Now, we need to implement them.

The following subsections will provide some additional guidance for us.

***Git Workflow***  
We should follow a good git workflow.  We should always work on branches and commit often.  Team members should not merge their own pull requests.  Each pull request should be reviewed by at least one other member of the team before being merged.

- [Git Workflow for Teams](https://gist.github.com/mikelikesbikes/ccbf4c7fd90e647138c6)
- [Git: Rebase vs Merge](https://www.atlassian.com/git/tutorials/merging-vs-rebasing/)
- [Git Resources](http://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)


***Polymorphic Associations***  
Where do we store data for votes?  Questions, answers, and comments can all be voted on.  So, we could have three separate vote-related models and tables.  For example, a `QuestionVote` model with a `question_votes` table.  This would result in three very similar tables all holding data on votes.

Or, we could write polymorphic associations, in which case we would consider our question, answer, and comment models each as a *votable*, something on which votes are cast.  This would allow us to have just one `Vote` model with one `votes` table.  To make this work, the `votes` table would need to contain a column that indicates for what type of model the vote was made.  Was it for a question, answer, or comment?  Consult the [RailsGuides][polymorphic associations] and the [Rich on Rails][rorpa] blog for further details.

Likewise, a comment can be made on either an answer or a question.  This offers another opportunity to use polymorphic associations.

The decision to make use of polymorphic associations is up to our group.  We are not required to dive into this new concept right now.  It is 100% possible to simply have `answer_votes`, `question_votes`, and `comment_votes` tables to store the different types of votes and `answer_comments` and `question_comments` tables to store the different types of comments.


***AJAX***  
We need to practice our new AJAX skills, and our application should have multiple AJAX calls to enhance the user experience.  Our team should decide which specific pieces of functionality we want to AJAX.

A good place to start is AJAXing the voting functionality.  Instead of refreshing the page when a user upvotes or downvotes, we just want to make an AJAX call to our server to send that info and update the vote count on our page.


### Release 3:  Demos
We will be demonstrating our MVP to the rest of our cohort.  We'll be expected to run through the essential features of our application.


## Conclusion
This multi-day challenge is a good taste of how final projects operate.  In addition to reflecting on how we performed with regard to the technical aspects of the challenge, how was it to work on a group project of this scale?  What went well?  Where are there opportunities to grow?


[cls]: http://en.wikipedia.org/wiki/Command-line_interface
[HipChat]: https://www.hipchat.com/
[mock schema design]: readme-assets/three-vote-tables.png
[Pivotal Tracker]: http://www.pivotaltracker.com/
[Polymorphic associations]: http://guides.rubyonrails.org/association_basics.html#polymorphic-associations
[rorpa]: http://richonrails.com/articles/polymorphic-associations-in-rails
[Slack]: https://slack.com/
[Trello]: https://trello.com/
