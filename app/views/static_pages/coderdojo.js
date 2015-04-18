$(document).ready(function(){
    
  $(".login_pop-up_modal").hide();       
  
    $("#log").click(function()
      {
        
        $(".login_pop-up_modal").fadeIn();
        $("#overlay").fadeIn();
      }
      );
          
      $(".modal_close").click(function(){
        $(".login_pop-up_modal").fadeOut();
        $("#overlay").fadeOut();
        });

});

function overlay(){
  
  document.getElementById("overlay").style.display="block";
};
