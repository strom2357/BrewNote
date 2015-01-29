class MaltAddition < ActiveRecord::Base
	belongs_to :brew
	has_many :malts
end
