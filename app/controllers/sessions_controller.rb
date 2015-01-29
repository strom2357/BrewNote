class SessionsController < ApplicationController
	before_action :require_signed_out!, only: [:new, :create]
	before_action :require_signed_in!, only: [:destroy]

	def new
		render :new
	end

	def create
		@user = User.find_by_credentials(
			params[:name],
			params[:password]
		)

		if @user
			sign_in(@user)
			redirect_to brews_url #doesn't exist yet
		else
			flash.now[:errors] = ["Invalid username or password"]
		end
	end

	def destory
		sign_out
		redirect_to new_session_url
	end
end
