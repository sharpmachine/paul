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
//= require bootstrap
//= require chosen/chosen.jquery
//= require tinymce
//= require jquery-ui
//= require jquery.Jcrop.min
//= require_directory .

jQuery( function($) {
	
	$(".chzn-select").chosen();

  	$(".upload_form").submit(function() { 

		$(".upload_form").hide();		
		$("#uploading").show();
	
	});

	$(".datepicker").datepicker( { changeYear: true, dateFormat: "yy-mm-dd" });

	
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
	
	$.fn.textareaCounter = function(options) {
		// setting the defaults
		// $("textarea").textareaCounter({ limit: 100 });
		var defaults = {
			limit: 100,
			word_count_field: "counter-text"
		};	
		var options = $.extend(defaults, options);

		// and the plugin begins
		return this.each(function() {
			var obj, text, wordcount, limited;

			obj = $(this);
			obj.after('<span style="font-size: 11px; clear: both; margin-top: 3px; display: block;" id="'+options.word_count_field+'">Max. '+options.limit+' words</span>');

			obj.keyup(function() {
			    text = obj.val();
			    if(text === "") {
			    	wordcount = 0;
			    } else {
				    wordcount = $.trim(text).split(" ").length;
				}
			    if(wordcount > options.limit) {
			        $("#"+options.word_count_field).html('<span style="color: #DD0000;">0 words left</span>');
					limited = $.trim(text).split(" ", options.limit);
					limited = limited.join(" ");
					$(this).val(limited);
			    } else {
			        $("#"+options.word_count_field).html((options.limit - wordcount)+' words left');
			    } 
			});
		});
	};
	
	
	$("#product_short_description").textareaCounter({ limit: 50 });	
	$("#friend_description").textareaCounter({ limit: 50 });		
	
});	

