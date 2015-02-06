class BrewsController < ApplicationController

	def index
		@brews = Brew.all
	end

	def new
		@brew = Brew.new
		render :new
	end

	def show
		@brew = Brew.find(params[:id])
		render :show
	end

	def create
		@brew = Brew.new(brew_params)


		if @brew.save
			@brew_sesh = BrewSesh.new({user_id: current_user.id, brew_id: @brew.id})
			@hop_addition = HopAddition.create!({brew_id: @brew.id})
			#@hops = etc..
			@brew_sesh.save
			#@grains.save
			render json: @brew.users
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
