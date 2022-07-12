// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .



function toggleNav() {
  var x = document.getElementById("nav-mobile__items");
  if (x.style.display === "block") {
    x.style.display = "none";
    var element = document.getElementById("nav-mobile__trigger-icon");
		element.classList.remove("triggered");
  } else {
    x.style.display = "block";
    var element = document.getElementById("nav-mobile__trigger-icon");
		element.classList.add("triggered");
  }
}


function removeClass(){
  const anchors = document.querySelectorAll('.anchor');
  
  anchors.forEach(anchor => {
  anchor.classList.remove('active');
  });

}


window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("nav").classList.add("scrolling");
  } else {
    document.getElementById("nav").classList.remove("scrolling");
  }
}

/*
document.addEventListener('click', function handleClick(event) {
  const accordion = document.getElementsByClassName('accordion__element');

  for (i=0; i<accordion.length; i++) {
    accordion[i] this.classList.toggle('active')
    }
  }
);
*/

const acc = document.getElementsByClassName("accordion__element");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    /* Toggle between adding and removing the "active" class,
    to highlight the button that controls the panel */
    this.classList.toggle("active");

    /* Toggle between hiding and showing the active panel */
    
    
  });
} 


function removeClassAccordion(){
  const accordion_elements = document.querySelectorAll('.accordion__element');
  accordion_elements.forEach(anchor => {
  accordion_element.classList.remove('active');
  });

}
