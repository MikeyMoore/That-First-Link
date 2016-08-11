get '/users/new' do
  erb :'/users/new', layout: false
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save 
    redirect '/'
  else
    @error = "Username already taken"
    erb :"/users/new"
  end
end