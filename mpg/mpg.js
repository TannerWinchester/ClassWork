"use strict";

const $ = selector => document.querySelector(selector);

const nonNumericError = lbl => `${lbl} entry is not a valid number.`;
const rangeError = lbl => `${lbl} entry must be greater than 0.`;

const focusAndSelect = selector => {
    const elem = $(selector);
    elem.focus();
    elem.select();
};

const processEntries = () => {
    const miles = parseFloat($("#miles").value);
    const gallons = parseFloat($("#gallons").value);

    if (isNaN(miles)) {
        alert(nonNumericError("Miles driven"));
        focusAndSelect("#miles");
    } else if (miles <=0) {
        alert(rangeError("Miles driven"));
        focusAndSelect("#miles");
    }
    else if (isNaN(gallons)) {
        alert(nonNumericError("Gallons of gas used"));
        focusAndSelect("#gallons");
    } else if (gallons <= 0) {
        alert(rangeError("Gallons of gas used"));
        focusAndSelect("#gallons");
    }
    else {
        $("#mpg").value = (miles / gallons).toFixed(2);
    }
  
};

const clearEntries = () => {
    $("#miles").value = "";
    $("#gallons").value = "";
    $("#mpg").value = "";
    $("#miles").focus();
}

document.addEventListener("DOMContentLoaded", () => {
    $("#calculate").addEventListener("click", processEntries);
    $("#clear").addEventListener("click", clearEntries);
    $("#miles").addEventListener("dblclick", clearEntries);
    $("#miles").focus();
});