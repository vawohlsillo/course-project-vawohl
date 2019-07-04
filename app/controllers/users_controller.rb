class UsersController < ApplicationController
	before_action :require_user, only: [:index, :show, :edit, :update]	
	#before_action :set_user, except: [:create]
	before_action :authenticate_user!, except: [:index, :show]
  	def index
		@post_new = Post.new
		@comment_new = Comment.new
		@posts = current_user.posts.order("created_at DESC")
  	end

	def show
		@user = User.find(params[:user_id])
		@post = Post.new
		@comment = Comment.new
		@posts = @user.posts.order("created_at DESC")	
  	end
	
	def user_params
		
		params.require(:user).permit(:image, :name, :email, :password, :sex)
	end

	def google_user_params
		params.require(:user).permit(:image, :name, :email, :password, :provider, :uid)
	end
	def new

	end

	def create
		if current_user.uid != nil
			@user = User.new(google_user_params)
			if @user.save
        			format.html { redirect_to root_url, notice: 'User was successfully created.' }
        			#format.json { render :show, status: :created, location: @user }
      			else
        			format.html { render :new }
        			#format.json { render json: @user.errors, status: :unprocessable_entity }
      			end
		else
			@user = User.new(user_params)
			if @user.save
        			format.html { redirect_to root_url, notice: 'User was successfully created.' }
        			#format.json { render :show, status: :created, location: @user }
      			else
        			format.html { render :new }
        			#format.json { render json: @user.errors, status: :unprocessable_entity }
      			end
		end
	end

  	def edit_user
		
  	end

	def update

	end
	
	#private	
	
	#def set_user
	#	@user = User.find(params[:id])	
	#end
end
