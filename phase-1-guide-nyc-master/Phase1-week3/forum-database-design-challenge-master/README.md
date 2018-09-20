# Schema Design: Forum 
 
## Summary 
[Internet forums][wikipedia internet forum] have been around for decades!  So, what's a forum?  It's an application that allows users to have written conversations.  One user starts a *thread* with an opening post, and other users respond with their own posts.  We're going to model a database schema to support a forum.


## Releases
### Release 0:  Design the Schema
We're going to design a schema to support an internet forum.  Our database schema should support the following forum features.

- A forum is organized into sections (e.g., "Off Topic", "Introduce Yourself", etc.)
- A user can create threads; each thread is associated with one and only one section.
- A user can post in threads; each post is associated with one thread.
- A user can be an administrator, a moderator, or a normal user.
- A thread can be *pinned*, so that it is displayed at the top of a section's list of threads.

Use [Schema Designer][] to visually model the schema.  Submit a screenshot of the completed schema design. 


[Schema Designer]: https://schemadesigner.devbootcamp.com/
[wikipedia internet forum]: https://en.wikipedia.org/wiki/Internet_forum