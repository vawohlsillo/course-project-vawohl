class UsersController < ApplicationController
	#before_action :authenticate_user!
  	def index
		@post = Post.new
  	end
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :sex)
	end

	def google_user_params
		params.require(:user).permit(:name, :email, :password, :provider, :uid)
	end
	def new
		@user = User.new
	end

	def create
		if current_user.uid != nil
			@user = User.new(google_user_params)
			if @user.save
        			format.html { redirect_to root_url, notice: 'User was successfully created.' }
        			format.json { render :show, status: :created, location: @user }
      			else
        			format.html { render :new }
        			format.json { render json: @user.errors, status: :unprocessable_entity }
      			end
		else
			@user = User.new(user_params)
			if @user.save
        			format.html { redirect_to root_url, notice: 'User was successfully created.' }
        			format.json { render :show, status: :created, location: @user }
      			else
        			format.html { render :new }
        			format.json { render json: @user.errors, status: :unprocessable_entity }
      			end
		end
	end

  	def show
  	end

  	def edit
  	end
end
