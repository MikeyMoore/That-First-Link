get '/' do
  erb :index
end

post '/login' do
  if !User.all.empty? 
  @user = User.find_by(username: params[:user][:username])
    if @user != nil
  	  if @user.authenticate(params[:user][:password])
   	    session[:user_id] = @user.id
    	  redirect '/'
  	  else
        @error = "Sorry, we don't recognize your username or password"
    	  erb :index
  	  end
    else 
  	   @error = "Start by registering!"
  	   erb :index
    end
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect '/'
end

