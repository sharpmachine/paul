tinyMCE.init({
        // General options
		mode : "exact",
		elements : "page_content,event_schedule,event_registration_info,event_speaker_info,event_description,event_profile_attributes_description",
        theme : "advanced",
        plugins : "autolink,lists,spellchecker,pagebreak,style,media,contextmenu,paste,fullscreen,nonbreaking,",

        // Theme options
        theme_advanced_buttons1 : "bold,italic,styleselect,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,blockquote,sub,sup,charmap,|,undo,redo,|,cleanup,code,",
        theme_advanced_buttons2 : ",link,unlink,anchor,|,image,insertfile,insertimage,media,|,spellchecker,nonbreaking,|,fullscreen",
        theme_advanced_buttons3 : "", 
		theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,
		
		relative_urls : false,
        // Drop lists for link/image/media/template dialogs
//        template_external_list_url : "js/template_list.js",
//        external_link_list_url : "js/link_list.js",
//       external_image_list_url : "js/image_list.js",
//        media_external_list_url : "js/media_list.js",
});