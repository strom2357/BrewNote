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

			#dealing with hops:
			@hop_addition = HopAddition.create!({brew_id: @brew.id})
			@hops = Hop.create!({name: params[:hop][:name], hop_addition_id: @hop_addition.id})

			@malt_addition = MaltAddition.create!({brew_id: @brew.id})
			@malts = Malt.create!({name: params[:malt][:name], malt_addition_id: @malt_addition.id})

			@grain_mash = GrainMash.create!({brew_id: @brew.id})
			@grains = Grain.create!({name: params[:grain][:name], mash_id: @grain_mash.id})

			@yeast_pitch = YeastPitch.create!({brew_id: @brew.id})
			@yeasts = Yeast.create!({name: params[:yeast][:name], yeast_pitch_id: @yeast_pitch.id})
			
			@brew_sesh.save
			#@grains.save
			render json: @brew.hops
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
