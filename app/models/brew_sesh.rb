class BrewSesh < ActiveRecord::Base
	has_many :brews
	has_many :users
end
