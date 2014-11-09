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
//= require jquery-1.11.0.min
//= require jquery-ui.min
//= require jquery_ujs
//= require js-routes
//= require bootstrap.min

$(document).ready(function(){
  
  $.datepicker.regional['es'] = {
    closeText: 'Cerrar',
    prevText: '<Ant',
    nextText: 'Sig>',
    currentText: 'Hoy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''
  };
  $.datepicker.setDefaults($.datepicker.regional['es']);

  $(".date-picker").datepicker();
  
  $(".twitter-share").click(function(){
    url = $(this).parent().children(".url-value").first().val();
    tweet = $(this).parent().children(".tweet-value").first().val();
    return social_dialog('https://twitter.com/intent/tweet?original_referer=' + encodeURIComponent(url) + '&text=' + encodeURIComponent(tweet) + '&tw_p=tweetbutton&url=' + encodeURIComponent(url) + '&via=prediciendo', 'twitter-share-dialog');
  });
  
  $(".facebook-share").click(function(){
    url = $(this).parent().children(".url-value").first().val();
    tweet = $(this).parent().children(".tweet-value").first().val();
    return social_dialog('https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent(url), 'facebook-share-dialog');
  });
  
  $(".email-share").click(function(){
    $("#send-mail-dialog").modal({remote: Routes.new_user_email_path(gon.user_id, {d: gon.dimension_id})});
    $("#send-mail-dialog").modal("show");    
  });

});

function social_dialog(url, id){
  var w = 626;
  var h = 436;
  var left = (screen.width/2)-(w/2);
  var top = (screen.height/2)-(h/2);
  window.open(url, id, 'width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
  return false;
}