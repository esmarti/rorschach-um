function reset_areas() {
	//select img elements
    var elements=$("#box img");

    //change style to "default" (not selected)
    for(var i=0; i<elements.length; i++){
    	if(elements[i].id.match(/capa[0-9]{1,2}/)){
    		elements[i].className="area";
    	}
    }
    return;
}