class Admin::ZonesController < ApplicationController
	before_action :set_zone, only: [:edit, :update, :destroy]

	def index
		@zones = Zone.all
	end

	def show

	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_zone
			@zones = Zones.find(params[:id])
		end
end