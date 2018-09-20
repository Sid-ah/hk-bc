def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def require_user
  redirect '/user/new' unless current_user
end
