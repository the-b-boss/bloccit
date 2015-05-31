class CommentsController < ApplicationController
  
  def create
    # raise params.inspect
#    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic

    @comment = current_user.comments.build(comment_params)

    authorize @comment

    @comment.post_id = @post.id
     
     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@topic, @post]
       # redirect_to topic_post_path(1, 54)
       # redirect_to /topics/@topic.id/posts/@post.id
       # /topics/1/posts/54
     else
       flash[:error] = "There was an error:  #{@comment.errors.full_messages.to_sentence}."
       redirect_to [@topic, @post]
     end

  end

  def destroy

#     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @topic = @post.topic_id
     @comment = @post.comments.find(params[:id])


     @topic = @post.topic_id
 
     authorize @comment

     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end


  def comment_params
    params.require(:comment).permit(:body)
  end

end
