class Admin::ZonesController < ApplicationController
	before_action :set_zone, only: [:edit, :update, :destroy]

	def index
	  @zones = Zone.all
	end
end
