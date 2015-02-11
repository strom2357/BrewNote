class BrewsController < ApplicationController

	def index
		@brews = Brew.all
	end

	def new
		@brew = Brew.new
		render :new
	end

	def show
		#etc... update this so we're just using a json API
		render :json => Brew.find(params[:id]), include: [:users, :grains, :malts, :hops, :yeasts]
		#render :show
	end

	def create

		@brew = Brew.new(brew_params)


		if @brew.save
			@brew_sesh = BrewSesh.new({user_id: current_user.id, brew_id: @brew.id})

			# HOP LOGIC
			@hop_addition = HopAddition.create!({brew_id: @brew.id})
			@hop_addition.notes = params[:hop_addition][:notes]
			@hop_addition.save!

			params[:hop].count.times do |i|
			
			@hops = Hop.create!({
				hop_addition_id: @hop_addition.id,
				name: params[:hop]["#{i}"][:name], 
				form: params[:hop]["#{i}"][:form],
				boil_time: params[:hop]["#{i}"][:boil_time],
				quantity: params[:hop]["#{i}"][:quantity]
				})
			end

			# MALT LOGIC
			@malt_addition = MaltAddition.create!({brew_id: @brew.id})
			@malt_addition.notes = params[:malt_addition][:notes]
			@malt_addition.save!

			@malts = Malt.create!({
				malt_addition_id: @malt_addition.id,
				name: params[:malt][:name],
				quantity: params[:malt][:quantity]
				})

			# GRAIN LOGIC
			@grain_mash = GrainMash.create!({brew_id: @brew.id})
			@grain_mash.notes = params[:grain_mash][:notes]
			@grain_mash.save!

			@grains = Grain.create!({
				grain_mash_id: @grain_mash.id,
				name: params[:grain][:name], 
				quantity: params[:grain][:quantity],
				mash_temp: params[:grain][:mash_temp],
				mash_time: params[:grain][:mash_time]
				})

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
