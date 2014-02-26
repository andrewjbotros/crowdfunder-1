$(document).on('page:change', function() {
  if ($('[class*="flash"]').length) {
    $('[class*="flash"] .close').click(function(event) {
      $(this).parent().animate({
        left: $(window).width()
      }, 500, 'easeInBack', function() {
        $(this).slideUp(500, 'easeOutBounce', function() { $(this).remove() });
      });
    });
  }
});