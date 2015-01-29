class Secondary < ActiveRecord::Base
	belongs_to :fermentation
	has_many :secondary_additions
end
