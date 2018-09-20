# Require models
require_relative 'user'
require_relative 'product'
require_relative 'review'
require_relative 'favoriting'

# Require views
require_relative 'user_reviews_view'
require_relative 'user_favoritings_view'
require_relative 'product_reviews_view'

# create the users, products, reviews, and favoritings
  # create users
  sharleen = User.new(email: 'sharleen@gmail.com', username: 'sharleenator')
  larain = User.new(email: 'larain@gmail.com', username: 'ooh_la_larain')
  raza = User.new(email: 'raza@gmail.com', username: 'ra_ra_raza')
  thaddeus = User.new(email: 'thaddeus@gmail.com', username: 'dont_be_thad_guy')
  chris = User.new(email: 'chris@gmail.com', username: 'just_chris')

  users = [sharleen, larain, raza, thaddeus, chris]


  # create products
  mixer = Product.new(name: 'mixer', description: 'This mixer is for your standard recipes. The 4.5-quart stainless steel mixing bowl and 10 speeds easily mixes, kneads and whips your favorite ingredients. For even more versatility, the power hub is designed to use the motor\'s power to operate optional attachments from food grinders to pasta makers and more.')
  camera = Product.new(name: 'camera', description: '26X Zoom 35MM. Full HD 720P. This camera is powered by AA batteries readily available almost anywhere.')
  laptop = Product.new(name: 'laptop', description: 'Looking for a notebook that can keep up with your busy day? This one is the hard-working, smartly-designed notebook that\'s light on price.')

  products = [mixer, camera, laptop]


  # create user reviews of products
  review_sharleen_mixer = Review.new(author: sharleen, product: mixer, score: 3, description: 'The big difference between this mixer and the standard "two beater" models you may be familiar with is that it uses a single mixing attachment that rotates in two motions- it not only spins on its own axis, it also is rotated around the edge of the bowl. This does an extremely effective job of mixing ingredients without need for the bowl rotating, since the mixing motion covers the entire bowl. For most mixing jobs, it also requires no scraping of the sides with the spatula.')
  review_larain_mixer = Review.new(author: larain, product: mixer, score: 4, description: 'I received a white one for an early christmas gift and just used it for the first time on the Christmas cookies that are a tradition in my family. In the past years, I\'ve used my mother\'s old stand-mixer, and I\'ve also used a hand mixer, which is near impossible to do with this recipe. This year, I used my new mixer and I am blown away!')
  review_raza_mixer = Review.new(author: raza, product: mixer, score: 4, description: 'They are an investment like good knives and heavy cookware...no real cook should be without one, but should be smart enough to buy the right one. I only wish I had one when I started baking 43 years ago, maybe I wouldn\'t have tendonitis from mixing all those cookies by hand with a wooden spoon!!! They are worth every penny.')
  review_thaddeus_camera = Review.new(author: thaddeus, product: camera, score: 4, description: 'The outstanding characteristic of this camera is the lens. The lens features a much larger objective lens than any pocket camera, which means that it is capturing more light for more detail and sharper shots. For taking still pictures, for example, I notice a clear difference in favor of this camera in comparison to my other pocket camera.')
  review_chris_camera = Review.new(author: chris, product: camera, score: 3, description: 'I love the pictures I\'ve taken with this camera! It\'s easy to use and it\'s great for when I want to take pictures of nature/flowers. The shutter speed is slow, however, so it would not work well for kids/pets that are moving or sports.')
  review_sharleen_camera = Review.new(author: sharleen, product: camera, score: 1, description: 'This camera is poorly made. I expected good things from such a reputable camera manufacturer. The camera strap attaches to the body on the left side of the camera, but only attaches to a flimsy pieces of plastic with the shooting button on the right side. It popped off during the second use. Now I have to go through some mediator repair company, send in my camera ONLY AFTER I agree to ANY charges, even though it\'s still under warranty. Unfortunately, I don\'t just want it fixed so it can break again. I want a different camera. No such luck.')
  review_larain_laptop = Review.new(author: larain, product: laptop, score: 4, description: 'I ordered the 13,3 inch laptop fpr school. This laptop is perfect such great quality nice color great apps.its big and has alot of great things about it. A must buy for the price.')
  review_raza_laptop = Review.new(author: raza, product: laptop, score: 3, description: 'If surfing the internet is your main need this handles most internet brosers without a problem. Battery life is short compared to other laptops but it\'s only a 3 cell Lithium Ion so 4 hours isn\'t too bad.')

  # create user favoritings of reviews
  Favoriting.new(favoritor: raza, review: review_sharleen_mixer)
  Favoriting.new(favoritor: thaddeus, review: review_sharleen_mixer)
  Favoriting.new(favoritor: chris, review: review_larain_mixer)
  Favoriting.new(favoritor: sharleen, review: review_larain_mixer)
  Favoriting.new(favoritor: larain, review: review_raza_mixer)
  Favoriting.new(favoritor: thaddeus, review: review_raza_mixer)
  Favoriting.new(favoritor: chris, review: review_thaddeus_camera)
  Favoriting.new(favoritor: sharleen, review: review_thaddeus_camera)
  Favoriting.new(favoritor: larain, review: review_chris_camera)
  Favoriting.new(favoritor: raza, review: review_chris_camera)
  Favoriting.new(favoritor: thaddeus, review: review_sharleen_camera)
  Favoriting.new(favoritor: chris, review: review_sharleen_camera)
  Favoriting.new(favoritor: sharleen, review: review_larain_laptop)
  Favoriting.new(favoritor: larain, review: review_raza_laptop)



# Execute if command line arguments given
if ARGV.any?
  collection = ARGV[0]
  item       = ARGV[1]
  option     = ARGV[2]

  puts case collection
       when 'users'
         if user = users.find { |user| user.username == item }
           case option
           when 'reviews'
             UserReviewsView.new(user)
           when 'favorites'
             UserFavoritingsView.new(user)
           end
         else
           "No user with the username '#{item}' found."
         end
       when 'products'
         if product = products.find { |product| product.name == item }
           case option
           when 'reviews'
             ProductReviewsView.new(product)
           end
         else
           "No product with the name '#{item}' found."
         end
       else
         'Does not compute.'
       end
end
