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

  $(".sort-alpha").on("click", function() {
    var $sort = this;
    var $links = $('#links');
    var $link = $(".link");


    $link.sort(function(a, b) {
      var ParamA = $(a).find('h6').text().toLowerCase();
      var ParamB = $(b).find('h6').text().toLowerCase();
      if($($sort).hasClass('ascending')) {
          return (ParamA > ParamB) ? 1 : 0;
      } else {
          return (ParamA < ParamB) ? 1 : 0;
      }
    });
    $.each($link, function(index, element) {
      $links.append(element);
    })
  })

  $('#link_filter_status').on('change', function () {
    var currentStatus = this.value;

    $links.each(function (index, link) {
      $link = $(link);
      if ($link.data('status').toString() === currentStatus) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
