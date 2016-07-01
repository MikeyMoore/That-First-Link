delete '/comments/:id' do
  comment = Comment.find(params[:id])
  comment.destroy
  redirect "/posts/#{params[:post_id]}"
end