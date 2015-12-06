class PostsController < ApplicationController

  
  def index
    @posts=Post.all
  end

  
  def edit
    @post=Post.find(params[:id])
  end

  def destroy
     @post=Post.find(params[:id])
     @post.destroy
     redirect_to posts_path
  end

  def update
  @post = Post.find(params[:id])
 
    if @post.update_attributes(post_params)
      flash[:success] = "Your post has been updated successfully !"
      redirect_to @post
    else
      render 'edit'
     
    end
 
end


def show
    @post = Post.find(params[:id])
  end



  def new
    @post = Post.new
  end



  def create
    @post = Post.new
    @post.content=params[:post][:content]
    @post.desttype=params[:desttype]
    @post.destid=params[:destid]
    @post.user_id=current_user.id ##should be taken from the session
    if @post.save
      flash[:success] = "Your post has been created successfully !"
      redirect_to :back
    else
      render 'new'
    end
  end



  private
    def post_params
      params.require(:post).permit(:content, :desttype,
                                   :dest_id,:user_id)
    end
end
