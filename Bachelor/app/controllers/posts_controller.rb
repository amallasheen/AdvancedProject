class PostsController < ApplicationController
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

  def show
  end

  def edit
  end

  def delete
  end

def post_params
    post_params = params.require(:post).permit(:desttype, :destid, :content, user_attributes: [:id])
    post_params
  end
def follow_params
  follow_params = params.require(:follows).permit(:follower_id, :followee_id)
  follow_params
end
end
