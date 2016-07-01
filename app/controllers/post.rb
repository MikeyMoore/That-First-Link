get '/posts' do
	@posts = Post.all
	@posts = @posts.reverse
	@filter = params[:filter]
	erb :'/posts/show'
end

post '/posts' do
	Post.create(user_id: current_user.id, title: params[:title], content: params[:content])
	redirect '/posts'
end

get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'posts/post'
end

post '/posts/:id' do
	Comment.create(user_id: session[:user_id], post_id: params[:id], content: params[:content])
	redirect "/posts/#{params[:id]}"
end

delete '/posts/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/posts'
end