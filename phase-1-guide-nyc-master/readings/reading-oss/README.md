# Reading Open Source Software

## Introduction

You've now worked with Ruby's `CSV` library.  `CSV` is a class that allows developers to interact with .csv files.  Of course, you can ignore the `CSV` library and still work with .csv files, but using the library make things much easier—at least it does once you've become familiar with what the library does.

Like working with .csv files, there are other tasks for which developers have written libraries.  These libraries, when written for Ruby, are often distributed as [gems](https://www.ruby-lang.org/en/libraries/).  In Phase 1, you'll be working with gems like [Nokogiri](https://rubygems.org/gems/nokogiri), [ActiveRecord](https://rubygems.org/gems/activerecord), [Rake](https://rubygems.org/gems/rake), etc.  Using these libraries prevents us from recreating the wheel.  If I want to grab some information from a website to use in my Ruby program, I don't have to build my own web scraper, I can use Nokogiri in my application.

As with `CSV`, however, we do have to invest some time learning how to use the library.  The quality of documentation will vary from library to library.  Some developers will provide very clear documentation for how the library works:  what methods are availalbe, what the methods return, etc.  For other libraries, the documentation can be murky.

## Installing

To use `CSV`, we had to require it in our Ruby prgoram:  `require 'csv'`.

Similarly, in working with gems, we need to require them in our program, but we also need to install them before we can use them.  We can install gems from the comman line [using the `gem` command](http://guides.rubygems.org/rubygems-basics/)—similar to the `git` command.  The `gem` command is built into Ruby 1.9 and newer.

For example ...

```
$ gem install nokogiri
```

## Exploring

When exploring how to use a new library, there are different places to look for information.  A good starting point is [RubyGems.org](https://rubygems.org/), a package manager for Ruby gems.  RubyGems will have a page devoted to each gem (e.g., [Nokogiri](http://rubygems.org/gems/nokogiri)).  On each gem's page are links to the gem's homepage, source code, and documentation.  At least, if these documents are available, the links will be there.  

The homepage and documentation are great places to begin your search for information on how to use a new library.  Take time to read through them.  

Unfortunately, sometimes the official documentation is poor, and you won't find the information that you're looking for.  In these situations, you'll have to turn to other sources of information for help.

One such source of information is the source code for the library, the code itself.  Often, the code for gems is open source and freely availalbe.  For example, [the code for the Nokogiri gem is available on GitHub](https://github.com/sparklemotion/nokogiri).  If you want to see what a method does, go look at the code—just be aware that as beginners, we might not always be able to make sense of the code in the time available.

When these sources of information fail us, we can always turn to the World Wide Web for answers (i.e., google it).  Often, someone else will have run into the same problem, and there's a good chance that an answer is available somewhere—it's just a matter of finding it.

Then, there's you and IRB.  In other words, just kicking the tires.  Go play with the library.  Try things, see what happens.  Apply some of your debugging skills to understand what what the code is doing.

## Conclusion

Learning to use new software like a Ruby gem can be intimidating, but it's also a necessary skill for a developer.  As you've heard at DBC, be comfortable being uncomfortable.
