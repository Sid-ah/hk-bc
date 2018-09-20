get '/show_all_users' do
  erb :users_list
end

get '/add_new_user' do
  erb :new_user_form
end

get '/create_user' do
  user = User.new(email: params[:name],
                  name: params[:name],
                  password: params[:password])
  user.avatar = Faker::Avatar.image(Faker::Lorem.word, "80x80")

  redirect "/show_all_users"
end

get '/add_position/:user_id' do
  @user = User.find(params[:user_id])
  erb :add_position_form
end

get '/create_position/:user_id' do
  user = User.find(params[:user_id])
  salary = Salary.create(annual_salary: params[:salary])

  user.positions.create(title: params[:title],
                        started_at: params[:started_at],
                        salary: salary)

  redirect '/show_all_users'
end

get '/show_position/:position_id' do
  @position = Position.find(params[:position_id])
  @user = @position.user

  erb :position_details
end

get '/add-evalution/:position_id' do
  @position = Position.find(params[:position_id])
  @user = @position.user

  @position.evaluations.create(summary: params[:summary],
                               probation: (params[:probation] == 'yes' ? true : false))


  redirect "/show_position/#{@position.id}"
end
