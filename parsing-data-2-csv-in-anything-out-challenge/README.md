# Parsing Data 2 CSV In Anything Out

##Learning Competencies

* Map data in a file from one format to another using ruby
* Choose the appropriate method to store data in a file.

##Summary

We're going to take our previous CSV parsing code and augment it so we can output not just CSV data, but data in CSV, JSON, or YAML.

Don't spin your wheels!  If your code isn't making progress, flag a staff member down.  Don't get bogged down in the details of each data format; it should be (relatively) straight forward.

The goal is to learn about different formats for storing data, and to understand that the data *per se* is something different than how the data is stored in memory or on disk.  A big part of what computer software does is transform between different representations of data, depending on the needs of the user or engineer.

Read about [JSON](http://en.wikipedia.org/wiki/JSON) and [YAML](http://en.wikipedia.org/wiki/YAML).

##Testing
Carry over your tests from part 1 of this challenge series. _If you want to stretch:_ try and figure out how you might test that something saves, but this is not required.

##Releases

###Release 0 : Save as YAML

Implement a `PersonParser#save_as_yaml` method which saves the person data [as YAML](http://www.ruby-doc.org/stdlib-2.2.0/libdoc/yaml/rdoc/YAML.html).  You'll have to include the `yaml` library in your code.  The nice thing is you can write code like this:

```ruby
require 'yaml'

# returns YAML string for this data, ready to save
[1,2,3].to_yaml
```
YAML is powerful, but uncommon outside of the Ruby world.

###Release 1 : Save as JSON

Implement a `PersonParser#save_as_json` method which saves the person data [as JSON](http://www.ruby-doc.org/stdlib-2.2.0/libdoc/json/rdoc/JSON.html).

Although the `JSON` module adds a `to_json` method similar to the `to_yaml` method, JSON is not as powerful as YAML.  This means `to_json` won't know how to deal with your `Person` objects like `to_yaml` does.

Try storing the data as a `JSON` array, which looks like this:

```json
[{"first_name": "Samuel", "last_name": "Beam", "email": "sam.beam@gmail.com"}, ...]
```

<!-- ##Optimize Your Learning  -->

##Resources

* [JSON](http://en.wikipedia.org/wiki/JSON)
* [YAML](http://en.wikipedia.org/wiki/YAML).
