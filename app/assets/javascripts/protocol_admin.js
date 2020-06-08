function reset_areas() {
	//select img elements and remove selected style
    $( "#box img.area" ).removeClass("proposed selected");
    reset_areaButtons();
    return;
}

function reset_areaButtons() {
	//select img elements and remove selected style
    $( "#areaButtons button.areaButton_pressed" ).removeClass("areaButton_pressed");
    return;
}