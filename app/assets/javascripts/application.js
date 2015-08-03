// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
// require ckeditor/init
//= require twitter/bootstrap
//= require bootstrap.min
//= require theme
//= require index-slider

function Uploader(options) {
  this.initialize(options);
}


Uploader.prototype = {
  initialize : function(options) {
    var self = this;
    this.images_uploader_options = {
    	file_post_name: this.klass + "[image]",
    	upload_url: "/" + this.klass + "s.js",
    	event_id_field : this.klass + "[event_id]",
    	form_id : "#new_"+this.klass,
    	flash_url: "/javascripts/swfupload.swf",
    	file_types: "*.jpe; *.jpg; *.jpeg; *.tiff; *.tif; *.png; *.bmp",
    	post_params : {
	"#{_photocross_session}": "#{cookies[_photocross_session]}",
	"authenticity_token" : "#{form_authenticity_token}"},
    	begin_upload_on_queue: true,
    	use_server_data_event: true,

    	button_placeholder_id: "swf_image",
      button_width: "140",
    	button_height: "40",
    	button_text: '',
    	button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
      button_cursor: SWFUpload.CURSOR.HAND,

    	file_dialog_complete_handler: this.imagesSelected,
    	//file_queued_handler: handlers.file_queued,
    	upload_complete_handler: this.imageUploaded,
    	upload_success_handler: this.imageAdded,
    	upload_error_handler: this.imageNotAdded 
    }
  
    //for(var k in options) {
    //  this.images_uploader_options[k] = options[k];
    //}
    this.images_uploader_options.upload_url += "?_photocross_session=" + encodeURIComponent($.cookie('_photocross_session'));
  
    if(window.current_event_id) {
      this.images_uploader_options.post_params[this.images_uploader_options.event_id_field] = current_event_id;
    }
    if(window.current_photo_category_id) {
      this.images_uploader_options.post_params["event_photo[photo_category_id]"] = current_photo_category_id;
    }
    if(window.current_user_id) {
      this.images_uploader_options.post_params["event_photo[user_id]"] = current_user_id;
    }
  
    $(this.images_uploader_options.form_id).hide();
  
    this.uploader = new SWFUpload(this.images_uploader_options);
  },

  imagesSelected : function(selected, queued) {
    if (selected > 0) {
  	  var list = $("#photo-list");
  		for(var i = 0; i < selected; i++) {
  		  var file = this.getFile(i);
  		  list.append('<li class="uploading">загружается '+ file.name +'</li>');
  		}
  		this.startUpload();
  	}  	
  },
  
  imageUploaded : function() {
    this.startUpload();
  },
  
  imageAdded : function(file, server_data) {
  	setTimeout(function() {
  	  var result = eval(server_data);
  	}, 50);
  },
  
  imageNotAdded : function() {
	  $("#photo-list .uploading:first").removeClass('uploading').html('Файл не загрузился');
  }
};

function PhotoUploader(options) {
  this.klass = "photo";
  this.initialize(options);
}
PhotoUploader.prototype = Uploader.prototype;

function EventPhotoUploader(options) {
  this.klass = "event_photo";
  this.initialize(options);
}
EventPhotoUploader.prototype = Uploader.prototype;
