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
//= require jquery
//= require twitter/bootstrap
//= require cocoon
//= require_tree .

/* Set the width of the side navigation to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

var toggleNewAnswerForm = function(comment_id) {
    $('#new_answer_form_' + comment_id).slideToggle();
    $('#new_answer_link_' + comment_id).toggle();
};

var toggleNewComment = function() {
    $('#new_comment_form').slideToggle();
};

var toggleCommentsTree = function() {
    $('#comments_tree').slideToggle();
};