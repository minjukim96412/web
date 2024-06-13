$(function(){
  $.ajax({
    method: "GET",
    url: "https://jsonplaceholder.typicode.com/users",
    success: function (data) {
      data.forEach(function (user) {
        console.log("위도: "+user.address.geo.lat + ", 경도: " + user.address.geo.lng);
      });
    }
  });
});
