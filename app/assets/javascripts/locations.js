$(document).ready(function() {

  $(document.body).on('submit', '#weather-check-form', function(e) {
    e.preventDefault();
    var loader = $('#loader-indicator');
    loader.removeClass('hide');
    var data = $(this).serializeJSON();
    var city_div = $('#city-container');
    var temp_div = $('#temp-container');
    $.ajax({
      url: '/locations',
      dataType: "json",
      type: "POST",
      data: data,
      success: function(res){
        loader.addClass('hide');
        res = res['payload'];
        city_div.html(res['city_name'] + '<br>' + res['country_code'] + '<br> city_id: ' + res['city_id'] + '<br> lat: ' + res['latitude'] + ' lon: ' + res['longitude']);
        temp_div.html('Temp: ' + res['temperature'] + '<br> Humidity: ' + res['humidity'] + '<br>' + res['weather_title'] + '<br>' + res['weather_description']);
      },
      error: function(xhr, status, errorThrown) {
          loader.addClass('hide');
          var data = xhr.responseJSON;
          city_div.html(data['code'] + ': ' + data['message']);
          temp_div.html(status + ' ' + errorThrown);
      },
    });
  });

});