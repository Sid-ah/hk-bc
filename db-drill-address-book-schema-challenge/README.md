# Schema Design: Address Book
 
## Summary 
We're going to design a schema for an address book application.  We won't design our schema based on provided Ruby classes.  Instead, we'll base our design on the desired functionality of the address book application.


## Releases
### Release 0: Contacts
First things, first: if we're going to have an address book, we need to be able to store contacts.  Each contact has a first name, last name, phone number, and an e-mail address.

Create a schema that would allow us to store data for contacts.  Use the [schema designer].


### Release 1: Groups
Our application needs a better way of organizing contacts than having one long list: we need to support groups.  Each group has a name.  Any number of contacts can be associated with the same group.  And at the same time, any one contact can be associated with multiple groups.  What's the relationship type between contacts and groups?

Update the schema to support groups.  When our schema is complete, take a screenshot of the design and commit it.



[schema Designer]: https://schemadesigner.devbootcamp.com/
