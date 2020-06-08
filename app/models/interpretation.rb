class Interpretation < ActiveRecord::Base
	belongs_to :rorschachTest
	belongs_to :area
end
