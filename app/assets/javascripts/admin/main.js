$(function () {
  $('.navbar-toggle').click(function () {
    $('.navbar-nav').toggleClass('slide-in');
    $('.side-body').toggleClass('body-slide-in');
    $('#search').removeClass('in').addClass('collapse').slideUp(200);      
  });

  $('#search-trigger').click(function () {
    $('.navbar-nav').removeClass('slide-in');
    $('.side-body').removeClass('body-slide-in');
  });
});

$(document).on('turbolinks:load', function(){
  setTimeout(function(){
    $('#flash').remove();
  }, 3000);
});

function calc_total(){
  var sum = 0;
  $('.input-amount').each(function(){
      sum += parseFloat($(this).text());
  });
  $(".preview-total").text(sum);    
}
$(document).on('click', '.input-remove-row', function(){ 
  var tr = $(this).closest('tr');
  tr.fadeOut(200, function(){
    tr.remove();
     calc_total()
});
});

$(document).on('turbolinks:load', function(){
  $('.preview-add-button').click(function(){
    var form_data = {};
    var title = $('.payment-form textarea[name="title"]').val();
    var content = $('.payment-form textarea[name="content"]').val();
    var date = $('.payment-form input[name="date"]').val();
    var image = $('.payment-form input[name="image"]').val();
    if(title != "" && content != "" && date != ""){
      form_data["title"] = title;
      form_data["content"] = content;
      form_data["image"] = image;
      form_data["date"] = date;
      form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
      var row = $('<tr></tr>');
      $.each(form_data, function( type, value ) {
          $('<td class="input-'+type+'"></td>').html(value).appendTo(row);
      });
      $('.preview-table > tbody:last').append(row); 
      calc_total();
      $('.payment-form textarea[name="title"]').val("");
      $('.payment-form textarea[name="content"]').val("");
      $('.payment-form input[name="date"]').val("");
      $('.payment-form input[name="image"]').val("");
    }else{
      alert("Do not blank Title/Content/ReleaseDate");
    }
  });

  $('.change_status').click(function(){
    var current_status = $(this).siblings('.current_status').val();
    var current_article = $(this).siblings('.current_article').val();
    $.ajax({
      url: '/admin/update_status',
      method: 'get',
      data: {current_status: current_status, current_article: current_article},
      dataType: 'json',
      success: function(data){
        $('#status_'+current_article).html(data.html);
        console.log(data.html);
      }
    });
  });
});
