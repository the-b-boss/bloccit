class CommentsController < ApplicationController
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
      
    @comment = current_user.comments.build(comment_params)
    authorize @comment

    @comment.post_id = @post.id
     
     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error:  #{@comment.errors.full_messages.to_sentence}."
       redirect_to [@topic, @post]
     end

  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
