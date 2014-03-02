$(document).on('page:change', function() {
  var siteMenu = new SiteMenu();
});

function SiteMenu() {
  var self = $('#site-menu'),
      toggleBtn = self.children('.toggle-btn');

  function currentlyHidden() {
    return self.offset().left < 0
  }

  function slideAnimate(position, duration) {
    duration = duration || 1000;
    self.animate({
      left: position
    }, duration, 'easeOutCubic');
  }

  function slideToggle() {
    if (currentlyHidden()) {
      slideAnimate('0');
    }
    else {
      slideAnimate('-260');
    }
  };

  function clickableArea() {
    return toggleBtn;
  }

  function clickEvent(btn) {
    btn.on('click', function() {
      // $(this).unbind('click');
      slideToggle();
      // clickEvent(clickableArea());
    })
  }

  clickEvent(clickableArea());

}
