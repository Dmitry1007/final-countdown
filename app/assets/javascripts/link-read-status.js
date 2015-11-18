$(document).ready(function () {
  $(".read-status").on("click", function () {
    var linkId = $.parseJSON($(this).attr('data'));
    console.log(linkId)

    $.ajax({
      type:    "POST",
      url:     "/api/v1/links/" + linkId,
      success: function(link) {
        console.log(link)
      }
    })
  })
})
