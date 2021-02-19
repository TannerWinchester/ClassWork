"use strict";
function isInvalid(score) {
    return isNaN(score) || score < 1 || score > 100;
}

function getAverage(arr, places = 2) {
    const total = arr.reduce( (tot, val) => tot + val, 0 );
    const average = total/arr.length;
    return average.toFixed(places);
};

function getLast(arr, num = 3) {
    const copy = [...arr];
    copy.reverse();
    return copy.slice(0, num);
}

$(document).ready( () => {

    const scores = [];

    $("#add_score").click( () => {
        
        const score = parseFloat($("#score").val());
                
        if (isInvalid(score)) { 
            $("#add_score").next().text("Score must be between 1 and 100.");
        }
        else {  
            $("#add_score").next().text(""); 

            scores.push(score);

            $("#high").text(Math.max(...scores));
            $("#low").text(Math.min(...scores));
            $("#last").text(getLast(scores).join(", "));
            $("#avg").text(getAverage(scores, 1));
            $("#all").text(scores.join(", "));
        }
        

        $("#score").val("");
        $("#score").focus(); 
    });

    $("#score").focus();
});