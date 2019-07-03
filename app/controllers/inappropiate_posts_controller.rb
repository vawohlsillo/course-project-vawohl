class InappropiatePostsController < ApplicationController
	def create
		@inappropiate_post = @post.inappropiate_posts.build(inappropiate_post_params)
		if @inaproppiate_post.save
			flash[:success] = 'You mark this post as inappropiated' 
			@post = @inappropiate_post.post.id		
			redirect_back(fallback_location: root_path) 
		else
			flash[:errors] = "Error: Something happen. Try it later"
			redirect_to "/"
		end
  	end

	def destroy
		@inappropiate_post = InappropiatePost.find(params[:id])
    		@inappropiate_post.destroy
    		flash[:danger] = "Unmark the post"
    		redirect_back(fallback_location: root_path)
	end
	

	
	def inappropiate_post_params
		params.permit(:inappropiate_post).require(:post_id)
	end
end
