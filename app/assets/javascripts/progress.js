$(document).on('page:change', function() {
  if ($('.projects-page').length) {
    var progressBars = $('.progress');
    progressBars.each(function(index) {
      var width = $(this).data('percent-complete') + "%";
      console.log(width) ;
      $('<small>')
        .addClass('percent')
        .text(width).appendTo(this);

      $('<div>')
        .addClass('completed')
        .appendTo(this)
        .animate({
          width: width
        }, 1000, 'easeOutBack');

    });
  }
});