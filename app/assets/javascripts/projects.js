$(document).on('page:change', function() {

  // if under project show page
  if ($('.project-page').length) {
    $('.total-pledged-graph').knob({
      'readOnly': true,
      'thickness': '0.2',
      'fgColor': '#ee8888',
      'inputColor': '#ee8888'
    }).trigger('change');

  }
});