class SheetsController < ApplicationController
  before_action :set_sheet, only: [:show, :edit, :update, :destroy]

  # GET protocol_admin/1/sheets
  # GET protocol_admin/1/sheets.json
  def index
    @sheets = Sheet.all
  end

  # GET protocol_admin/1/sheets/1
  # GET protocol_admin/1/sheets/1.json
  def show
    @protocol=RorschachTest.find_by(id: protocol_admin_params[:protocol_admin_id])
    @patient=@protocol.patient
  end

  # GET protocol_admin/1/sheets/new
  def new
    @sheet = Sheet.new
  end

  # GET protocol_admin/1/sheets/1/edit
  def edit
    #id del protocolo
    @protocol = RorschachTest.find_by(id: protocol_admin_params[:protocol_admin_id])

    #array de zones disponibles en la sheet
    #recorrer todas las areas de la sheet, y filtrar las zones repetidas
    zones=Array.new
    @sheet.areas.each do |area|
      area.zones.each do |zone|
        zones.push(zone)
      end
    end
    @zonesUnique=zones.uniq { |s| s.id }
  end

  # POST /sheets
  # POST /sheets.json
  def create
    @sheet = Sheet.new(sheet_params)

    respond_to do |format|
      if @sheet.save
        format.html { redirect_to @sheet, notice: 'Sheet was successfully created.' }
        format.json { render :show, status: :created, location: @sheet }
      else
        format.html { render :new }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheets/1
  # PATCH/PUT /sheets/1.json
  def update
    respond_to do |format|
      if @sheet.update(sheet_params)
        format.html { redirect_to @sheet, notice: 'Sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @sheet }
      else
        format.html { render :edit }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheets/1
  # DELETE /sheets/1.json
  def destroy
    @sheet.destroy
    respond_to do |format|
      format.html { redirect_to sheets_url, notice: 'Sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheet
      # debo buscar la lamina que corresponde al protocolo a editar.
      @sheet = Sheet.find_by(id: sheet_params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sheet_params
      params.permit(:id)
    end

    def protocol_admin_params
      params.permit(:protocol_admin_id)
    end
end
