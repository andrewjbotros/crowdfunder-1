$(document).on('page:change', function() {

  // if under project show page
  if ($('.project-page').length) {
    // set the height of project-page and project-sidebar to the same height
    var pageHeight = $('.project-page').height(),
        sidebarHeight = $('.project-sidebar').height();
    pageHeight > sidebarHeight ? $('.project-sidebar').height(pageHeight) : $('.project-page').height(sidebarHeight);
  }
});