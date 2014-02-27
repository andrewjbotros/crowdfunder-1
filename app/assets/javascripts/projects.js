$(document).on('page:change', function() {

  // if under project show page
  if ($('.project-page').length) {
    $('.pledged-graph').knob({
      'readOnly': true,
      'thickness': '0.50',
      'fgColor': 'rgba(80, 200, 200, 0.5)',
      'inputColor': 'rgba(20, 140, 140, 1)',
      'draw': function() { $(this.i).val(this.cv + '%') }
    }).trigger('change');

  }
});