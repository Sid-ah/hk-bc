# University Course Schema Design 
 
## Summary 
We're going to design a database schema that would support a university course enrollment application.  Imagine an application where students are able to browse the university's course offerings.  Each of the university's courses is listed:  English 101, English 201, Math 101, etc.  Students browse the list and enroll in courses.  The specific requirements are presented in the releases.


## Releases
### Release 0: Basic Schema
Begin by designing a database schema based on the requirements listed below.  Use [Schema Designer][] to visually represent your schema.

- A student can enroll in many courses.
- A course can have many enrolled students.
- A student receives a final grade for each enrolled-in course (think carefully about what table this data lives in).
- A course is taught by one teacher.
- A teacher can teach multiple courses.


### Release 1: Updated Requirements
The requirements for our schema have changed.  Our database needs to support some additional functionality.  Modify the schema design to match the requirements listed below.

- A department offers many courses.
- A course is offered by one department.
- A course has many sections (e.g., English 101, Section 1; English 101, Section 2, etc.).
- A section is offered either Monday/Wednesday/Friday or Tuesday/Thursday.
- A section has a start time and an end time.
- A student attends a course by enrolling in a specific section of the course.
- A student receives a final grade for each enrolled-in section.
- A section is taught by one teacher.
- A teacher can teach multiple sections.


### Release 2: Cross-listing Classes
Sometimes courses are cross-listed in multiple departments.  For example, the same Combinatorics course might be jointly offered by both the Mathematics and Computer Science departments.  Update the schema to support cross-listing courses:

- A department offers many courses.
- A course can be offered by many departments.

When complete, take a screenshot of the final schema design and commit it.


### Release 3 : Enforcing Constraints
As students enroll in course sections, there are a couple problems that might arise.  What if a student enrolls in two sections of the same course?  Or, what if a student enrolls in two sections whose times overlap?  Or, for that matter, what if a teacher is assigned to teach two sections whose times overlap?

How could we infer that student or teacher data violates one of these contraints?  Even if the database itself doesn't have these constraints built in, if we can infer a violation, we could write Ruby code to ensure the violation doesn't reach the database.  In other words, our Ruby application would not write to the database, if a violation would occur.

How could we enforce these constraints?  Discuss as a pair how to do this.  What are the potential costs of relying on supporting Ruby code to help validate our data?  Write an explanation in the file `constraints.md`.

*Note:* We won't reflect these constraints in our schema design.


## Conclusion
When designing a database schema, we let the needs of the application drive the design of the schema.  We need to be able to look at the needs of the application and understand how to support those needs in the database.

One of the critical concerns is associating data in different tables with each other.  For example, associating students with their courses through the sections in which they enroll.  We need to be able to look at an application, infer the types of relationship between objects, and know how to model them in our schemas.


[Schema Designer]: https://schemadesigner.devbootcamp.com/
