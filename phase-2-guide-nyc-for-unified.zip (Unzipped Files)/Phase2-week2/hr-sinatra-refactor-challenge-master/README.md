# HR Refactor Challenge

Sorry friends, this app is a a hot mess. The previous developers have left and
it's up to you to rescue this total hack of a Human Resources web app.

Apply the best practices you've learned to get this app following conventions.
Below is a list of items that need your attention. Don't hesitate to make
additional improvments, this list is not exhaustive.

### Authentication
* Add login page
* BCrypt

### Models & Schema
* Change evaluations method in User to assocation
* Drop salaries table, combine with positions
* Add validations to position & evaluation
* Validate annual salary is not < 30K and > 100K

### General Usability
* Navigation Links
* Filter out past employees (who don't have a current position)
* General styling & formatting please!
* Add a budget page that displays stats about the current salary expenses
* Create a filtered list of Users currently on probation
* None of the routes follow REST conventions.
* Adding a new user doesn't work!

### Positions show page
* format date to something more human readable
* Don't show ended\_at if not present
* Format salary as number with '$' symbol
* Display the percentile of the salary compared to the rest of the company
* List the number of days in that position
* Split evalution paragraphs so that each line is in a paragraph tag

### New Evalution form
* textarea for summary
* Replace new evaluation form probation input with checkbox

### Add Evalution Route
* Replace ugly probation ternary
