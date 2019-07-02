class ApplicationController < ActionController::Base	
	protect_from_forgery #with: :exception
	#before_action :authenticate_user!

	def require_user
	    redirect_to root_path unless current_user
  	end

	
end
