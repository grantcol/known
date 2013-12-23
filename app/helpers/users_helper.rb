module UsersHelper
	def user_params
		params.require(:user).permit(:first, :last, :email, :handle, :password)
	end
end
