# Hat-Tip

## Learning Competencies

 * Understand what an HTTP client sends to a server
 * Understand what an HTTP server sends to a client
 * Understand how HTTP servers and clients interact

**Note:** The point of this challenge is to learn about HTTP. Keep the competencies in mind and allocate your time accordingly.

## What's HTTP?

HTTP is a protocol. In this case the protocol is simply an agreement between programs that they'll send **text** to each other in a **specific format** via a **TCP connection**.

You already know what TCP connections are, and you know how to send text over them. So, understanding HTTP is just a matter of understanding  what text you need to send between an HTTP client and HTTP server.

## Release 1, an HTTP client

An HTTP client sends HTTP _requests_ to an HTTP server. In this exercise we're going to build our own HTTP client and fetch a webpage by connecting to a webserver on the internet and sending it a properly formatted request.

### The Request Format
Let's talk about the "specific format" of an HTTP request. Here's an example of an HTTP request string:

   ```
   GET /locations/chicago HTTP/1.1
   Host: devbootcamp.com
   Accept: text/html

   ```

As you can see, an HTTP request is a chunk of text (a string) that is composed of:

 * The resource (URL) being requested
 * Zero or more headers (Key: value)
 * A blank line

In this example, we see:

 * Line 1: A `GET` request to fetch `/locations/chicago`
 * Line 2: A _header_ that names the host we're talking to.
 * Line 3: Another header that says what kind of content we want (html)
 * Line 4: an empty line signaling that our request is done

Don't forget that empty line! It's what signals to the server that you're done sending your request and would like to receive a response.

The text you see in the example is the same text your browser sends to the `devbootcamp.com` server over TCP when you visit http://devbootcamp.com/locations/chicago. There's no magic here, the web is just a matter of formatting text-based requests and responses correctly so that everybody can communicate.

There are many different kinds of HTTP request types but the simplest of all is the humble `GET` we see above. `GET` just says "give me this thing I'm looking for." A `GET` is what happens every time you type a URL into your browser.

### Write your Client

Write a program that sends a GET request over TCP to `www.example.com` on port 80 to fetch the `/index.html` page on the server.

Your client should print out all the lines that it gets back from the server.

It's ok if your client ends up in an infinite loop when trying to fetch all the response data, the important part is that you can read the response in its entirety.

## Release 2, an HTTP server

In the last release you wrote a basic HTTP client that accessed a real-life-website and displayed its contents (which is pretty amazing).

Let's try this from the other side. In this release let's write a little HTTP _server_.

You won't be using your HTTP client in this release, we'll test our server by connecting to it with Google Chrome (our favorite HTTP client).

### The Response Format

The _simplest_ response your server can send is a classic `200 OK`, which says "I have the thing you're looking for, here you go." Here's an example of an HTTP response string:

```
HTTP/1.1 200 OK
Content-Length: 130

<html>
<head>
  <title>An Example Page</title>
</head>
<body>
  Hello World, this is a very simple HTML document.
</body>
</html>
```

As you can see, the format of a `200` response needs (at least) three pieces.

 * The response line indicating that this is, in fact, a `200` response
 * A header specifying the length of the content that will be sent back in characters (bytes)
 * An empty line
 * A series of lines representing the content.

In our example, we see:

 * Line 1: A 200 OK response (content was found)
 * Line 2: A header specifiying the number of characters in our response below the empty line
 * Line 3: An empty line to signal the end of our headers and the beginning of our content
 * Lines 4 to end: The body of our response

If your TCP server is sending the example above correctly, you should be able to visit your server in Chrome and see the web page!

Watch out for the Content-Length, it's easy to mess up. All characters, including indentation, will count towards the total Content-Length. Whatever the number is, it must match _exactly_ the number of characters you're sending after the empty line.

### Requirements

Your server should run on port 2000. You can tell Chrome to visit it by going to the url  `http://127.0.0.1:2000/` once you have it up and running.

## Release 3, Expand the Server

Change your server to serve two simple pages.

 * `/hi` should send back a response with a greeting
 * `/quote` should send back a quote of your choosing

Visiting `http://127.0.0.1:2000/hi` should give you one of these and `http://127.0.0.1:2000/quote` the other.

