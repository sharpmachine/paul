//= require jquery
//= require jquery_ujs
//= require superfish
//= require_directory .
//= require chosen/chosen.jquery

jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery( function($) {

	$("ul.sf-menu").superfish({ 
	    delay:     100,               // delay on mouseout 
		animation: {height:'show'},   // slide-down effect without fade-in 
	    speed:     'fast',            // animation speed
		autoArrows: false
	});
	
	$(".chzn-select").chosen();	
	
	$('#flash_notice').delay(3000).slideUp(500);
	$('#flash_alert').delay(6000).slideUp(500);	

});	