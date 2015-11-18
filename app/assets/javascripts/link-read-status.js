$(document).ready(function () {
  $(".read-status").on("click", function () {
    var linkId = $.parseJSON($(this).attr('data'));

    $.ajax({
      type:    "POST",
      url:     "/api/v1/links/" + linkId,
      success: function(link) {
        if (link.read === true) {
          $("button[data="+link.id+"]").text("Mark As Unread")
        } else {
          $("button[data="+link.id+"]").text("Mark As Read")
        }
      }
    })
  })
})
