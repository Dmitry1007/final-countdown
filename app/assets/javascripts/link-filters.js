$(document).ready(function () {
  var $links = $('.link');

  $('#link_filter_title').on('keyup', function () {
    var currentTitle = this.value.toLowerCase();

    $links.each(function (index, link) {
      $link = $(link);
      if ($link.data('title').toLowerCase().indexOf(currentTitle) !== -1) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
