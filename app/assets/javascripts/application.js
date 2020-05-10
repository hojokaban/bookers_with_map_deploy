// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery.jpostal
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
$("#postal_code").jpostal({
  postcode :["#postal_code"],
  address :{
    "#user_prefecture" : "%3",
    "#city" : "%4%5",
    "#street" : "%6%7"
  }
});
});

let map
let geocoder

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 40.7828, lng: 73.9653},
  zoom: 16
  });
  codeAddress()
  function codeAddress(){
    var address = $('#address').text()
    console.log(address)

    // geocodingしたあとmapを移動
    geocoder.geocode( { 'address': address}, function(results, status) {
  if (status == 'OK') {
　　　　　　　　　　　　// map.setCenterで地図が移動
    map.setCenter(results[0].geometry.location);

　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
    var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
    });
  }
});
}
}
