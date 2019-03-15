class Admin::ZonesController < ApplicationController
	before_action :set_zone, only: [:show, :edit, :update, :destroy]

	def index
		@zones = Sheet.find_by_id(zone_params[:sheet_id]).areas.find_by_id(zone_params[:area_id]).zones
		@sheet_id = zone_params[:sheet_id]
		@area_id = zone_params[:area_id]
	end

	def show
		@zone
		@sheet_id = zone_params[:sheet_id]
		@area_id = zone_params[:area_id]

		#listar las areas donde la zona es parte
		@areas_partOf = @zone.areas
	end

	def edit
		@zone
		@area = Area.find_by_id(zone_params[:area_id])
		@sheet = Sheet.find_by_id(zone_params[:sheet_id])
	end

	def update
		respond_to do |format|
			if @zone.update(edit_params)
				format.html { redirect_to admin_sheet_area_zone_path(@zone), notice: 'Zone was successfully updated.' }
				format.json { render :show, status: :ok, location: admin_sheet_area_zone_path(@zone) }
			else
				format.html { render :edit }
				format.json { render json: @zone.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@zone = Zone.new
	end

	def create
		@zone = Zone.new(edit_params)
		@area = Area.find_by_id(zone_params[:area_id])
		@sheet = Sheet.find_by_id(zone_params[:sheet_id])

		respond_to do |format|
			if @zone.save
				format.html { redirect_to admin_sheet_area_zone_path(@zone), notice: 'Zone was successfully created.' }
				format.json { render :show, status: :created, location: admin_sheet_area_zone_path(@zone) }
			else
				format.html { render :new }
				format.json { render json: @zone.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@zone.destroy
		respond_to do |format|
			format.html { redirect_to admin_sheet_area_zone_url(zone_params[:sheet_id]) , notice: 'Zone was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_zone
			@zone = Zone.find(zone_params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def zone_params
			params.permit(:sheet_id, :area_id, :id)
		end
		def edit_params
			params.require(:zone).permit(:coord_x, :coord_y, :width, :height, :z_index, :bg_image)
		end
end