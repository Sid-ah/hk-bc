# Request and Send JSON 
 
## Summary 
Our task is to take a webpage and add some specific JavaScript behavior, as seen in Figure 1.  When a user clicks the button, an AJAX request is sent, the response from the server includes a color and an index of one of the nine cells on the page, and the DOM is updated based on the data in the response.

![example animation](readme-assets/example-animation.gif)  
*Figure 1*.  Demonstrating the application's behavior.


### JSON: JavaScript Object Notation
[JSON][] is a common, agreed-upon format for representing data as a string; this is called [*serialization*][wikipedia serialization]. Many languages have JSON libraries that can take data (e.g., hashes and arrays) and turn it into a JSON string. Those libraries can also take a JSON string and turn it back into data.

This is useful when one language wants to communicate with another. For example, Ruby can turn an array into a JSON string and send it to a web browser. On the browser side, Javascript can take that JSON string and turn it into a Javascript array on the other side.

We're going to learn to both request and return JSON.  On the client side, when we make a request, we can specify that we *want* JSON to be returned by setting the `Accept` header; however, it's up to the server to actually send back what we want.

On the server side, we've been responding to AJAX requests by sending back HTML. Now we want to respond with a JSON string.  To do so, we want to set the `Content-Type` response header to be JSON, and we also need to format the data we're sending back as JSON.  We'll need to figure out how to do this in Sinatra.

Finally, when the browser receives the response back from the server, we'll need to interpret the response as JSON.  If the server correctly sets the `Content-Type` header, jQuery will automatically parse the JSON string from the server into a JavaScript object.


## Releases
### Pre-release: Move Data from Ruby to JavaScript by Hand
We're going to simulate the process of sending data from a Ruby application to JavaScript by doing it manually, using JSON as the data-storage format that both languages understand.  We'll start by creating some data in Ruby.  In IRB, we'll create an array containing a couple hashes, which contain data for dogs.  Then we'll generate JSON that represents this data.

Open IRB and execute the code in Figure 2.

```ruby
require 'json'
# => true 
jayda = { name: "Jayda", breed: "Bull Terrier" }
# => {:name=>"Jayda", :breed=>"Bull Terrier"} 
tenley = { name: "Tenley", breed: "Golden Doodle" }
# => {:name=>"Tenley", :breed=>"Golden Doodle"} 
dogs = [jayda, tenley]
# => [{:name=>"Jayda", :breed=>"Bull Terrier"}, {:name=>"Tenley", :breed=>"Golden Doodle"}] 
JSON.generate(dogs)
# => "[{\"name\":\"Jayda\",\"breed\":\"Bull Terrier\"},{\"name\":\"Tenley\",\"breed\":\"Golden Doodle\"}]" 
```
*Figure 2*.  Generating JSON in Ruby.

The last line in Figure 2 creates a JSON-formatted string that represents the data in the `dogs` array and each hash within the array.  Now we want to take that JSON and use it to recreate those objects in JavaScript.

We're going to literally copy-and-paste the JSON string from Ruby into Javascript.  Open the JavaScript console in the browser and execute the code in Figure 3.

```javascript
var dogsJsonString = "[{\"name\":\"Jayda\",\"breed\":\"Bull Terrier\"},{\"name\":\"Tenley\",\"breed\":\"Golden Doodle\"}]"
// => undefined
dogsJsonString
// => '[{"name":"Jayda","breed":"Bull Terrier"},{"name":"Tenley","breed":"Golden Doodle"}]'
var dogs = JSON.parse(dogsJsonString);
// => undefined
dogs
// => [ { name: 'Jayda', breed: 'Bull Terrier' }, { name: 'Tenley', breed: 'Golden Doodle' } ]
var jayda = dogs[0]
// => undefined
jayda
// => { name: 'Jayda', breed: 'Bull Terrier' }
jayda.name
// => 'Jayda'
jayda.breed
// => 'Bull Terrier'
```
*Figure 3*.  Parsing JSON into JavaScript objects.

The data from our Ruby objects was serialized into JSON (i.e., it was transformed into a string), which we were then able to parse into JavaScript objects.  The Ruby `jayda` and `tenley` hashes and the `dogs` array that held them were all converted to a string. We copied the Ruby string, pasted it in JavaScript as a string, and then parsed the string into JavaScript objects.  The data for the Ruby `dogs` array is now represented as a JavaScript array.  The data for the `jayda` and `tenley` Ruby hashes is now represented as a JavaScript object.


### Release 0: Update Cell Colors
Modify the provided code to implement the functionality shown in Figure 1:

- The user clicks the button.
- An AJAX request for JSON is submitted to `/colors/random`.
- The route handler returns JSON including a cell number and a color hexcode.
- The background color of the cell number is changed to the hexcode.

*Note:*  Do not modify the HTML.


## Conclusion
Sending and receiving JSON is a common way of transmitting data.  When our route handlers respond to requests with HTML, they combine the data returned with the presentation of the data.  Therefore, they're useful to specific applications where that presentation is appropriate.  When a server can respond with JSON, it's returning only data, which can be used in any number of ways.


[JSON]: http://www.json.org/
[wikipedia serialization]: https://en.wikipedia.org/wiki/Serialization


