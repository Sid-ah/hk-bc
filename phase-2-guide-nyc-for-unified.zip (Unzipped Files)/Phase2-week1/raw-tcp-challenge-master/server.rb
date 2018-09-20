require 'socket'

# TCPServer is a class representing a TCP Server.
# A TCP server accepts client connections over TCP and
# exchanges information with the client
server = TCPServer.new(2000) # Start a server that's bound to port 2000 of this machine

loop do
  puts "Server waiting for a new connection..."
  # `server.accept` causes our program to pause here for a client to connect.
  # We'll wait here until someone trys to connect to this program via TCP
  client_connection = server.accept

  # The program resumes as soon as a client connects. That means if we reach this line
  # a client has connected. Let's send some logging information to the terminal to
  # mention that we have a new connection
  puts "A client has connected!"

  # Now we wait for the client to send us a message, this will pause our server again
  # while it waits.
  name_from_client = client_connection.gets

  # If we reach this line, a message must have been received.
  # The message from the client might have had a trailing \n character, so let's
  # chomp it off just in case
  name_from_client = name_from_client.chomp

  # Now that we got a message from the client, let's send a response
  client_connection.puts("We got your message! Hello #{name_from_client}!")

  # We're done, so let's close the client connection
  client_connection.close

  puts "Closed connection"

  # Loop back to the top so we can go back to `accept` and wait for a new client to connect
end
