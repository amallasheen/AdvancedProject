class FollowsController < ApplicationController

def new
	@follow=Follow.new
  end

  def create
     @follow = Follow.new(follow_params)
    @follow.save
    redirect_to :back
  end

def follow_params
  follow_params = params.require(:follows).permit(:follower_id, :followee_id)
  follow_params
end

end 