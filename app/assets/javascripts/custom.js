$('[data-toggle=offcanvas]').click(function() {
  $(this).toggleClass('visible-xs text-center');
  $(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
  $('.row-offcanvas').toggleClass('active');
  $('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
  $('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
  $('#btnShow').toggle();
});

$(document).on('turbolinks:load', function(){
  setTimeout(function(){
    $('#flash').remove();
  }, 3000);

  $('#user_img').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('should be less than 5MB');
    }
  });
  $('.btn-pref .btn').click(function () {
    $('.btn-pref .btn').removeClass('btn-primary').addClass('btn-default');
    $(this).removeClass('btn-default').addClass('btn-primary');   
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#blah').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#imgInp").change(function(){
      readURL(this);
      $("#blah").css("display", "block");
  });
});
