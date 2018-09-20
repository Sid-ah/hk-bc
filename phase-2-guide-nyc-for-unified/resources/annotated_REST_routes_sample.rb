get "/" do

  # We'll always have an index page, but maybe we don't want to use it this time.
  redirect "/dogs"
end

get "/dogs" do
  @dogs = Dog.all

  # Let's assume we have a folder set up for each model, 
  # and that's where our views for dogs are. 
  # We include the folder path "dogs" here.
  erb :"dogs/index"
end

get "/dogs/new" do
  @dog = Dog.new
  # By convention, this should take us to a view that holds a form 
  # with input fields for setting a new dog's attributes. 
  erb :"dogs/new"
end

# Sumbitting the 'dogs/new' form sends us to the POST route. 
# Our params are assigned based on the form field names, 
# e.g. "dog[name]" and "dog[weight]".
post "/dogs" do

  # When Rack sees fields called "dog[name]" and "dog[weight]",
  # it automatically adds a key called :dog to our params hash.
  # That key's value is ANOTHER hash with each form field and its value
  # as a key/value pair.
  # It looks like this:
  # params = { :dog => { :name => "Tenley", :weight => 55}}
  # We only want the innermost hash with name and weight keys, so we'll
  # look inside params, and then return the hash at the :dog key.
  @dog = Dog.new(params[:dog])
  if new_dog.save
    # If we've succeeded in saving a dog, we'll take the user 
    # back to the list of all the dogs.
    redirect "/dogs"
  else
    # If we fail, we'll render the same form again, and pass along 
    # any error messages that pop up so we can list all the errors 
    # in the :"dogs/new" view.
    @errors = @dog.errors.full_messages

    erb :"dogs/index"
  end
end

get "/dogs/:id" do
  # We want to look at a specific dog, so let's go get it,
  # using whatever follows "/dogs/" in the URL. 
  # (Let's hope it's a number! How will line 57 break if someone visits "/dogs/dog"?)
  # And we'll want our erb file to do stuff with it,
  # so let's set it to an instance variable.
  @dog = Dog.find(params[:id])

  # By convention, we'll use a "show" view to show a single dog.
  erb :"dogs/show"
end

get "/dogs/:id/edit" do
  # By convention, this should take us to a view that holds a form 
  # with input fields for editing a dog's attributes. 
  # Users hate having to remember what the current attributes are. 
  # In the view, we can pre-set a dog's current attributes in the form itself, 
  # but we can't do that unless we HAVE a dog. 
  # So let's send the right dog to the view via an instance variable.
  @dog = Dog.find(params[:id])

  erb :"dogs/edit"
end

# Submitting the form shown at :"dogs/edit" takes us to the PUT route.
# (Did you remember to fake out your HTML with a hidden input field named _method?) 
# We'll redirect to that dog's show page if the edit worked. 
# If not, we'll stick around and so we can try again, like we did
# with the POST route at line 25.
put "/dogs/:id" do
  @dog = Dog.find(params[:id])

  # Remember how params has a bunch of key/value pairs accessible from within the
  # :dog hash? If the keys match the Dog model's attribute names, we don't need to
  # set them individually. We can pass the whole :dog hash in as an argument, 
  # letting Rack handle the specifics. 
  # (If this tactic fails, check the form in your view. Are the field names the same 
  # as the Dog model's attribute names? If each Dog has a :name and a :weight, a form field
  # called "dog[first_name]" will be ignored. We'd want to change it to "dog[name]".)
  if @dog.update(params[:dog])

    redirect "/dogs/#{@dog.id}"
  else
    @errors = @dog.errors.messages

    erb :"dogs/edit"
  end
end

delete "/dogs/:id" do
  @dog = Dog.find(params[:id])
  # We'll never forget you, Tenley...
  @dog.destroy 

  # There's no more dog at @dog.id to redirect to. Back to the list then.
  redirect "/dogs"
end
