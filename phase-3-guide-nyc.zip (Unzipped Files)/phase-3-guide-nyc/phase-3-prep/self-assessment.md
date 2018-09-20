# Assessment

Hello, this is a self-assessment. These all represent skills that you should
have acquired (some of which you should have _mastered_) by the end of Phase 2.

## One:  Paging Dr. Zhivago (Expectation: Very Comfortable)

You have a Doctor `Active Record` class which has many `Patients` through
`Appointments`. Bob the patient schedules an appointment with Doctor Zhivago.
The code below has already run. What one line can you run to schedule an
appointment?

```ruby
zhivago = Doctor.find_by_last_name "Zhivago"
bob = Patient.new "Bob"
# What one line can you run to schedule an appointment?
```

BONUS:  Can you create a new patient named "Pasternak" who belongs to Dr.
Zhivago all in one line?

## Two:  Instruments

A `Doctor` has many Specialties (model class `Specialty`).  A controller action
that associates `Specialty`s to `Doctor`s receives the following params hash

```ruby
params = {:specialties=>[{:name=>"Prussian Flu"}, {:name=>"Viennese Mumps"}]}
```

```ruby
zhivago = Doctor.find_by_last_name "Zhivago"
```

What one line can you run to create multiple specialties for the doctor?

BONUS:  What HTTP protocol should have been used in this interaction?

## Three:  JavaScript

Dr. Zhivago that JavaScript is the bomb so he's studying up after-hours.

While practicing to get the hang of things, Dr. Zhivago thought a worthy
challenge would be to create a simple JavaScript class called `Greeter`.  An
instance of `Greeter` can be initialized with a name.  Invoking `say_hello` on
that instance should use `console.log()` to print out "Hello" to the
initialized name.

Dr. Zhivago wants to initialize his `Greeter` with the name "Lara."

Please write the required code.

THINK DEEPER:  What's bad form about calling the method `say_hello`?

## Four:  REST

Dr. Zhivago decided to build a Sinatra app for storing photos of his patients.
He built his controllers in line with the REST paradigm.

The chart below describes RESTful routes, but is incomplete:

HTTP Verb | Path              | Action  | Used for
--------- | ----------------- | ------- | --------
GET       | /photos           | **1**   | display a list of all photos
GET       | /photos/new       | **2**   | return an HTML form for creating a new photo
POST      | **3**             | create  | create a new photo
GET       | **4**             | show    | display a specific photo
GET       | **5**             | edit    | return an HTML form for editing a photo
PATCH/PUT | **6**             | update  | update a specific photo
DELETE    | /photos/:id       | **7**   | delete a specific photo

List the missing path or action below:

1.  
2.  
3.  
4.  
5.  
6.  
7.  

## Five:  After

Dr. Zhivago has head about AJAX and wants to make his web page update without a
page refresh.  He wants to get a list of his new patients. When the route
`/doctors/:dr_name/patients` receives an asynchronous JSON request, it returns
an Array of JavaScript objects.

Given:

```javascript
$.ajax({
  type: 'GET',
  type: "json",
  url: '/doctors/zhivago/patients'
});
```

Write an implementation that displays the patients.

Option 1:  Print it to the console.

Pro-Version:  Add the names to  `<div id="patients">`.

## Six:  Loneliness Strikes

Dr. Zhivago is looking for romance. He wants to find a lovely lady (`sex`),
from Russia (`country`) whose age (`age`) is between 40 and 50, who has an
(`iq`) greater than 200.  What ActiveRecord request would return all matches?
to help the good doctor find friendship?

As a starter.... `Friend.where....`
