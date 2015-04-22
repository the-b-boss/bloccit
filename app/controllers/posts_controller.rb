class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
      @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
      authorize @post
    @post.topic_id = @topic.id
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
      authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)
     @post.topic_id = @topic.id
      authorize @post
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

  def markdown_title(markdown)
    render_as_markdown(@post.title)
  end

  def markdown_body(markdown)
    render_as_markdown(@post.body)
  end

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
   
end
