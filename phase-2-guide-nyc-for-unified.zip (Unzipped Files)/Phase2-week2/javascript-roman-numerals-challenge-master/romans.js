
// We did some stuff for you! This is basic logic for affecting the DOM.
// It short circuits the page's HTML form and fires off a handbuilt JS function.
window.onload = function() {
  var form = document.querySelector('.input-form')
  form.addEventListener('submit',printConvertedValue,false)
}

// This is the function that actually adds the output to the DOM. Don't change
// this!
var printConvertedValue = function(event) {
  event.preventDefault()
  var number = this.number.value
  var outputDiv = document.querySelector('.output')
  outputDiv.innerText = numeralConverter(number)
}


// numeralConverter takes a string that looks like a number as an input, e.g. '111'.
// numeralConverter should output a string of characters corresponds to a Roman Numeral, e.g. 'XXVI'
var numeralConverter = function(numString) {
  // your code goes here!
}

// your helper functions go here!