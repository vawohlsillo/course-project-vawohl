class HomeController < ApplicationController
  def index
	@comment = Comment.new
	@comments = Comment.all.order("created at DESC")
	@post = Post.new
	@posts = Post.all.order("created_at DESC")
  end
end
