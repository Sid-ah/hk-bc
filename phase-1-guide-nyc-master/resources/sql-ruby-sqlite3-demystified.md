
### Ruby and SQLite Demystified


Let's break down this SQL statement run with the help of the SQLite3 ruby gem.

```ruby
$db.execute(
      <<-SQL
        SELECT * FROM students 
        WHERE id = 39 
      SQL
      );
```

The `<<-SQL` syntax is known as a "heredoc". (developed in unix and implemented in many languages).  It simply allows any text within the 
indicator SQL to be formatted with tabs and returns without effecting 
normal syntax rules.

Let's simplify the SQL statement passed to the `#execute` method:

```ruby
$db.execute("SELECT * FROM students WHERE id = 39")
```

What if we wanted to pass a variable in for the id? 

```ruby
$db.execute("SELECT * FROM students WHERE id = #{id}")
```

We can interpolate it just like any other ruby string!  This is plain old ruby. We have a method `#execute`, and a string that is an argument passed to the `#execute` method.  We happen to be interpolating a variable in the argument. 


But, unfortunately, interpolating variables directly within a SQL query is insecure and susceptible to what's known as an "injection attack".

Let's look at another example:

```ruby
class Student 
  ...

  def self.where_name_is(column_val)
    $db.execute("SELECT * FROM students WHERE name = #{name}")
  end

end

Student.where_name_is("Bobby")
```

This would work fine.  But what if this call were made?


```ruby
class Student 
  ...

  def self.where_name_is(column_val)
    $db.execute("SELECT * FROM students WHERE name = #{name}")
  end

end

Student.where("'Bobby'; DROP TABLE students")

```

If we evaluate the statement, we get:

```
SELECT * FROM students WHERE name = 'Bobby'; DROP TABLE students;
```

As you might imagine, this could be devastating to the database.

The solution is to "bind parameters" and to sanitize the database inputs.  Here's an example of binding the parameter of the student's name:

```ruby
SELECT * FROM students WHERE name = ?, "Bobby";
```

If we were to look at it in the context of the class, it would look like:

```ruby
class Student 
  ...

  def self.where_name_is(column_val)
    $db.execute("SELECT * FROM students WHERE name = ?", column_val)
  end

end

Student.where_name_is("Bobby")

```

When we look at the `#execute` method in this case, it's clear that it can take not only a 
string as the SQL call, but also arguments that serve as bound parameters.

OR, in the case of the challenge, we could pass the column name as an 
argument as well.


```ruby
class Student 
  ...

  def self.where(column_call, column_val)
    $db.execute("SELECT * FROM students WHERE #{column_call}", column_val)
  end

end

Student.where('name = ?'; "Bobby")

```



