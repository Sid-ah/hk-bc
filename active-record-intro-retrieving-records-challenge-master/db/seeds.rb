# Code to populate the database ...

tenley_details = { :name    => "Tenley",
                   :license => "OH-9384764",
                   :age     => 1,
                   :breed   => "Golden Doodle" }

jayda_details = { :name    => "Jayda",
                  :license => "OH-4893720",
                  :age     => 3,
                  :breed   => "Bull Terrier" }

eleanor_details = { :name    => "Eleanor",
                    :license => "OH-9843098",
                    :age     => 1,
                    :breed   => "Pit Bull" }

Dog.create(tenley_details)
Dog.create(eleanor_details)

jayda = Dog.new(jayda_details)
jayda.save
