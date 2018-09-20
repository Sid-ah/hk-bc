
50.times do
  Hashtag.create( name: Faker::Lorem.word )
end

hashtag_count = Hashtag.count

500.times do
  internet_name = Faker::Internet.user_name
  tweet = Tweet.create( content: Faker::Lorem.sentence,
                        username: Faker::Name.name,
                        handle: "@#{internet_name}",
                        avatar_url: Faker::Avatar.image(internet_name) )
  rand(1..4).times do
    tweet.hashtags << Hashtag.where(id: rand(1..hashtag_count) )
  end
end



