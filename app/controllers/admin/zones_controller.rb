class Admin::ZonesController < ApplicationController
	before_action :set_zone, only: [:edit, :update, :destroy]

	def index
	  @zones = Zone.all
	end

	def show

	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_sheet
	    @sheet = Sheet.find(params[:id])
	  end
	end

end
