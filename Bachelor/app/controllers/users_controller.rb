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
	def user_params
		user_params = User.new(params.require(:user).permit(:email, :gucid, :fname , :lname , :dob :gender, :location, :avatar))
		user_params
	end
	
	def edit

	end 

	def delete
	end
end
