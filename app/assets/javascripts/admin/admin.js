//= require jquery
//= require jquery_ujs
//= require superfish
//= require chosen/chosen.jquery
//= require tiny_mce/tiny_mce
//= require_directory .

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

  	$(".upload_form").submit(function() { 

		$(".upload_form").hide();		
		$("#uploading").show();
	
	});
});	

