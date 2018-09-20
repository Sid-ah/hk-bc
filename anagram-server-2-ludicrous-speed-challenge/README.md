# Anagram Server 2 Ludicrous Speed

## Learning Competencies

* Use [ActiveRecord callbacks][]
* Create a database index
* Describe common read / write performance tradeoffs associated with creating an
  index

## Summary

Our last Anagram Server had a single database table, `words`, with maybe four
columns: `(id, word, created_at, updated_at)`.  The dictionary file we imported
contained around 250,000 words.

We want to augment our database schema to make the operation "give me all the
anagrams of a particular word" fast and simple.  We're talking [ludicrous
speed][].

Copy the `anagrams_1` source from the [[Anagram Server 1: The Basics](../../../anagram-server-1-the-basics-challenge) challenge into the source directory of this challenge and refactor that code. 

## Releases

### Release 0: Develop a Strategy

What data can we add to the database to make querying for anagrams easier?
Ideally it'd be as simple as:

```sql
SELECT * FROM words WHERE some_field = some_value
```

The nature of `some_field` and `some_value` are for you to determine and
define.  `some_value` will not be the word you're interested in finding
anagrams for, but it will be determined by it.  Any word that is anagram will
share the same `some_value`.

You'll want to set the value of this field using the ActiveRecord `before_save`
callback.

If you're having trouble identifying what `some_field` should be, that all
anagrams of a given word share, with which you can use to cut out many words,
talk to a pair or talk to an instructor.

### Release 1: Migrations &amp; Database Indexes

You'll need to create a new migration to add any new fields to your `words`
table.  Additionally, you'll want to index these new fields if you're going to
be querying against them.

A database index is an auxiliary data structure which allows for faster
retrieval of data stored in the database at the cost of maintaining the
consistency of all the indexes.  They are keyed off of a specific column or set
of columns so that queries like "Give me all people with a last name of
'Smith'" are fast.

## Optimize Your Learning

**Here's a bit more on Database Indexes**

This is purely extra; the below will make more sense later in DBC and after
you've been playing around with databases for a few weeks.  Don't sweat it if
everything below sounds crazy.

In some instances they work like a Ruby `Hash`.  You could imagine a hash
where the keys were last names and the values were an array of people with
those last names.  Every time we inserted or updated data in the database we'd
have to make sure to do the same to our hash index.

This doesn't work for a wide variety of queries, though, like "Give me all
people who have been members of our site for longer than a year" or "Give me
all the people whose last name begins with 'R'."  For this reason the default
data structured used in most databases is something more general than a hash
table.

If you're curious, you can read more about [what index types Postgres
supports][postgres indices].  The default index type for most databases is a
[B-tree][] because it allows for generally efficient inserting, updating,
deleting, and searching using both equality and comparison, i.e., `=`, `<`,
`>`, `<=`, and `>=`.

Here is an old blog post from Jesse about [database indexes][indices], which
are a common interview question.

## Resources

* [Spaceballs][ludicrous speed]: A fine film by Mel Brooks
* [ActiveRecord callbacks][]
* [Postgres indices][postgres indices]
* [B-tree][] data structure
* [Database indexes in general][database indices]

[ActiveRecord callbacks]: http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
[ludicrous speed]: http://www.youtube.com/watch?v=mk7VWcuVOf0
[postgres indices]: http://www.postgresql.org/docs/9.0/static/indexes-types.html
[B-tree]: http://en.wikipedia.org/wiki/B-tree
[database indices]: https://web.archive.org/web/20140703123428/http://20bits.com/article/interview-questions-database-indexes
