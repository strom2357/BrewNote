class GrainMash < ActiveRecord::Base
	belongs_to :brew
	has_many :grains
end
