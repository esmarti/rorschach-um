
 class MainController < ApplicationController
 	#no autenticar, salvo que se este pidiendo home
	skip_before_action :require_login, only: [:home]

	def show
  end

  def home
  end
end
