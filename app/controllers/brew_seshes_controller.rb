class BrewSeshesController < ApplicationController
	def new
		@brew_sesh = BrewSesh.new
	end

	def create
		@brew = Brew.new(brew_params)

		if @brew.save
			redirect_to brews_url
		else
			flash.now[:errors] = @brew.errors.full_messages
			render :new
		end
	end

	private
	def brew_params
		params.require(:brew).permit(:name, :date)
	end	
end
