class BrewSesh < ActiveRecord::Base
	belongs_to :brew
	belongs_to :user
end
