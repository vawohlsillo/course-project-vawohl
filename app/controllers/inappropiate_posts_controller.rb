class InappropiatePostsController < ApplicationController
	def new
		@inappropiate_post = InappropiatePost.new
	end	
	def create
		@inappropiate_post = current_user.inappropiate_posts.build(inappropiate_post_params)
		if @inappropiate_post.save
			flash[:success] = 'You mark this post as inappropiated' 
			@post = @inappropiate_post.post.id		
			redirect_back(fallback_location: root_path) 
		else
			flash[:errors] = "Error: Something happen. Try it later"
			redirect_back(fallback_location: root_path)
		end
  	end

	def destroy
		@inappropiate_post = InappropiatePost.find(params[:id])
    		@inappropiate_post.destroy
    		flash[:danger] = "Unmark the post"
    		redirect_back(fallback_location: root_path)
	end

	def update
    		respond_to do |format|
      			if @inappropiate_post.update(inappropiate_post_params)
        			format.html { redirect_to @inappropiate_post, notice: 'Inappropiate was successfully updated.' }
        			format.json { render :show, status: :ok, location: @inappropiate }
  	    		else
  	      			format.html { render :edit }
  	      			format.json { render json: @inappropiate.errors, status: :unprocessable_entity }
      			end
    		end
  	end
	

	
	def inappropiate_post_params
		@user_id = current_user.id
		params.require(:inappropiate_post).permit(:post_id)
	end
end
