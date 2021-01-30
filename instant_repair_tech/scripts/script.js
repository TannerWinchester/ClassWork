// Tanner Winchester 
"use strict";


// the event handler for the click event of each <a> element
const toggle = evt => {
    const linkElement = evt.currentTarget;                    // gets the clicked link element 
    const h2Element = linkElement.parentNode;                 // gets <a> tag
    const divElement = h2Element.nextElementSibling;          // gets h2 sibling div

    // h2Element.classList.toggle("minus");
    if (h2Element.hasAttribute("class")) {
        h2Element.removeAttribute("class");
    } else {
        h2Element.className="minus";
    }

    // divElement.classList.toggle("open");
    if (divElement.hasAttribute("class")) {
        divElement.removeAttribute("class");
    } else {
        divElement.className="js-toggle";
    }


    evt.preventDefault();   // cancel default action of <a> tag
};

document.addEventListener("DOMContentLoaded", () => {
    // get the <a> tags
    const linkElements = faqs.querySelectorAll("#faqs a");
    
    // attach event handler for each <a> tag	    
    for (let linkElement of linkElements) {
        linkElement.addEventListener("click", toggle);
    }
    // set focus on the first <a> tag
    linkElements[0].focus();       
});



// EMAIL JOIN LIST 


const $function = selector => document.querySelector(selector);

document.addEventListener("DOMContentLoaded", () => {
    
    $function("#join_list").addEventListener("click", () => {
        // get values user entered in textboxes
        const email1 = $function("#email_1");
        const email2 = $function("#email_2");
        const firstName = $function("#first_name");
    
        // boolean variable for invalid entries
        let isValid = true;

        // check user entries - add text to error message if invalid
        if (email1.value == "") {
            email1.nextElementSibling.textContent = "This field is required.";
            isValid = false;
        } else {
            email1.nextElementSibling.textContent = "";
        }

        if (email2.value == "") {
            email2.nextElementSibling.textContent = "This field is required."
            isValid = false;
        } else {
            email2.nextElementSibling.textContent = "";
        }

        if (email1.value != email2.value) {
            email2.nextElementSibling.textContent = "Email addresses must match.";
            isValid = false;
        }

        if (firstName.value == "") {
            firstName.nextElementSibling.textContent = "Full name is required."
            isValid = false;
        } else {
            firstName.nextElementSibling.textContent = "";
        }

        //submit if all entries are valid.

        if (isValid) {
            test("#email_form").submit();
        }
    });

    $function("#clear_form").addEventListener("click", () => {
        $function("#email_1").value = "";
        $function("#email_2").value = "";
        $function("#first_name").value = "";

        $function("#email_1").focus();
    });
    
    $function("#email_1").focus();
});

// JS for Contact page  ** Couldnt figure out what was going wrong.**

/*
const displayErrorMsgs = msgs => {
    // create a new ul element
    const ul = document.createElement("ul");
    ul.classList.add("messages");

    // create a new li element for each error message, add to ul
    for (let msg of msgs) {
        const li = document.createElement("li");
        const text = document.createTextNode(msg);
        li.appendChild(text);
        ul.appendChild(li);
    }

    // if ul node isn't in document yet, add it
    const node = $function("ul");
    if (node == null) {
        // get the form element 
        const form = $function("form");

        // add ul to parent of form, before the form
        form.parentNode.insertBefore(ul, form);
    } else {
        // replace existing ul node
        node.parentNode.replaceChild(ul, node);
    }  
}

const processEntries = () => {
    // get form controls to check for validity
    const email = $function("#email_address");
    const phone = $function("#phone");
    const firstName = $function("#fName");
    const lastName = $function("#lName");
    const comments = $function("#comments");

    // create array for error messages
    const msgs = [];

    // check user entries for validity
    if (firstName.value == "") {
        msgs[msgs.length] = "This area is required.";
    } 
    if (lastName.value == "") {
        msgs[msgs.length] = "This area is required."; 
    } 
    if (email.value == "") {
        msgs[msgs.length] = "Please enter an email address.";
    } 
    if (phone.checked == false) {
        msgs[msgs.length] = "Please enter a phone number."; 
    }
    if (comments.value == "") {
        msgs[msgs.length] = "Please enter a comment.";
    }

    // submit the form or notify user of errors
    if (msgs.length == 0) {  // no error messages
        $function("form").submit(); 
    } else {
        displayErrorMsgs(msgs);
    }
};

const resetForm = () => {
    $function("form").reset();
    
    // remove error messages
   // $function("ul").remove();
    
    $function("#email_address").focus();
};

document.addEventListener("DOMContentLoaded", () => {
    $function("#submit").addEventListener("click", processEntries);
    $function("#reset_form").addEventListener("click", resetForm);  
    $function("#email_address").focus();   
});
*/


//jQuery for hero image to consume the header window space

$(document).ready(function() {
    $('.hero').height($(window).height());
});

