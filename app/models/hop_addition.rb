class HopAddition < ActiveRecord::Base
	belongs_to :brew
	has_many :hops
end
