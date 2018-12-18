class Sheet < ActiveRecord::Base
	has_many :areas, :dependent => :destroy
end
