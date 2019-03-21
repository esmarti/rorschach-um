//function for colour areas when mouse is over button in "area selector"
$(document).ready(function(){
	$("#areaButtons button").hover(function() {
		//buscar el boton sobre el que ocurrio el event hover y guardar el attr "arr_zones".
		// este attr corresponde a los id de las zonas que corresponden a un area (attr id del button areaButtons)
  		var areas_arr=JSON.parse(this.attributes[1].value.toString());
  		//buscar todos los elementos de tipo area de la vista y cambiarles el stilo
  		for(var i=0; i<areas_arr.length+0; i++) {
  			$("#box #l_"+areas_arr[i]).toggleClass('proposed');
  		}
  	});
});