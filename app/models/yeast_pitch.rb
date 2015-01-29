class YeastPitch < ActiveRecord::Base
	belongs_to :brew
	has_many :yeasts
end
