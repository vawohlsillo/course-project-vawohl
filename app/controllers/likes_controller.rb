class LikesController < ApplicationController
  #before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
	@like = current_user.likes.build(like_params)
	if @like.save
		flash[:success] = 'You liked this post' 
		@post = @like.post.id		
		redirect_back(fallback_location: root_path) 
	else
		flash[:errors] = "Error: Something happen. Try it later"
		redirect_to "/"
	end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    #respond_to do |format|
    #  format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
    flash[:danger] = "Unlike the post"
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      @user_id = current_user.id
      params.require(:like).permit(:post_id)
    end
end
