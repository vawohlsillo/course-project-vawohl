class CallbacksController < Devise::OmniauthCallbacksController
   def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user, notice: 'Successfully log in !'	
   end

	# GET|POST /resource/auth/twitter
   def passthru
     super
   end

  # GET|POST /users/auth/twitter/callback
   def failure
     super
   end

  # protected

  # The path used when OmniAuth fails
   def after_omniauth_failure_path_for(scope)
     super(scope)
   end
end
