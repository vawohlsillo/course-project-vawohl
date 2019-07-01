class RegistrationsController < Devise::RegistrationsController

	private
	
	def sign_up_params
		params.require(:user).permit(:name, :email, :sex, :password, :password_confirmation)
	end

	def account_update_params
		# AÑADIR IMAGE MÀS ADELANTE
	params.require(:user).permit(:image, :name, :biography, :sex, :email, :password, :password_confirmation, :current_password)
	end

	

end
