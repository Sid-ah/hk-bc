# Hospital Interface 
 
## Summary 
We're going to build an interface for interacting with hospital data—simplified, fake hospital data ... no [HIPAA violations][wikipedia hipaa privacy].  This is a fairly open-ended challenge.  The expectations are loose, so we'll be making most of the decisions about how to design and build our program.  We'll talk things out as a pair, go to the whiteboard, maybe argue about naming, and of course, have fun!  The world is our oyster, as it were.

The goal of this challenge is to explore the utility of object-oriented design.  We'll should end up building multiple classes.  Our classes should be well-defined with a single responsibility.  The classes should have clean, flexible interfaces that allow for objects to effectively send messages to each other.  And, as always, we should use effective naming conventions.


### Create Objects as We Go
In the real-world, the data for our application would almost inevitably reside in a database.  We'll get to working with databases soon, but for this challenge, we'll just have to make up data as we go.  As an example, if we were building an animal shelter application and needed to list the pets at a shelter, we'd have to make objects to represent the shelter and the pets (see Figure 1).  We'll be doing to same thing for our hospital application:  creating objects representing fake patients, fake patient records, fake doctors, etc.

```ruby
shelter_animals = [
  Dog.new({ :name => "Jayda" }),
  Cat.new({ :name => "Bailey" }),
  Dog.new({ :name => "Tenley" }),
  Bird.new({ :name => "Tito" })
]

shelter = AnimalShelter.new({ :name => "Not a Pound", :animals => shelter_animals })
```
*Figure 1*.  Creating an animal shelter with animals—an example for creating objects to use later.


## Releases
### Release 0: Display All Admission Records
```
Admit Time         Discharge Time     Patient Name      Attending Physician
===========================================================================
2016-01-01 16:45   2016-01-02 12:30   Mavuto Beutel     Yaffe Kappel
2016-01-01 19:10   2016-01-05 11:45   Ufuoma Lane       Yin Hou
2016-01-02 01:05   2016-01-02 20:00   Aaren MacAngus    Ellar Pearce
2016-01-02 14:45   2016-01-06 12:15   Brad Patterson    Ellar Pearce
2016-01-03 16:30   2016-01-04 12:20   Agata Polzin      Yin Hou
2016-01-03 16:35                      Aaren MacAngus    Yaffe Kappel
2016-01-04 10:45                      Mavuto Beutel     Yaffe Kappel
```
*Figure 2*.  Example admission record output, showing all records.

We'll start building our application with a feature that displays patient admission records.  When our application runs, all admission records are displayed.  The output should resemble Figure 2, but it does not need to be an exact copy.

As was written in the *Summary*, we'll decide how to design and build our program.  The only requirement is that we're testing the behavior of any objects that we create.


### Release 1: Filter Admission Records
```
Admit Time         Discharge Time     Patient Name      Attending Physician
===========================================================================
2016-01-02 01:05   2016-01-02 20:00   Aaren MacAngus    Ellar Pearce
2016-01-03 16:35                      Aaren MacAngus    Yaffe Kappel
```
*Figure 3*.  Example admission record output, showing records for a particular patient.

We need to update our application.  Users don't want to comb through all admission records in order to find the data in which they're interested.  We've had a few requested filters that we're going to implement.  One filter, viewing records for a particular patient can be seen in Figure 3.  When running the application, users should be able to view ...

- admission records for discharged patients.
- admission records for current patients (i.e., not discharged).
- admission records for a particular patient.
- admission records for a particular doctor.
- all admission records.


### Release 2:  Limit Access to Employees
Currently, any user can view any and all patient admission records.  Imagine our application is running on terminals scattered throughout the hospital.  Any patient or visitor who happens upon a terminal could access patient data.  We need to limit access to the hospital's employees.  When users run our application, they should authenticate with a username and password before being able to access any admission records.


### Release 3:  Limit Access to Doctors and Nurses 
The hospital has many different types of employees:  doctors, nurses, receptionists, parking attendants, etc.  Not all employees should have access to patient data.  We want to limit admission-record access to only doctors and nurses.


### Release 4:  Patient Access to Their Own Records
We've received feedback from patients that they miss having access to their own admission records.  We don't want patients to view data on other patients, but we are going to permit patients to view their own records.  Patients will need to authenticate with a username and password—just like employees—but they will only be able to access their own admission records.


## Conclusion
This challenge is very much in the mold of "Here's the goal; figure out how to make it happen."  How did it feel?  How did we respond to being able to implement an application however we wanted?  Can we explain why we make our design decisions?  Did the design decisions that we made early in the challenge allow the application to be easily modified as requirements changed later in the challenge?


[wikipedia hipaa privacy]: https://en.wikipedia.org/wiki/Health_Insurance_Portability_and_Accountability_Act#Privacy_Rule



