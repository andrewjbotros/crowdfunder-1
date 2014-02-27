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

  if ($('.project-feed').length) {
    $('.knob').knob({

    })

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
      'draw': function() { $(this.i).val(this.cv + " day left") }
    }).trigger('change');
  }



});