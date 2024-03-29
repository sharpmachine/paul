// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-transition
//= require bootstrap-alert
//= require bootstrap-carousel
//= require chosen/chosen.jquery
//= require jquery.mousewheel-3.0.6.pack
//= require jquery.fancybox.pack
//= require jquery-ui
//= require jquery.scrollTo-1.4.3.1-min
//= require_directory .

jQuery( function($) {
	
	$(".chzn-select").chosen();
	$(".fancybox").fancybox({
	    helpers : {
	        title: {
	            type: 'outside'
	        }
	    }
	});	

  	$(".upload_form").submit(function() { 

		$(".upload_form").hide();		
		$("#uploading").show();
	
	});

	$(".datepicker").datepicker({ changeYear: true, dateFormat: "yy-mm-dd" });	
	
	// Event Stuff
	$("#copy_org_true").click(function() {
		$("#event_location_name").val( $("#event_organization").val() );
		$("#event_address").val( $("#event_organization_address").val() );
		$("#event_address2").val( $("#event_organization_address2").val() );		
		$("#event_city").val( $("#event_organization_city").val() );				
		$("#event_state").val( $("#event_organization_state").val() );						
		$("#event_zip").val( $("#event_organization_zip").val() );
		$("#event_country").val( $("#event_organization_country").val() );										
		$("#event_country").trigger("liszt:updated");				
	});
	$("#copy_org_false").click(function() {
		$("#event_location_name").val("");
		$("#event_address").val("");		
		$("#event_address2").val("");				
		$("#event_city").val("");	
		$("#event_state").val("");	
		$("#event_zip").val("");
		$("#event_country").val("");												
		$("#event_country").trigger("liszt:updated");		
	});
	
	var $myCarousel = $('#photoCarousel').carousel({'interval': false});

	$('.carousel-select').each(function() {
	    var $this = $(this);
	    var index = $(this).data("slide");
	    $this.click(function() {
	        $myCarousel.carousel(index);
			$.scrollTo("#photoCarousel", 400);	
			return false;
	    });
		
	});
	
	
	// Fire fancybox video popups
	$("#video_1").click(function() {
		$.fancybox({
			'padding'		: 0,
			'autoScale'		: false,
			'transitionIn'	: 'none',
			'transitionOut'	: 'none',
			'title'			: this.title,
			'width'			: 596,
			'height'		: 335,
			'href'			: this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
			'type'			: 'swf',
			'swf'			: {
				'wmode'				:'transparent',
				'allowfullscreen'	:'true'
			}
		});

		return false;
	});
});