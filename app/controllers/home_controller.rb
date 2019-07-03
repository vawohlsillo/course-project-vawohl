class HomeController < ApplicationController
  def index
	@comment_new = Comment.new
	@comments = Comment.all.order("created at DESC")
	@post_new = Post.new
	@posts = Post.all.order("created_at DESC")
  end
end
