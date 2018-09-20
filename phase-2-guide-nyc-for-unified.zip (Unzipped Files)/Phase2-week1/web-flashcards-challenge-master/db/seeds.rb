map_deck = Deck.create!( category: "Maps" )
geo_deck = Deck.create!( category: "Geography" )
squ_deck = Deck.create!( category: "Squirrels" )

Card.create! [ { question: "Does Kane love maps? (Yes or No)",
                 answer: "Yes",
                 deck_id: map_deck.id},
               { question: "Is Kane a map? (Yes or No)",
                 answer: "No",
                 deck_id: map_deck.id},
               { question: "True or False: Maps suck!",
                 answer: "False",
                 deck_id: map_deck.id},

               { question: "What is the capital of Trinidad & Tobago",
                 answer: "Port of Spain",
                 deck_id: geo_deck.id},
               { question: "What is the most famous bridge in Prague?",
                 answer: "Charles Bridge",
                 deck_id: geo_deck.id},
               { question: "What is the main export of Kuwait?",
                 answer: "Oil",
                 deck_id: geo_deck.id},

               { question: "True or False: A squirrel is an amphibian.",
                 answer: "False",
                 deck_id: squ_deck.id},
               { question: "Is a chipmunk is part of the Squirrel family? (Yes or No)",
                 answer: "Yes",
                 deck_id: squ_deck.id},
               { question: "The gestation period for a typical Eastern Gray Squirrel is how many days long?",
                 answer: "44",
                 deck_id: squ_deck.id} ]


user = User.create!(username: "goat", email: "goat@mail.com", password: "password")

round = Round.create!(user_id: user.id, deck_id: geo_deck.id)

guess = Guess.create!(round_id: round.id, card_id: card.id, description: "IDK")
