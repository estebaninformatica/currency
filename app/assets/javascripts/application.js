// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap.min
//= require select2
//= require select2_locale_es

$(document).ready(function() { $(".select2").select2(); });

function hide_form (id_form) {
  id_form='#'+id_form
  $(id_form).hide(); //Initially form wil be hidden.  
}

function unhide_form (id_form) {
  id_form='#' + id_form
  $(id_form).show();//Form shows on button click, for add value
  $(".button_add").hide(); //hide the button add Change
}


