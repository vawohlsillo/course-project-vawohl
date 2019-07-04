class InappropiateCommentsController < ApplicationController
  def new
	@inappropiate_comment = InappropiateComment.new
  end

  def create
	@inappropiate_comment = current_user.inappropiate_comments.build(inappropiate_comment_params)
	if @inappropiate_comment.save
		flash[:success] = 'You mark this comment as inappropiated' 
		@comment = @inappropiate_comment.comment.id		
		redirect_back(fallback_location: root_path) 
	else
		flash[:errors] = "Error: Something happen. Try it later"
		redirect_back(fallback_location: root_path)
	end
  end

  def destroy
	@inappropiate_comment = InappropiateComment.find(params[:id])
	@inappropiate_comment.destroy
	flash[:danger] = "Unmark the comment"
	redirect_back(fallback_location: root_path)
  end

  def update
	respond_to do |format|
		if @inappropiate_comment.update(inappropiate_comment_params)
			format.html { redirect_to @inappropiate_comment, notice: 'Inappropiate was successfully updated.' }
			format.json { render :show, status: :ok, location: @inappropiate }
    		else
      			format.html { render :edit }
      			format.json { render json: @inappropiate.errors, status: :unprocessable_entity }
		end
	end
  end

  def inappropiate_comment_params
	@user_id = current_user.id
	params.require(:inappropiate_comment).permit(:comment_id)
  end
end
