class FlagsController < ApplicationController
  def create
		@flag = current_user.flags.build(like_params)
		if @flag.save
			flash[:success] = 'Post flagged' 
			@post = @flag.post.id		
			redirect_back(fallback_location: root_path) 
		else
			flash[:errors] = "Error: Something happen. Try it later"
			redirect_to "/"
		end
  end

  def flag_params
		params.permit(:flag).require(:post_id)
  end
end
