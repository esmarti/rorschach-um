class Patient < ActiveRecord::Base
	has_many :rorschachTests, :dependent => :destroy
	has_many :users, through: :rorschachTests
end
