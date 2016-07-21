// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require audiojs

var ready;

ready = function() {
    return audiojs.events.ready(function() {
        var as;
        as = audiojs.createAll();
    });
};

$(document).ready(ready);

$(document).on('page:load', ready);

$(window).on('page:load', ready);