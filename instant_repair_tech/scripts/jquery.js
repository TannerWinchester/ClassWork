/*********************************************************************
***
*Original Author:  Tanner winchester                                  *
*Date Created:      1/26                                 *
*Version:                                                *
*Date Last Modified:     2/15                         *
*Modified by:    Tanner winchester                                      *
*Modification log:        

 1/26 - Added in contact newsletter and email form with out JS to get a head start.

 1/27 - Removed contact, newsletter and email form to redo completely as it didnt work with JS.
            Added in JS for newsletter and email forms and redesigned the page layout.
            Added in FAQ and JS for the requirements.
           ****Realized the the $ function was conflicting with the little jquery for the hero class and thats why ill have to either redo the hero class or use '$function' to workaround that conflict within the JS file.****

 1/29 - Tried to fix error in JS for the Contact section, although the console showed no errors
           I could not get the code to function properly, it would not grab the value of the text 
           area for the user input. I commented it out so the rest of the file would work properly.
           Made sure everything else was up to par and met the requirements.

	
2/2 - Faqs redone with jquery and animations. 

2/4 - Updated faqs with jquery UI, deleted vanilla JS and recoded the email newsletter with jquery.

2/15 - 

*
***
******************************************************************** */

"use strict";

 
$(document).ready( () => {
    //hero image to consume the header window space
	$('.hero').height($(window).height());

	$("#accordion").accordion({ 
		event: "mouseover",
		heightStyle: "content",
		collapsible: true 
	})

	$("#join_list").click( evt => {

		let isValid = true;

		//validate the first email

        const emailPattern = 
			/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;
		
		const email1 = $("#email_1").val().trim();
		if (email1 =="") {
			$("#email_1").next().text("This field is required.");
			isValid = false;
		} else if ( !emailPattern.test(email1) ) {
			$("#email_1").next().text("Must be a valid email address.");
			isValid = false;
		} else {
			$("#email_1").next().text("");
		}
		$("#email_1").val(email1);

		// validate the second email
		const email2 = $("#email_2").val().trim();
		if (email2 == "") {
			$("#email_2").next().text("This field is required.");
			isValid = false;
		} else if (email1 != email2) {
			$("#email_2").next().text("The email addresses must match.");
			isValid = false;
		} else {
			$("#email_2").next().text("");
		}
		$("#email_2").val(email2);

		//validate the name entry
		const firstName = $("#first_name").val().trim();
		if (firstName == "") {
			$("#first_name").next().text("this field is required.");
		} else {
			$("#first_name").next().text("");
		}
		$("#first_name").val(firstName);

		if (isValid == false) {
			evt.preventDefault();
		}

	});

	$("#reset").click( () => {
		//clear text boxes
		$("#email_1").val("");
		$("#email_2").val("");
		$("#first_name").val("");

		//reset span elements 
		$("#email_1").next().text("");
		$("#email_2").next().text("");
		$("#first_name").next().text("");

		$("#email_1").focus();

	});
	$("#email_1").focus();





	$("#contact_list").click( evt =>{
		let isValid = true;

		//validate the name

		const firstName = $("#first_name").val().trim();
		if (firstName == "") {
			$("#fName").next().text("this field is required.");
		} else {
			$("#fName").next().text("");
		}
		$("#fName").val(firstName);

		const lastName = $("#lName").val().trim();
		if (lastName =="") {
			$("#lName").next().text("this field is required.");
		} else {
			$("#lName").next().text("");
		}
		$("#lName").val(lastName);
		// check email 
		const emailPattern = 
		/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/;

		const email1 = $("#email_address").val().trim();
		if (email1 =="") {
			$("#email_address").next().text("This field is required.");
			isValid = false;
		} else if ( !emailPattern.test(email1) ) {
			$("#email_address").next().text("Must be a valid email address.");
			isValid = false;
		} else {
			$("#email_address").next().text("");
		}
		$("#email_address").val(email1);
		// check phone number
		const phoneNum = $("#phone").val().trim();
		if (phoneNum == "") {
			$("#phone").next().text("this field is required.");
		} else {
			$("#phone").next().text("");
		}
		$("#phone").val(phoneNum);

		//check selection 

		let checkedOptions = [];
		checkedOptions = $(":checkbox:checked");
		if (checkedOptions.length == 0) {
			$("#other").next().text("Select at least one.");
			isValid = false;
		} else {
			$("#other").next().text("");
		}

		//prevent default action of submission

		if(isValid == false) {
			evt.preventDefault();
		}
		
	});
	$("#reset_form").click( () => {
		//clear text boxes
		$("#fName").val("");
		$("#lName").val("");
		$("#email_address").val("");
		$("#phone").val("");




		//reset span elements 
		$("#fName").next().text("");
		$("#lName").next().text("");
		$("#email_address").next().text("");
		$("#phone").next().text("");
		$("#other").next().text("");

		



		$("#fName").focus();
	});



}); // end ready

