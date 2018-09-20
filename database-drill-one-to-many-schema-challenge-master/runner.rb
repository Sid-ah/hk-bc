require_relative 'theater'
require_relative 'screen'
require_relative 'screening'


# Create theaters with screens
franklin_park_screen_1 = Screen.new(number: 1)
franklin_park_screen_2 = Screen.new(number: 2)
franklin_park_screen_3 = Screen.new(number: 3)
franklin_park = Theater.new(name: 'Franklin Park', screens: [franklin_park_screen_1, franklin_park_screen_2, franklin_park_screen_3])

fallen_timbers_screen_1 = Screen.new(number: 1)
fallen_timbers_screen_2 = Screen.new(number: 2)
fallen_timbers = Theater.new(name: 'Fallen Timbers', screens: [fallen_timbers_screen_1, fallen_timbers_screen_2])

levis_commons_screen_1 = Screen.new(number: 1)
levis_commons_screen_2 = Screen.new(number: 2)
levis_commons = Theater.new(name: 'Levis Commons', screens: [levis_commons_screen_1, levis_commons_screen_2])


# Add screenings for each screen
franklin_park_screen_1.screenings = [
  Screening.new(start_time: '11:00', movie_title: 'Casablanca'),
  Screening.new(start_time: '16:00', movie_title: 'Gone with the Wind'),
  Screening.new(start_time: '20:00', movie_title: 'The Wizard of Oz')
]

franklin_park_screen_2.screenings = [
  Screening.new(start_time: '17:00', movie_title: 'Casablanca'),
  Screening.new(start_time: '21:00', movie_title: 'The Godfather')
]

franklin_park_screen_3.screenings = [
  Screening.new(start_time: '11:00', movie_title: 'Gone with the Wind'),
  Screening.new(start_time: '14:00', movie_title: 'The Wizard of Oz'),
  Screening.new(start_time: '17:00', movie_title: 'Citizen Cane'),
  Screening.new(start_time: '20:00', movie_title: 'It\'s a Wonderful Life'),
  Screening.new(start_time: '23:00', movie_title: 'Citizen Cane')
]

fallen_timbers_screen_1.screenings = [
  Screening.new(start_time: '16:00', movie_title: 'Casablanca'),
  Screening.new(start_time: '20:00', movie_title: 'Psycho')
]

fallen_timbers_screen_2.screenings = [
  Screening.new(start_time: '11:00', movie_title: 'The Wizard of Oz'),
  Screening.new(start_time: '16:00', movie_title: 'Breakfast at Tiffany\'s'),
  Screening.new(start_time: '20:00', movie_title: 'Jaws'),
  Screening.new(start_time: '23:00', movie_title: 'Night of the Living Dead')
]

levis_commons_screen_1.screenings = [
  Screening.new(start_time: '15:00', movie_title: 'Jaws'),
  Screening.new(start_time: '18:00', movie_title: 'Citizen Cane')
]

levis_commons_screen_2.screenings = [
  Screening.new(start_time: '13:00', movie_title: 'It\'s a Wonderful Life'),
  Screening.new(start_time: '16:00', movie_title: 'Breakfast at Tiffany\'s'),
  Screening.new(start_time: '19:00', movie_title: 'Some Like it Hot'),
  Screening.new(start_time: '22:00', movie_title: '2001: A Space Odyssey')
]


# Display the screenings at each theater
theaters = [franklin_park, fallen_timbers, levis_commons]

theaters.each do |theater|
  puts theater.name

  theater.screens.each do |screen|
    puts "  Screen #{screen.number}"

    screen.screenings.each do |screening|
      puts "    #{screening.start_time} - #{screening.movie_title}"
    end
  end
  puts "\n"
end
