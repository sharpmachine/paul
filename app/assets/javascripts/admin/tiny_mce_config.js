var dt = new Date();
tinyMCE.init({

	// General options
	mode : "exact",
	elements : "post_content, page_content, product_description, user_description",
	theme : "advanced",
	plugins : "advimage,autolink,lists,pagebreak,style,media,contextmenu,paste,fullscreen,nonbreaking,",

	// Theme options
	theme_advanced_buttons1 : "bold,italic,formatselect,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,sub,sup,charmap,|,undo,redo,|,cleanup,link,unlink,|,image,insertfile,insertimage,|,nonbreaking,|,code,fullscreen",
	theme_advanced_buttons2 : "",
	theme_advanced_buttons3 : "", 
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : true,
    theme_advanced_blockformats : "h1,h2,p,blockquote",

	relative_urls : false,
	// Drop lists for link/image/media/template dialogs
	//        template_external_list_url : "js/template_list.js",
	//        external_link_list_url : "js/link_list.js",
	external_image_list_url : "/admin/pictures.js?random=" + dt.getTime(),
	//        media_external_list_url : "js/media_list.js",
});