$(document).ready(function() {

	$('.breakpoint').click (function() {
		var _this = $(this)
		$('.breakpoint').unbind('click')

		$.ajax({
			url: '/pledges',
			type: 'POST',
			dataType: 'script',
			data: { pledge: { breakpoint_id: _this.data('breakpointId') } },
		})


	})

	$('.breakpoint-edit').click (function() {
		var _this = $(this)

		$.ajax({
			url: '/pledges/<%= @pledge.id %>',
			type: 'PATCH',
			dataType: 'script',
			data: { pledge: { breakpoint_id: _this.data('breakpointId'), amount: _this.data('amount') } },
		})

	});

});