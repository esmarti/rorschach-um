class ProtocolAdminController < ApplicationController

  def index
    #mostrar todos los prototoclos que existan y que pertenezcan al usuario y/o misma institucion
    #si no hay un protocolo poner un link a new
    @protocols=current_user.rorschachTests
    otherPatients=Patient.where(institution: current_user.institution)

    otherPatients.each do |patient|
      if patient.rorschachTests != nil then
       @protocols << patient.rorschachTests
      end
    end
    return @protocols
  end

  def edit
    @id=protocol_params[:id]
    #mostrar laminas
  end

  def new
    #mostrar formulario, donde elegir un usuario para pasarle a "create" y generar el protocolo nuevo
  end

  def create
    @patient=Patient.find_by(last_name: patient_params[:last_name])
    #generacion de un nuevo objeto rorschachTest
    current_user.patients.push(@patient)

  	respond_to do |format|
  	  if current_user.save
  	    format.html { redirect_to protocol_admin_path(current_user.rorschachTests.all.last), notice: 'Protocol was successfully created.' }
  	    format.json { render :show, status: :created, location: protocol_admin_path }
  	  else
  	    format.html { render :index }
  	    format.json { render json: current_user.rorschachTests.all.last, status: :unprocessable_entity }
  	  end
  	end
  end

  def show
  	# mostrar para consultas los resultados de un determinado protocolo
    @protocol=RorschachTest.find_by(id: protocol_params[:id])
    @patient=@protocol.patient
    @sheets = Sheet.all
  end

  def destroy
    #eliminar un protocolo
    @protocol=RorschachTest.find_by(id: protocol_params[:id])
    @protocol.destroy
    respond_to do |format|
      format.html { redirect_to protocol_admin_index_path, notice: 'Protocol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def protocol_params
      params.permit(:id)
    end

  	def patient_params
  		params.require(:patient).permit(:id, :given_name, :last_name, :phone, :age, :sex, :isPatient, :user, :institution)
  	end
end