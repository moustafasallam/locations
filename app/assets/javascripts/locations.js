$(document).ready(function() {

  $(document.body).on('submit', '#weather-check-form', function(e) {
    e.preventDefault();
    var data = $(this).serializeJSON();
    $.ajax({
      url: '/locations',
      dataType: "json",
      type: "POST",
      data: data,
      success: function(res){
        alert(res);
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
          alert(errorThrown);
      },
    });
  });

});