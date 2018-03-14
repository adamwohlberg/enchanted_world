
// $(document).ready(function(){
//   $(function(){
//     // Bind the swipeHandler callback function to the swipe event on div.box
//     $( "div.unicorn" ).on( "swipe", swipeHandler );
   
//     // Callback function references the event target and adds the 'swipe' class to it
//     function swipeHandler( event ){
//       $( event.target ).addClass( "swipe" );
//     }
//   });
// });

$(document).ready(function(){

    $(".unicorn").dblclick(function() {
      $(this).addClass('rotate-left').delay(700).fadeOut(1);
      $('.unicorn').find('.status').remove();

      $(this).append('<div class="status dislike">NOPE!</div>');      
      if ( $(this).is(':last-child') ) {
        $('.unicorn:nth-child(1)').removeClass ('rotate-left rotate-right').fadeIn(300);
       } else {
          $(this).next().removeClass('rotate-left rotate-right').fadeIn(400);
       }
    });  

});

$(document).ready(function(){
  $('#mobile-unicorn-button').on( "vmouseover", function() { 
    alert('v fucking mouseover');
  });
});

$(document).ready(function(){

    $(".unicorn").on( "touchstart", function() { 
      $(this).addClass('rotate-left').delay(700).fadeOut(1);
      $('.unicorn').find('.status').remove();

      $(this).append('<div class="status dislike">NOPE!</div>');      
      if ( $(this).is(':last-child') ) {
        $('.unicorn:nth-child(1)').removeClass ('rotate-left rotate-right').fadeIn(300);
       } else {
          $(this).next().removeClass('rotate-left rotate-right').fadeIn(400);
       }
    });  

});


$(document).ready(function(){

  $( ".hoverReveal" ).hover(
      function() {
          $('#tap-to-find-unicorns').hide();
          $('#long-tap-to-find-unicorns').show();
      }, function() {
          $('#tap-to-find-unicorns').show();
          $('#long-tap-to-find-unicorns').hide();
      }
  );
});

$( document ).ready(function() {
  $('#unicorn').mouseover(function(){ 
    $(this).addClass('selected');
  });
});

$( document ).ready(function() {
  $('#unicorn').mouseout(function(){ 
    $(this).removeClass('selected');
  });
});

$(document).ready(function(){

    var latitude = null
    var longitude = null

    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      var crd = pos.coords;

      console.log('Your current position is:');
      console.log(`Latitude : ${crd.latitude}`);
      console.log(`Longitude: ${crd.longitude}`);
      console.log(`More or less ${crd.accuracy} meters.`);
      latitude = crd.latitude;
      longitude = crd.longitude;
    };

    function error(err) {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    };

    navigator.geolocation.getCurrentPosition(success, error, options);

    // how many milliseconds is a long press?
    var longpress = 250;
    // holds the start time
    var start;

    $( "#mobile-unicorn-button" ).on( 'mousedown', function( e ) {
        start = new Date().getTime();
    } );

    $( "#mobile-unicorn-button" ).on( 'mouseleave', function( e ) {
        start = 0;
    } );

    $( "#mobile-unicorn-button" ).on( 'mouseup', function( e ) {
        if (latitude) {
        }  else { 
          latitude = 'localhost';
        };
        if (longitude) {
        }  else { 
          longitude = 'localhost';
        };

        if ( new Date().getTime() >= ( start + longpress )  ) { 

           console.log('long press!');
           alert('long press! latitude:' + latitude + ' longitude:' + longitude);

           $('#unicorn_search_type').val("long_press");
           $('#unicorn_latitude').val(latitude);
           $('#unicorn_longitude').val(longitude);
           $("#search_form").submit();
        } else {

           console.log('short press!');  
           alert('short press! latitude:' + latitude + ' longitude:' + longitude);

            $('#unicorn_search_type').val("short_press");
            $('#unicorn_latitude').val(latitude);
            $('#unicorn_longitude').val(longitude);
            $("#search_form").submit();
        }
    } );
});

