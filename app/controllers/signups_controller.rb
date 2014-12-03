class SignupsController < ApplicationController

	def new
		@user = User.new
	end

  def create
  	@user = User.new user_params

  	if @user.save
  		redirect_to albums_path, notice: 'Created new user'
  	else
  		render action: 'new'
  end
end

private
	def user_params
		params.
			require(:user).
			permit(:name, :password, :password_confirmation)
	end
end
