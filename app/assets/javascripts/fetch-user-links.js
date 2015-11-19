// $(document).ready(function () {
//   $.ajax({
//     type:    "GET",
//     url:     "/api/v1/index",
//     success: function(links) {
//       links.forEach(function (link) {
//         if (link.read === false){
//           var readStatus = "Mark As Read"
//         } else {
//           var readStatus = "Mark As Unread"
//         }

//         $("#links-container").append(
//           "<div class='link' data-title="+link.title+" data-id='"
//           + link.id
//           + "'><h6>Title: "
//           + link.title
//           + "</h6><span data="+link.id+">"
//           + link.url
//           + "</span><br><a href=/links/"+link.id+"/edit>Edit</a>"
//           + "<button id=read-status data="+link.id+">"+readStatus+"</button></div>"
//         )
//       })
//     }
//   })
// })
