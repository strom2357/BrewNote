class Fermentation < ActiveRecord::Base
	belongs_to :brew
	has_one :primary
	has_one :secondary
end
