class UsersController < ApplicationController
	def new 
		@user=User.new
	end
	def create
		@user=User.new(user_params)
		@user.save
		redirect_to "/users/#{@user.id}"
	end

	def index
	#@user = User.find(params[:id]) if User.exists?(params[:id])
	@users=User.all
	end

	def timeline
	  @follows1 = Follow.where(:follower_id => current_user.id)  #elly howa ana elcurrentuser id y3ny
	  @follows=@follows1.pluck(:followee_id)
	  @posts1= Post.all.where(:desttype => 1,:destid=>current_user.id)
	  @posts2=Post.where(desttype:1,destid:@follows)
	  @posts=@posts1+@posts2

  end 
  def show_followers
  	@followers1=Follow.where(followee_id:params[:user_id])
  	@followers=@followers1.pluck(:follower_id)
  	@users=User.where(id:@followers)
  end
  def show_followees
  	@followees1=Follow.where(follower_id:params[:user_id])
  	@followees=@followees1.pluck(:followee_id)
  	@users=User.where(id:@followees)
  end 
	def follow
		@follow=Follow.new
		@follow.follower_id=current_user.id
		@follow.followee_id=params[:user_id]
		@follow.save
		redirect_to :back
	end 
	
	def edit
       @user = self.current_user   
	end 

	def delete
	end
	def show
	  @user=User.find(params[:id]) #the person whose timeline is open 
		@user2=User.find(current_user.id)  #should be got from the session 
		@can=0
		@isfollow=Follow.where(follower_id:@user2.id , followee_id:@user.id)
		@isfollow2=Follow.where(follower_id:@user.id ,followee_id:@user2.id) 
		if(@isfollow.present?||@isfollow2.present? || current_user.id == @user.id)
			@can=1
		end
     end 
	protected def user_params
		user_params = User.new(params.require(:user).permit(:email, :gucid, :fname , :lname , :dob ,:gender, :location, :avatar))
		
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
		user_params = params.require(:user).permit(:email, :gucid, :fname , :lname , :dob, :gender, :location, :avatar)
		user_params
  end
 	
  end

