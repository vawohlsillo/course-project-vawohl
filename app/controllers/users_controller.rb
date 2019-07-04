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
		@post_new = Post.new
		@comment_new = Comment.new
		@posts = @user.posts.order("created_at DESC")	
  	end
	
	def user_params
		
		params.require(:user).permit(:image, :name, :city, :country, :email, :password, :sex)
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

  	

	def enable_admin
		@user = User.find(params[:user_id])
		@user.role = "Admin"
		@user.save
		redirect_to users_show_url(user_id: @user.id)
	end
	
	def unable_admin
		@user = User.find(params[:user_id])
		@user.role = nil
		@user.save
		redirect_to users_show_url(user_id: @user.id)
	end

	def enable_superadmin
		@user = User.find(params[:user_id])
		@user.role = "SuperAdmin"
		@user.save
		redirect_to users_show_url(user_id: @user.id)
	end
	
	def unable_superadmin
		@user = User.find(params[:user_id])
		@user.role = "Admin"
		@user.save
		redirect_to users_show_url(user_id: @user.id)
	end
	
	def edit_user
		@user = User.find(params[:user_id])
  	end	

	def update
		@user = User.find(params[:user_id])
		respond_to do |format|
	      		if @user.update(update_user_params)
				flash[:success] = "User was successfully edited"
				redirect_to users_show_url(user_id: @user.id)
	      		else
				flash[:danger] = "Error. Try it later"
				redirect_to users_show_url(user_id: @user.id)
	      		end
    		end
	end
	
	def update_user_params
		params.require(:user).permit(:name, :biography)
	end
	#private	
	
	#def set_user
	#	@user = User.find(params[:id])	
	#end
end
