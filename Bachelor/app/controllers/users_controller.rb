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
	
	def show
      @user = User.find(params[:id])
	end 
	def edit
       @user = self.current_user   
	end 

	def delete
	end
	def update
    @user = self.current_user
    if @user.update(params[:user].permit(:email,:gucid,:fname,:lname,:dob,:gender,:location, :avatar))
	redirect_to "/users/#{@user.id}"
      else
	render 'edit'
      end
    end
      
    def user_params
		user_params = User.new(params.require(:user).permit(:email, :gucid, :fname , :lname , :dob :gender, :location, :avatar))
		user_params
  end
 	
  end


