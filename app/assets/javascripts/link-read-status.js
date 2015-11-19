$(document).ready(function () {
  $('.line-through-link').css("text-decoration","line-through")

  $(".read-status").on("click", function () {
    var linkId = $.parseJSON($(this).attr('data'));

    $.ajax({
      type:    "POST",
      url:     "/api/v1/links/" + linkId,
      success: function(link) {
        if (link.read === true) {
          $("span[data="+link.id+"]").css("text-decoration","line-through")
          $("button[data="+link.id+"]").text("Mark As Unread")
        } else {
          $("span[data="+link.id+"]").css("text-decoration","none")
          $("button[data="+link.id+"]").text("Mark As Read")
        }
      }
    })
  })
})
