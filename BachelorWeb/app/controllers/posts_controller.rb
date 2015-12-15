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
  def new
@post=Post.new
  end

  def create
     @post = Post.new(post_params)
    @post.save
    redirect_to '/posts/index'
  end

  def index
   # @post= Post.find_by desttype: '3'
  # @post=Post.where("desttype = ?", 3 And );
  #desttype= 1 means that it is a post on a timeline
  #@posts = Post.where(:desttype => 1, :destid => params[:destid]) #destid elly howa wa7ed mn elfollowers bto3y
  @follows = Follow.where(:followee_id => params[:user_id])  #elly howa ana elcurrentuser id y3ny
#@posts = Post.joins(:follows).includes(:follows).where(:follows => {:followee_id => params[:user_id]}, :desttype =>1)
  #game_joins =  Game.joins(:game_logs).where(:game_logs => { :player_id => 1 })
  #@posts = Post.joins(:follows).where(:followee_id => params[:user_id])
  @posts= Post.all.where(:desttype => 1)
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
def post_params
    post_params = params.require(:post).permit(:desttype, :destid, :content,:title, user_attributes: [:id])
    post_params
  end

end
