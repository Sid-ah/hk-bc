# TCP: Humble Beginnings

## Learning Competencies

 * Understand what a TCP server is at a basic level
 * Understand what a TCP client is at a basic level
 * Understand how TCP servers and clients talk to each other

## Introduction

The internet as you know it is one vast network of interconnected machines. Computers connect to each other over this network using a variety of tools and protocols, a few of which we'll learn about in this challenge.

Before we begin, let's consider how computers connect. Computers need a way to find each other on a network, so they rely on **IP addresses**. An IP address is an identifier assigned to machine on a network that allows other machines to find it. For example, I might connect to another machine with the IP address "10.0.0.32" on my network.

A given machine might be running many different kinds of programs that my computer wants to connect to. For example, the machine at "10.0.0.32" might be running a mail server _and_ a web server _and_ an FTP server. So the IP address of a machine isn't enough! I need to also know which program on that machine to connect to.

That's what **ports** are for. When a program starts, it can optionally bind to a port, allowing other machines to connect and talk to it.

If you think of an IP address as the street address of a building, think of a port as an office suite number. We use the IP address to reach the machine, and the port to tell the machine which program we're interested in talking to.

At this point you might be wondering how it is you can connect to "google.com" without specifiying an IP address for one of Google's machines. While we won't be worrying about it today, there's an additional service on the internet called **DNS** that translates domain names like google.com into IP addresses for you.

## TCP

Once two machines connect, how do they talk to each other? One way to do it is **TCP**. When your computer finds another computer via IP address and port it can attempt to establish a **TCP Connection**. If the other computer is running a program that has started a **TCP Server** the connection will succeed, and an open, bi-directional tunnel of information will be established. Both parties can send and receive data down this pipe.

Today, we'll be sending strings back and forth, nothing fancy!

## Release 0

`server.rb` contains a functioning TCP server using Ruby's built in TCPServer class. Before you begin, open the file and read through it. Discuss what you're seeing with your pair, and _ask questions_ if you don't understand how it fits together. This is good practice interpreting new code with ideas you may not have seen before.

Once you're done, start `server.rb` running. As you've seen by now, it will start an infinite loop that waits for new connections.

```
$ ruby server.rb
Server waiting for a new connection...
```

Now read through `client.rb` with your pair. This uses Ruby's built-in `TCPSocket` class, which allows Ruby to connect to a TCP server. Before you run it, discuss with your pair what you think will happen.

Once you're done, open a _new_ terminal window, we need to keep the server running. In the new terminal window, run the client. Hopefully you will watch it connect to the server.

```
$ ruby client.rb grace hopper
Sending a message to the server: grace hopper
Waiting for a message...

Message from the server: We got your message! Hello grace hopper!
```

If you look at the terminal window with the server, there should be a message showing that a client connected, and that we closed the connection when we were done:

```
$ ruby server.rb
Server waiting for a new connection...
A client has connected!
Closed connection
Server waiting for a new connection...
```

Work with your pair to figure out how these pieces fit together, and what kinds of objects and methods were involved. Don't be scared to open up some docs and blog posts about TCPServer and TCPSocket, and ask questions!

## Recap

Now that you've done some research, let's recap:

In the code you've reviewed, both `server_connection.accept` in `server.rb` and `TCPSocket.new` in `client.rb` return new `TCPSocket` objects. `TCPSocket`s represent a communication link between two programs. This link can be present between two programs on the same computer _or_ different computers. `TCPSocket` objects represent our tunnel between machines.

`TCPSocket#gets` is a method that waits around for some data to be sent down the link. It will wait (pausing the program) until data arrives. Check out `server.rb` — see where the server is using `#gets` to wait for data from the client?

`TCPSocket#puts` is a method that _sends_ data down the link to the other side. It will try to send data down the link, and will wait (pausing the program) until the other side signals that it's ready to receive data with `#gets`. Notice that `client.rb` uses `#puts` to send the contents of `ARGV` to the server process.

Programs can use `TCPSocket#gets` and `TCPSocket#puts` to communicate. One side signals that it's ready to receive data and the other side sends data down the link. Programs can trade giving and receiving data back and forth to create bi-directional communication.

## Release 1

Now that we've got the basics down, let's write a cheering mascot server and client. This will work a lot like cheering mascot from Phase 1, but it's going to work over a network!

Create files for `cheering_server.rb` and `cheering_client.rb`. You can use the existing `server.rb` and `client.rb` files as a reference if you like, but resist the temptation to copy and paste.

### The server
The **server** should wait to accept a cheer string from a connected client, and send back the following responses based on what message it receives.

| Message from Client | Response       |
| :-----------------: | :------------: |
| RED HOT             | H-O-T!         |
| DO IT AGAIN         | Go, Fight, Win |
| 2 BITS              | Holler!        |
| STOMP YOUR FEET     | STOMP!         |

You can make up your own responses if you would like, but make sure you support at least this default set.

**Note 1:** Any time you change your server, you'll need to CTRL-C the server program and re-run it.

**Note 2:** `TCPSocket#puts` sends a message and automatically tacks on an extra `\n`. That means you may need to `chomp` the `\n` off when you receive a message via `TCPSocket#gets` — this is actually similar to the `#gets` you used in Phase 1.

### The client

The **client** should send a cheer name down the link to the server and print out the response it gets back. For example:

```
$ ruby client.rb RED HOT
Response from server: "H-O-T!"

$ ruby client.rb 2 BITS
Response from server: "Holler!"
```

Believe it or not, you've actually created your _own_ protocol of sorts. A protocol is just an agreement about what format data is sent and received in between client and server. Here, our protocol is defined in the table of messages and responses, "if you send me RED HOT, I send you "H-O-T!".

## Release 2

The most exciting part of network programming is that it allows two programs to communicate across different machines. Since the other pairs in your cohort are also building servers fitting this protocol, your client should be able to talk to _their_ servers just as easily as it talks to your own.

Find another group and connect to their server instead of your own. This means you're going to need to connect to their IP address, not `127.0.0.1`.

To find the IP address of a machine run the following in the terminal:

```bash
ifconfig en0 inet
```

You'll get back something like

```
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
 inet 192.168.0.101 netmask 0xffffff00 broadcast 192.168.0.255
```

In the example above, `192.168.0.101` is this machine's IP address.

Modify `client.rb` to connect to another pair's machine and talk to their server. They should do the same with you. Does it work? Can you send a cheer name and get a response back from their server program?

Congratulations, you're half way to inventing the web!
