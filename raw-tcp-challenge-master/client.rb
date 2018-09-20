require 'socket'

#TCPSocket is a class representing a connection to a TCP server.
#In the example below we will connect to the server on port 2000 of the machine '127.0.0.1'
# '127.0.0.1' is an address that _always_ points to your own machine,
# which is good since that's where our server will be running too.

server_connection = TCPSocket.new('127.0.0.1', 2000)

our_name = ARGV.join(" ")

puts "Sending a message to the server: #{our_name}"
#Send our message to the server:
server_connection.puts(our_name)

puts "Waiting for a message...\n\n"
#Wait around for a response from the server:
response_from_server = server_connection.gets

#Print our the server's response to our screen
puts "Message from the server: #{response_from_server}"

#Close the connection, we're done!
server_connection.close
