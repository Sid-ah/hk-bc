# Code to populate the database ...

tenley_details = { :name    => "Tenley",
                   :license => "OH-9384764",
                   :age     => 1,
                   :weight  => 8 }

jayda_details = { :name    => "Jayda",
                  :license => "OH-4893720",
                  :age     => 3,
                  :weight  => 35 }


Dog.create(tenley_details)

jayda = Dog.new(jayda_details)
jayda.save
