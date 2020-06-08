//function for colour areas when mouse is over button in "area selector"
$( document ).on('turbolinks:load',function(){
	//mostrar un area al pasar con el mouse sobre el areaButton
	$("#areaButtons button").mouseenter(function() {
		//buscar el boton sobre el que ocurrio el event hover y guardar el attr "arr_zones".
		// este attr corresponde a los id de las zonas que corresponden a un area (attr id del button areaButtons)
  		var areas_arr=JSON.parse(this.attributes[1].value.toString());
  		//buscar todos los elementos de tipo area de la vista y cambiarles el stilo
  		for(var i=0; i<areas_arr.length+0; i++) {
  			$("#box #l_"+areas_arr[i]).addClass('proposed');
  		}
  	});
  	$("#areaButtons button").mouseout(function() {
		//buscar el boton sobre el que ocurrio el event hover y guardar el attr "arr_zones".
		// este attr corresponde a los id de las zonas que corresponden a un area (attr id del button areaButtons)
  		var areas_arr=JSON.parse(this.attributes[1].value.toString());
  		//buscar todos los elementos de tipo area de la vista y cambiarles el stilo
  		for(var i=0; i<areas_arr.length+0; i++) {
  			$("#box #l_"+areas_arr[i]).removeClass('proposed');
  		}
  	});

	//seleccionar un area completa desde el areaButton y colorearla
  	$("#areaButtons button").mousedown(function(evento) {
      //si el areaButton ya estaba en estado pressed, al hacer click de nuevo debe limpiarse la selección.
        if( event.target.className == 'areaButton_pressed' ){
          reset_areas();
          return;
        }
      //limpiar selecciones que se hayan hecho
  		reset_areas();
  		reset_areaButtons();
  		evento.stopImmediatePropagation();
		//buscar el boton sobre el que ocurrio el event hover y guardar el attr "arr_zones".
		// este attr corresponde a los id de las zonas que corresponden a un area (attr id del button areaButtons)
  		var areas_arr=JSON.parse(this.attributes[1].value.toString());
  		//buscar todos los elementos de tipo area de la vista y cambiarles el stilo
  		for(var i=0; i<areas_arr.length+0; i++) {
  			$("#box #l_"+areas_arr[i]).toggleClass('selected');
  		}

  		//cambiar estilo del boton para que se vea "presionado"
  		$(this).addClass("areaButton_pressed");
  	});

  	//al hacer click en el chckbox W (respuesta global, esconder otros elementos del form
  	$('#_admin_interpretations_globalRespW_CheckBox').change(function() {
  		if ( this.checked == true) {
  			//esconder elementos no correspondientes para una respuesta W
  			document.getElementById("div_ndefinedRes_Dd99").style.display = "none";
        document.getElementById("_admin_interpretations_undefinedRes_Dd99").disabled=true;
        document.getElementById("_admin_interpretations_undefinedRes_DdS99").disabled=true;
  			document.getElementById("_admin_interpretations_direction").selectedIndex=0
        document.getElementById("div_direction").style.display = "none";
        document.getElementById("_admin_interpretations_globalRespWS_CheckBox").disabled=true;
  		}
  		else {
  			//volver a mostrar los elementos
  	 		document.getElementById("div_ndefinedRes_Dd99").style.display = "block";
        document.getElementById("_admin_interpretations_undefinedRes_Dd99").disabled=false;
        document.getElementById("_admin_interpretations_undefinedRes_DdS99").disabled=false;
        document.getElementById("_admin_interpretations_direction").selectedIndex=0
  			document.getElementById("div_direction").style.display = "block";
        document.getElementById("_admin_interpretations_globalRespWS_CheckBox").disabled=false;
  		}
  	});
    $('#_admin_interpretations_globalRespWS_CheckBox').change(function() {
      if ( this.checked == true) {
        //esconder elementos no correspondientes para una respuesta W
        document.getElementById("div_ndefinedRes_Dd99").style.display = "none";
        document.getElementById("_admin_interpretations_undefinedRes_Dd99").disabled=true;
        document.getElementById("_admin_interpretations_undefinedRes_DdS99").disabled=true;
        document.getElementById("_admin_interpretations_direction").selectedIndex=0
        document.getElementById("div_direction").style.display = "none";
        document.getElementById("_admin_interpretations_globalRespW_CheckBox").disabled=true;
      }
      else {
        //volver a mostrar los elementos
        document.getElementById("div_ndefinedRes_Dd99").style.display = "block";
        document.getElementById("_admin_interpretations_undefinedRes_Dd99").disabled=false;
        document.getElementById("_admin_interpretations_undefinedRes_DdS99").disabled=false;
        document.getElementById("_admin_interpretations_direction").selectedIndex=0
        document.getElementById("div_direction").style.display = "block";
        document.getElementById("_admin_interpretations_globalRespW_CheckBox").disabled=false;
      }
    });

    $('#_admin_interpretations_undefinedRes_Dd99').change(function() {
      if ( this.checked == true) {
        document.getElementById("_admin_interpretations_undefinedRes_DdS99").disabled=true;
      }
      else {
        document.getElementById("_admin_interpretations_undefinedRes_DdS99").disabled=false;
      }
    });
    $('#_admin_interpretations_undefinedRes_DdS99').change(function() {
      if ( this.checked == true) {
        document.getElementById("_admin_interpretations_undefinedRes_Dd99").disabled=true;
      }
      else {
        document.getElementById("_admin_interpretations_undefinedRes_Dd99").disabled=false;
      }
    });
});

function changeState(obj){
	//setear el estado del area como "seleccionada"
	//mostrar formulario de ingreso de interpretacion

}