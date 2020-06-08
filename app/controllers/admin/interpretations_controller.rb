class Admin::InterpretationsController < ApplicationController
  def index
    @interpretations = Interpretation.all
  end

  def new
    @interpretation = Interpretation.new
  end

  def create
    @interpretation = Interpretation.new(interpretation_params)

    respond_to do |format|
      if @interpretation.save
        format.html { redirect_to @interpretation, notice: 'Interpretation was successfully created.' }
        format.json { render :show, status: :created, location: @interpretation }
      else
        format.html { render :new }
        format.json { render json: @interpretation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interpretation.destroy
    respond_to do |format|
      format.html { redirect_to interpretations_url, notice: 'Interpretation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def interpretation_params
      params.require(:interpretation).permit(:id)
    end
  end
end
