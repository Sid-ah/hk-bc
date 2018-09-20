# P5 Active Record And Sinatra Propagating Validations 
 
##Learning Competencies 

* Use Active Record Validations
* Use the errors object to display Active Record validation errors in the view

##Summary 

In order to protect the integrity of your data, you will often need to prevent
users from creating records with information that doesn't meet your constraints.
A good practice is to inform the user why you did not save the data, and allow
them to correct their errors.

##Releases

###Release 0 : Validations on Model

Use ActiveRecord and Sinatra to allow anyone to create an event, so long as it
passes validation rules.

Add validations to the Event model and show appropriate messages to the user when the validations fail.

1. Prevent Events from being saved when:
  a. The events date is empty, in the past, or is not valid.
  b. The events title is already taken or empty.
  c. The event organizers name is empty.
  d. The event organizers email address is invalid.

#### You Will Know You Are Done When:

1. Invalid Events are not created when the form is posted.
2. The user is informed for each failing validation.
2. The form remains populated with the users input after posting.
3. Bonus points if errors are presented near the invalid form field.

###Release 1 : Validations on UI (optional)
An even better practice is to guide the users input to follow the format your
program expects and/or make your program more flexible regarding the data it
accepts from the user.

Computers should serve people. Not the other way around.

1. Modify the UI so a user is coerced into entering a valid date. Hint: Consider using a Datepicker.
2. Modify the controller or model to be more flexible with the format of dates it accepts while still saving reasonable dates to the database. Hint: look into the rubygem Chronic.

## Resources

* [ActiveRecord validations][]
* [Active record custom validations][custom validations]
* [ActiveRecord's valid? &amp; invalid?][valid invalid]
* [ActiveRecord's errors object][errors]

[ActiveRecord validations]: http://guides.rubyonrails.org/active_record_validations.html
[custom validations]: http://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations
[valid invalid]: http://guides.rubyonrails.org/active_record_validations.html#valid-questionmark-and-invalid-questionmark
[errors]: http://guides.rubyonrails.org/active_record_validations.html#validations-overview-errors
