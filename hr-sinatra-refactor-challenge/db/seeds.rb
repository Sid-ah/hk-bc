10.times do
  User.create!(email: Faker::Internet.email,
               name: Faker::Name.name,
               password: "password",
               avatar: Faker::Avatar.image(Faker::Lorem.word, "80x80"))
end

User.all.each do |user|
  rand(1..4).times do
    salary = Salary.create!(annual_salary: rand(30..100)*1000)
    position = user.positions.create!(title: Faker::Name.title,
                                      salary: salary,
                                      started_at: Time.now - rand(100..500).days,
                                      ended_at: Time.now - rand(1..50).days)

    position.evaluations.create!(summary: Faker::Lorem.paragraphs(rand(1..4)).join("\n"),
                                 probation: [true, false, false, false].sample)
  end
end
