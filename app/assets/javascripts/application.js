// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(e) {
  // Make all tables look good
  $("table").addClass("table table-striped table-bordered");
});

// Event handlers registry
// Maintains a hash of event_type strings -> list of event handler function names
var EVH_REGISTRY = {};

function registerEvHandler(ev_type, ev_handler) {
    if (EVH_REGISTRY.hasOwnProperty(ev_type)) {
	EVH_REGISTRY[ev_type].push(ev_handler);
    } else {
	EVH_REGISTRY[ev_type] = [ev_handler];
    };
};

function raiseEv(ev) {
    ev_type = ev['type'];
    if (EVH_REGISTRY.hasOwnProperty(ev_type)) {
	evh_list = EVH_REGISTRY[ev_type];
	// call all functions in fn_list with ev as param
	for (i=0; i<evh_list.length; i++) {
	    evh_list[i](ev);
	};
    };
};
