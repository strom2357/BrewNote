class Brew < ActiveRecord::Base
	has_many :brew_seshes
	has_many :users, through: :brew_seshes
	has_many :grains, through: :grain_mash
	has_many :malts, through: :malt_addition
	has_many :hops, through: :hop_addition
	has_many :yeasts, through: :yeast_pitch
	has_one :fermentation
	has_one :primary, through: :fermentation
	has_one :secondary, through: :fermentation
	has_many :secondary_additions, through: :secondary
end
