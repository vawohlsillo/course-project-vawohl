class PostsController < ApplicationController
  #before_action :set_post, except: [:create]
  before_action :require_user, only: [:create, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @post = Post.find(params[:post_id])
    @posts = Post.all
    @user = User.find(@post.user_id)
    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC")
    #post.user.image = @user.image_string
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
	@comment = Comment.new
  	#@user = @post.user
  end

  # GET /posts/new
  def new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(create_post_params)
    @post.user_id = current_user.id
    @post.inappropiate_post = InappropiatePost.new
    respond_to do |format|
      if @post.save
        format.html { redirect_to "/", notice: 'Post was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_user
	@user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def create_post_params
      params.require(:post).permit( :title, :description, files: [] )
    end
end
