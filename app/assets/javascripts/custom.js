$('[data-toggle=offcanvas]').click(function() {
  $(this).toggleClass('visible-xs text-center');
  $(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
  $('.row-offcanvas').toggleClass('active');
  $('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
  $('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
  $('#btnShow').toggle();
});

$(document).on('turbolinks:load', function(){

  $('.disabled').unbind('click');

  // $('.load_article').scroll(function(){
  //   if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight){
  //     var last_id = $('.post-id:last').attr('id');
  //     $.ajax({
  //       url: '/load_more_data',
  //       method: 'get',
  //       data: {last_id: last_id},
  //       dataType: 'json',
  //       success: function(data){
  //         $('.ajax-load').hide();
  //         $('#post-data').append(data.html);
  //         console.log(data.html);
  //       }
  //     });
  //   }
  // });

  $('body').on('click', '.like_new', function() {
    var article_id = $(this).siblings('.article_id').val();
    var number_one = parseInt($(this).siblings('.number_one').val());
    var number_tow = parseInt($(this).siblings('.number_tow').val());
    if(number_one == 0){
      $(this).css('background-color', 'blue');
      $(this).css('color', 'white');
      $(this).siblings('.unlike_new').css('background-color', 'white');
      $(this).siblings('.unlike_new').css('color', 'black');
      $(this).siblings('.number_one').val('1');
      $(this).siblings('.number_tow').val('0');
      $.ajax({
        url: '/like_status',
        method: 'get',
        data: {article_id: article_id, number_one: 0, number_tow: 1},
        dataType: 'json',
        success: function(data){
          $('#dat_'+article_id).html(data.html);
        }
      });
    }else{
      $(this).css('background-color', 'white');
      $(this).css('color', 'black');
      $(this).siblings('.unlike_new').css('background-color', 'white');
      $(this).siblings('.unlike_new').css('color', 'black');
      $(this).siblings('.number_one').val('0');
      $(this).siblings('.number_tow').val('0');
      $.ajax({
        url: '/revoke_status',
        method: 'get',
        data: {article_id: article_id, number: 1},
        dataType: 'json',
        success: function(data){
          $('#dat_'+article_id).html(data.html);
        }
      });
    }
  });

  $('body').on('click', '.unlike_new', function() {
    var article_id = $(this).siblings('.article_id').val();
    var number_tow = parseInt($(this).siblings('.number_tow').val());
    if(number_tow == 0){
      $(this).css('background-color', 'blue');
      $(this).css('color', 'white');
      $(this).siblings('.like_new').css('background-color', 'white');
      $(this).siblings('.like_new').css('color', 'black');
      $(this).siblings('.number_tow').val('1');
      $(this).siblings('.number_one').val('0');
      $.ajax({
        url: '/like_status',
        method: 'get',
        data: {article_id: article_id, number_one: 1, number_tow: 0},
        dataType: 'json',
        success: function(data){
          $('#dat_'+article_id).html(data.html);
        }
      });
    }else{
      $(this).css('background-color', 'white');
      $(this).css('color', 'black');
      $(this).siblings('.like_new').css('background-color', 'white');
      $(this).siblings('.like_new').css('color', 'black');
      $(this).siblings('.number_tow').val('0');
      $(this).siblings('.number_one').val('0');
      $.ajax({
        url: '/revoke_status',
        method: 'get',
        data: {article_id: article_id, number: 0},
        dataType: 'json',
        success: function(data){
          $('#dat_'+article_id).html(data.html);
        }
      });
    }
  });

  $('body').on('click', '.button_comment', function() {
    var comment = $(this).siblings('.content_comment').val();
    var article_id = $(this).siblings('.articleid').val();
    $(this).siblings('.content_comment').val('')
    $.ajax({
      url: '/add_new_comment',
      method: 'post',
      data: {comment: comment, article_id: article_id},
      dataType: 'json',
      success: function(data){
        $('#new_'+article_id).append(data.html);
        $('#dat_'+article_id).html(data.view_comment);
      }
    });
  });

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

  $('#imgInp').change(function(){
    readURL(this);
    $('#blah').css('display', 'block');
  });

  $('body').on('click', '.comment', function() {
    $(this).parents('.abc').siblings('.panel-footer').toggle();
  })

  $('#search_user').keyup(function(){
    var content_search = $(this).val();
    if(content_search.length >= 2){
      $.ajax({
        url: '/search_user',
        method: 'get',
        data: {name_search: content_search},
        dataType: 'json',
        success: function(data){
          $('#result_search').css('display','block');
          $('#result_search').html(data.html);
          $('.padding').hide();
        }
      });
    }else{
      $('.padding').show();
      $('#result_search').hide();
    }
  });

  // follow
  $('#follow').click(function(){
    var currentuser_id = $(this).siblings('.currentuser_id').val();
    var followingid = $(this).siblings('.followingid').val();
    $.ajax({
      url: '/track_follow',
      method: 'get',
      data: {currentuser_id: currentuser_id, followingid: followingid},
      dataType: 'json',
      success: function(data){
        $('#follow').html(data.html);
        $('#update_follow').html(data.follower);
      }
    });
  });

  $('.show_notification').click(function(){
    var counted = parseInt($('#user_countd_id').val());
    
    if(counted>0){
      $.ajax({
        url: '/user_update_showed',
        method: 'get',
        data: {counted: counted},
        dataType: 'json',
        success: function(data){
         $('#count_noti').remove();
        }
      });
    }
  });

  $('.up_user_watch').click(function(){
    var ar_id = $(this).siblings('.ar_id').val();
    $.ajax({
      url: '/user_update_watched',
      method: 'get',
      data: {ar_id: ar_id},
      dataType: 'json',
      success: function(data){
        $('#closemodal_'+ar_id).remove();
      }
    });
  });
});

$(document).on('turbolinks:load', function () {
  $('.load_article').scroll(function(){
    var more_posts_url = $('.pagination .next_page a').attr('href');
    if (more_posts_url && $(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
      $.getScript(more_posts_url);
    }
  });
});
