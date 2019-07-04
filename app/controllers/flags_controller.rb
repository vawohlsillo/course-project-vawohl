class FlagsController < ApplicationController
  def create
		@flag = current_user.flags.build(flag_params)
		if @flag.save
			flash[:success] = 'Post flagged' 
			@post = @flag.post.id		
			redirect_back(fallback_location: root_path) 
		else
			flash[:errors] = "Error: Something happen. Try it later"
			redirect_to "/"
		end
  end

  def destroy
	@flag = Flag.find(params[:id])
    	@flag.destroy
    	flash[:danger] = "Unflag the post"
    	redirect_back(fallback_location: root_path)
  end
  def flag_params
		params.require(:flag).permit(:post_id)
  end
end
