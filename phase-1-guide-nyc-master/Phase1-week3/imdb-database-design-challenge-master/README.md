# Schema Design: Internet Movie Database 
 

## Summary 
Are we familiar with the Internet Movie Database (IMDb)?  If not, well, it's a database ... a database that contains a whole slew of data related to movies.  Titles, directors, producers.  It's all there.  Users are able to interact with this database in different ways, including the website [imdb.com][].

In this challenge, we're going to look at the imdb.com website and infer the schema of the database.  For example, take a look at the [full cast and crew][imdb sharknado 3] for a movie.  What can we deduce?  The database stores data about movies:  the title, release date, etc.  It stores data about people, like their real names.  It associates people with movies, noting their specific roles (e.g., boom operator, makeup artist, character name, etc.).

Now we know a little bit about what data is in the database, but what does the schema look like?


## Releases
### Release 0:  Design the IMDb Schema
Use the [Schema Designer][] to visually represent what you believe the IMDb schema might look like.  But, we're not going to model the entire schema.  Design a schema that would support just what we can see on a movie's [full cast and crew page][imdb sharknado 3].  What objects can we identify based on what is listed on the page?  Users?  Movies?  Lists?  What attributes do the objects have?  What types of relationships exist between the objects?

Submit a screenshot of the final schema design.


## Conclusion
In this challenge we're looking at a functioning application and identifying the models and database tables we expect based on the functionality of the app.  Furthermore, we determine the relationships between objects.  For example, maybe a many-to-many relationship between movies and people (e.g., actors).  Eventually we'll translate these skills to determining the objects and relationships we need to get the behaviors we want out of our own applications.


[imdb.com]: http://www.imdb.com
[imdb sharknado 3]: http://www.imdb.com/title/tt3899796/fullcredits?ref_=tt_ov_st_sm
[schema designer]: https://schemadesigner.devbootcamp.com/

