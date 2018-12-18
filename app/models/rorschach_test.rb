class RorschachTest < ActiveRecord::Base
	belongs_to :user
	belongs_to :patient
	has_many :interpretations, :dependent => :destroy, foreign_key: :rorschachTest_id
end
