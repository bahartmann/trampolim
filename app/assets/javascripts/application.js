// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.datetimepicker.js
//= require_tree .

$(function() {
  $('.form-datetime').datetimepicker({
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    format: 'y/m/d h:i'
  });

  $('.js-rating-star').click(function(){
    $('.js-rating-field').val($(this).attr('value'));
    $('.js-rating-form').submit();
    return false;
  });

  if ($("#event_place_name_field").length > 0) {
    var input = $("#event_place_name_field")[0];
    var options = {};

    var autocomplete = new google.maps.places.Autocomplete(input, options);

    var name = "";
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      var place = autocomplete.getPlace();
      $('.place-name-field').val(place.name);
      $('.place-addr-field').val(place.formatted_address);
      $('.place-lat-field').val(place.geometry.location.lat());
      $('.place-lng-field').val(place.geometry.location.lng());
    });
  }
});
