$(document).on('page:change', function() {

  // if under project show page

  if ($('.project').length) {

    $('.backers-knob').knob({
      'readOnly': true,
      'thickness': '0.50',
      'fgColor': 'rgba(80, 200, 200, 0.5)',
      'inputColor': 'rgba(75, 146, 182, 0.8)',
      'draw': function() { $(this.i).val(this.cv + ' backers') }
    }).trigger('change');

    $('.totals-knob').knob({
      'readOnly': true,
      'thickness': '0.50',
      'fgColor': 'rgba(80, 200, 200, 0.5)',
      'inputColor': 'rgba(75, 146, 182, 0.8)',
      'draw': function() { $(this.i).val('$ ' + this.cv) }
    }).trigger('change');

    $('.time-to-go-knob').knob({
      'readOnly': true,
      'thickness': '0.50',
      'fgColor': 'rgba(80, 200, 200, 0.5)',
      'inputColor': 'rgba(75, 146, 182, 0.8)',
      'draw': function() { $(this.i).val(this.cv + " days") }
    }).trigger('change');
  }


});