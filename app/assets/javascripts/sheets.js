//function for colour areas when mouse is over button in "area selector"
$(window).on("load",function(){
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
  		reset_areas();
  		evento.stopImmediatePropagation();
		//buscar el boton sobre el que ocurrio el event hover y guardar el attr "arr_zones".
		// este attr corresponde a los id de las zonas que corresponden a un area (attr id del button areaButtons)
  		var areas_arr=JSON.parse(this.attributes[1].value.toString());
  		//buscar todos los elementos de tipo area de la vista y cambiarles el stilo
  		for(var i=0; i<areas_arr.length+0; i++) {
  			$("#box #l_"+areas_arr[i]).toggleClass('selected');
  		}
  		//setear el estado del area como "seleccionada"
  		//mostrar formulario de ingreso de interpretacion
  	});
});