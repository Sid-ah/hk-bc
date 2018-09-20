# Working with Dates and Times

## Summary
Working with dates and times can be tricky—particularly when we have to rely on user input.  Why would that be tricky?  Think about entering a date in a form field.  How many formats could the same date take?  `April 15, 1980`, `15/04/1980`, `4-15-80`, etc.  Now imagine entering a date and time together.  How many different forms could that take?  `04-15-1980 2:00 PM`, `April 15, 1980 14:00`, etc.

There are tons of ways that humans represent dates.  Unfortunately, Ruby doesn't understand [all of them][xkcd 8601].  We're going to look at representations of dates and times that Ruby understands and explore some options for getting user input for dates in one of these forms.


### Timezones
Working with timezones is complex.  We have to juggle the time zone of the database, the time zone of the system running our application, the time zone we configure our application to use, the time zone in which each user is located ... It can be a lot to coordinate.

To simplify things in this challenge, we'll settle on one time zone:  [Coordinated Universal Time][wikipedia utc] (UTC).  Let's assume that our users are okay with having UTC dates and times displayed and that they enter UTC dates and times in the forms.  On top of that, our database is setup to store dates in UTC.  That leaves the time zone for the application and the time zone on our computer.  The provided Sinatra application is configured to use UTC (see `config/environment.rb`), but that probably doesn't match the time zone on our computer, the system time.  We can work around the difference in application time and system time by using specific methods; see this [Thoughtbot article][thoughtbot timezones] for details.


## Releases
### Release 0:  Today's Events
We've been supplied a CRUD app with one resource: an `Event` model with a `datetime` attribute named `starts_at`.  We're going to begin the challenge by filtering events by their start times.  

On the homepage, there is a sidebar with the heading "Today's Events".  It's currently listing all events in the database, but we only want it to list the events occurring today.  It doesn't matter if the event has already started; any event starting today should be listed.  The events should continue to be ordered by start time.

*Note:*  When we seed the database, we create five events that began in the past, three that began or will begin sometime today, and five events that begin in the future.


### Release 1:  Upcoming Events
Next, let's filter the events shown on the "Upcoming Events" page.  Again, all events are currently listed.  Update the page to list only events whose start times are in the future.  The events could start later today or years later—anytime in the future.  Continue ordering events by start time.


### Release 2:  String Formats that Ruby Can Parse
Now let's discuss providing data that represents a date.  In our application, users will create events by submitting a form, so we'll be working with dates and times entered by users.  This means that the dates and times that users enter must be formatted in a way that Ruby can parse.

So, in what format must a string be for Ruby to parse it to a date and time?  One format is *[ISO 8601][]*, an international standard for representing dates and times and probably a safe bet when we need to format a date as a string.  But, Ruby will also parse *JIS X 0301*, *RFC 2822*, *RFC 3339*, etc.

Let's explore a few date and time formats to see how Ruby handles them.  Open the `rake console` and try to assign an event a starting date and time using each of the strings in Table 1.  Some will parse correctly and some won't.  See Figure 1 for a couple examples; notice that when a string doesn't parse properly, the attribute's value is set to `nil`.  Guess which formats will work before using them.  What happens if the string leaves out elements like the time zone, seconds, etc.?


| Ruby String                           | Format     |
| :------------------------------------ | :---       |
| `"1980-04-15T20:15:00+00:00"`         | ISO 8601   |
| `"G80.04.15T20:15:00+00:00"`          | JIS X 0301 |
| `"Tue, 15 April 1980 20:15:00+00:00"` | RFC 2822   |
| `"15th Apr 1980 20:15:00"`            | ?          |
| `"20:15:00 Apr 15th 1980"`            | ?          |
| `"15-04-1980 20:30"`                  | ?          |
| `"04-15-1980 20:30"`                  | ?          |
| `"1980-04-15 08:15 PM"`               | ?          |
*Table 1*.  Date and time formatted strings.


```ruby
event = Event.new
# => #<Event id: nil, name: nil, location: nil, starts_at: nil, created_at: nil, updated_at: nil> 
event.starts_at
# => nil
event.starts_at = "Wed, 27 Apr 2016 17:42:41 -0500"
# => "Wed, 27 Apr 2016 17:42:41 -0500"
event.starts_at
# => 2016-04-27 22:42:41 UTC
event.starts_at = "Wed, 27 04 2016 17:42:41 -0500"
# => "Wed, 27 04 2016 17:42:41 -0500" 
event.starts_at
# => nil 
```
*Figure 1*. Assigning an `Event` a starting data and time using a string.


### Release 3: Use a `datetime-local` Input
Unfortunately, we can't assume that users will enter dates and times in a format that Ruby can parse.  So, what can we do to help users provide clean data?  In its current state, our form provides a note below our text input fields that provides an example date and time in a format that will work: *2016-04-15 06:30 pm*.  And, that might be enough for some users but probably not for all of them.

One option for encouraging better data is to use a different type of input field.  In other words, not a text input which allows users to type whatever they want.

HTML5 introduced a number of new input types.  One of these types is [`datetime-local`][datetime-local].  Update the `app/views/events/_form.erb` partial to use a `datetime-local` input for collecting an event's starting date and time.  Ensure that the input is still populated when editing an event; the value of the `datetime-local` input must be given in a specific format (see linked docummentation).  See Figure 2 for an example of how the form will behave with a `datetime-local` field.

![Using a datetime-local input](readme-assets/datetime-local-animation.gif)  
*Figure 2*.  Using a `datetime-local` input field.


### Release 4: Use a JavaScript Date Picker *(stretch)*
*This is an optional stretch release.*

Using a `datetime-local` input field is an improvement over the generic text input.  It helps ensure that correctly formatted data is sent from the form.  But! ... [not all browsers support it][support datetime-local].  If all our users are using Chrome, we're in luck, but they probably don't.

Another way to control user input of dates and times is with JavaScript date and time pickers.  While there are different date and time pickers available, our application is set up to use the [jQuery UI datepicker widget][jquery datepicker] and the [jQuery Timepicker plugin][jquery timepicker].  By "set up", we mean that all the required JavaScript, CSS, and image files have been added and included (see the `public/` directory and the `<head>` tag of `app/views/layout.erb`).

Read the documentation on how to use the date and time pickers and then update our form to use them.  See Figure 3 for an example implementation.  Again, ensure that the date and time are still populated when editing an event.

![User a JS datepicker](readme-assets/datepicker-animation.gif)  
*Figure 3*.  Using JavaScript date and time pickers.


## Conclusion
It's difficult working with dates and times.  We've taken a look at some of the issues in working with dates based on what Ruby can parse.  We've also explored issues related to user input of dates and times and how we can attempt to control that input.  There are other techniques that we can use as well—for example, client-side validations.

We should leave this challenge able to work with dates in a web application and with an understanding of some of the complications involved.  For example, encoding a date in text requires specific formatting.


[datetime-local]: https://www.w3.org/TR/html-markup/input.datetime-local.html
[ISO 8601]: https://en.wikipedia.org/wiki/ISO_8601
[jquery datepicker]: http://api.jqueryui.com/datepicker/
[jquery timepicker]: http://timepicker.co/
[support datetime-local]: http://caniuse.com/#search=datetime-local
[thoughtbot timezones]: https://robots.thoughtbot.com/its-about-time-zones#three-time-zones
[wikipedia utc]: https://en.wikipedia.org/wiki/Coordinated_Universal_Time
[xkcd 8601]: https://xkcd.com/1179/
