
"use strict";


$(document).ready(function(){
    $(".button").click(function(){
      var value = $(this).attr("data-filter");
      if(value == "all"){
        $(".filter").show("100");
      }
      else{
        $(".filter").not("." + value).hide("1000");
        $(".filter").filter("." + value).show("1000");
      }
      $("ul.button").click(function(){
        $(this).addClass('active').siblings().removeClass('active');
      })
    });

    $("#contact_list").click( evt =>{
      let isValid = true;

      // validate the first email address
      const emailPattern = 
          /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;
      const email1 = $("#email_address").val().trim();
      if (email1 == "") { 
        $('#email_address').attr("placeholder", "This field is required.");
          isValid = false;
      } else if ( !emailPattern.test(email1) ) {
        $('#email_address').attr("placeholder", "Must be a valid email.");
          isValid = false;
      } else {
      $('#email_address').attr("placeholder", "");;
      }
      $("#email_address").val(email1);
      
      // validate the first name entry  
      const firstName = $("#contactName").val().trim();
      if (firstName == "") {
        $('#contactName').attr("placeholder", "This field is required.");
          isValid = false;
      } else {
        $('#contactName').attr("placeholder", "");
      }
      $("#contactName").val(firstName);

          
  // prevent the default action of submitting the form if any entries are invalid 
      if (isValid == false) {
        evt.preventDefault();
      } else {
        isValid;
        alert("Your form has been submitted.");
      }
  });
    $("#reset_form").click( () => {
      //clear text boxes
      $("#contactName").val("");
      $("#email_address").val("");
  
      //reset span elements 
      $('#contactName').attr("placeholder", "Name");
      $('#email_address').attr("placeholder", "Email");

  
      $("#contactName").focus();
    });







  })