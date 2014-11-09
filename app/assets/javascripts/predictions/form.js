$(document).ready(function(){

  $("#success-button").on("click", function(){
    $("#prediction_status").val("success");
    $(".edit_prediction").submit();
  });
  
  $("#mistake-button").on("click", function(){
    $("#prediction_status").val("mistake");
    $(".edit_prediction").submit();
  });
  
});