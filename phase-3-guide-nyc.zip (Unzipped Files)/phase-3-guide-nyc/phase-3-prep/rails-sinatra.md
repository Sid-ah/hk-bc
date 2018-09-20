# Rails

---

## what is it?

- open-source web app framework written in Ruby (duh)
- convention over configuration (CoC)
- "fat models, skinny controllers"
- employs MVC architectural pattern
- David Heinemeier Hansson created it in 2004 after substantial work on 37signals' Basecamp product

---

## what is it?

- development was expedited in 2006 when Apple announced Ruby would ship with all OSX installs
- features have changed drastically between major versions
- more than 600,000 websites run some version of RoR

---

# conventions

- Rails expects things to adhere to specific structures/hierarchies, naming schemes, and use cases
- intent is to make it quicker to get up-and-running; down that customization of app configuration, structure, and deployment technique is rather painful

---

# conventions

- conventions and best practices have changed as version has increased
- **many** resources exist on Ruby/Rails best practices and "up-to-date" conventions
- https://selvaonrails.wordpress.com/2014/07/18/naming-conventions-on-ruby-ruby-on-rails/

---

# what's included?

- **actionmailer** - send, receive, compose emails
- **actionpack** - Rack extensions for web application development
- **actionview** - helpers and conventions to be used in Views
- **activemodel** - modeling framework used by ActiveRecord
- **activerecord** - we know what this is!

---

# what's included?

- **activesupport** - support libraries and tools
- **bundler** - application dependency management
- **railties** - Rails internals, like generators and Rake tasks
- **sprockets-rails** - front-end asset management pipeline

---

# vs. sinatra

Sinatra does **not** include:
- predefined MVC structure
- ORM database wrapper
- scaffolding
- predefined Rake tasks
- view helpers
- email capabilities
- front-end asset pipeline

---

# vs. sinatra
<br>

### Rails (1.38 MB) vs. Sinatra (339 KB) 


### Rails (100,000 LoC) vs. Sinatra (2,000 LoC)

---

## which and why?
- Sinatra, being so small and lightweight, most often tends to be used for REST API back-ends, leveraging a thick clienet (single-page app) in the browser.

- These applications tend not to require the extensive Helper and View systems in Rails, and may utilize third-party gems to extend Sinatra's core functionality.

---

## which and why?

- Rails, being the monolith that it is, most often tends to be used for fully-fledged server-side MVC applications, taking advantage of Rails’ extensive Helper and View systems
- As well as its advanced built-in testing functionality, expansive security precautions, and easy-to-use generators and scaffolds

---

# rails - cool shit to show you

- `rails new` command
  - optional flags (database type or testing suite)
- rails generators & scaffold
  - so many things
  - `rails generate scaffold Caballo name:string breed:string age:integer`

---
### rails - cool shit to show you (cont'd)

- routes
  - wooo RESTful conventions!
  - `rake routes`
  - custom routes
- controller actions
- strong params

---
