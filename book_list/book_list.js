"use strict";

$(document).ready(function () {
    $("#categories h2").click( evt => {
        const h2 = evt.currentTarget;

        $(h2).toggleClass("minus");

        if ($(h2).attr("class") !== "minus") {
            $(h2).next().hide();
        
        }
        else {
            $(h2).next().show();
        }

        $("#image").attr("src", "");
    }); // end click event

    $("#web_images a, #language_images a, #database_images a").each( (index, img) => {

        var imageURL = $(img).attr("href");

        //preload images
        var bookImage = new Image();
        bookImage.src = imageURL;

        //set up event handlers 

        $(img).click( evt => {
            $("#image").attr("src", imageURL);

            //cancel the defualt action of each link
            evt.preventDefault();
        }); // end click event
    }); // end each
}); //end ready function 
