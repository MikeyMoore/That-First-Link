delete '/comment/:id' do
  comment = Comment.find(params[:id])
  comment.destroy
  redirect "/post/#{params[:post_id]}"
end