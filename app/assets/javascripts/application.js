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
//= require jquery.min
//= require jquery_ujs
//= require foundation
//= require modernizr
//= require_tree .

function DeviceIsIpad() {
  if (navigator.userAgent.toLowerCase().search("ipad") >= 0) { return true; }
}
function DeviceIsNotStandalone() {
  if(!window.navigator.standalone) { return true; }
}
function IpadIsNotStandalone() { 
  if (DeviceIsIpad() && DeviceIsNotStandalone() ) { return true; }
}
function DisplayAddToHomeScreenPopup() { $("#addToHomeScreen").show(); }

$(document).ready(function() {
  if ($(".alert-box").length){
    $(".alert-box").hide().fadeIn(400,function(){
      $(this).delay(3000).fadeOut(250);
    });
  }
  $(document).foundation();
  
  $("#loading").hide();  
  $('form').live('change', function() {
    $('#header-row').fadeIn();
  });
});
$(document).foundation();
