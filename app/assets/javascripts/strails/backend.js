//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap
//= require if-b4-breakpoint
//= require activestorage
//= require_tree ./backend

function responsiveSidebar() {
  let sidebar = $(".sidebar-wrapper")
  let updateClass = function() {
    if (xl == true) {
      sidebar.addClass("desktop")
      sidebar.removeClass("mobile")

      sidebar.addClass("active")
    } else {
      sidebar.addClass("mobile")
      sidebar.removeClass("desktop")

      sidebar.removeClass("active")
    }
  }

  updateClass()
  $(window).resize(updateClass)

  $('#sidebarCollapse, .sidebar-wrapper.mobile .overlay').on('click', function (event) {
    $(".sidebar-wrapper").toggleClass("active")

    event.preventDefault()
});
}

$(document).ready(function() {
  responsiveSidebar()
})
