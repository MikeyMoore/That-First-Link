get '/post' do
	@posts = Post.all
	@posts = @posts.reverse
	erb :'/posts/show'
end

post '/post' do
	Post.create(user_id: current_user.id, title: params[:title], content: params[:content])
	redirect '/post'
end

get '/post/:id' do
	@post = Post.find(params[:id])
	erb :'posts/post'
end

post '/post/:id' do
	Comment.create(user_id: session[:user_id], post_id: params[:id], content: params[:content])
	redirect "/post/#{params[:id]}"
end

delete '/post/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/post'
end