## Site Overview

We'll be building a ToDoList site.

The required functionality of the site will be described in more detail in the Releases section,

### All Users

  * Browse all lists

### Unregistered Users

  * Register a new account

### Registered Users

  * Sign in
  * Sign out
  * Create a new list
  * Add a new task to list
  * Have a profile showing completed and uncompleted task

## Release 0: User Registration
 * Users will need to register for a new account. The from should contain email, username, and password. The username must be unique.
 
 * If constraints are met, the user should be considered logged in and redirected to the home page
 
 * If either constraint is not met, the user should see the registration form and error messages

## Release 1: Login/Logout
 * Create a link on the login page, where a user can enter email and password.
 * If email and password match to record, then the user should be considered logged in and redirected to the home page
 * If either constraint is not met, the user should see the login form and error messages


## Release 2: CRUD'ing a Resource

### Creating List
1. The registered user is signed in:
 * A user can create a new List with a name. (add ajax for this part)
 * A user can modify the name of List.

### Creating Task:
1. The registered user is signed in:
   * For existing List, a user can add a new Task with description and status(completed/uncompleted). The default value for status `false`. (You can user checkbox for marking task)
   * A user can delete Task. (add ajax for this part)

   * A user can modify the task. (add ajax for this part)
   
   * A User can complete the task and many tags for task.
  
### Profile Page:
 * On profile page user can see all List.
 * On profile page user can see all completed tasks.

## Additional functionality
 * When a user creates a new Task, a user also can add date, when a task should be completed. If the date is overdue and status of the task still `false` (uncompleted), then show message near task. 'task is overdue'
