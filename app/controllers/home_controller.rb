class HomeController < ApplicationController
  def index
	@post = Post.new
	@user = User.new
	@posts = Post.all.order("created_at DESC")
  end
end
