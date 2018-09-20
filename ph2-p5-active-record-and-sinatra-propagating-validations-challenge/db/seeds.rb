require 'faker'

10.times do |i|
  Event.create({
    :date => Date.today + i,
    :title => "Event #{i}",
    :organizer_name => "Organizer #{i}",
    :organizer_email => "organizer_#{i}@example.com" })
end
