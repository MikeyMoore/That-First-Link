post '/upvotes/:id' do
	post = Post.find(params[:id])
	Upvote.create(post_id: post.id, user_id: current_user.id)
	redirect "posts/#{post.id}"
end

post '/downvotes/:id' do
	post = Post.find(params[:id])
	Downvote.create(post_id: post.id, user_id: current_user.id)
	if post.downvotes.count > 5
		post.destroy
		redirect '/posts'
	else
		redirect "posts/#{post.id}"
	end
end