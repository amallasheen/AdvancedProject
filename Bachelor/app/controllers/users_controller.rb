class UsersController < ApplicationController
	def new 
		@user=User.new
	end
	def create
		@user=User.new(user_params)
		@user.save
	end

	def index
	#	@user = User.find(params[:id]) if User.exists?(params[:id])
	end
	
	
	def edit

	end 

	def delete
	end

	def timeline
		@user=User.find(1)
		@posts=Post.where(:destid=>@user.id,:desttype=>@user.doctor)
	

	end 
	protected def user_params
		user_params = User.new(params.require(:user).permit(:email, :gucid, :fname , :lname , :dob ,:gender, :location, :avatar))
		
	end
end
