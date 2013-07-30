$(document).ready(function() {

  $('form').submit(function(e){
    e.preventDefault();
    $('input').attr('disabled',true);
    $('.messages').text("Sending your tweet, yo!");

    $.ajax({
      url: '/tweets',
      data: {tweet_text: $('#tweet_field').val()},
      type: 'POST',
      success: function() {
        $('.messages').text("Tweet successful, yo!");
        // $('input').attr('disabled',false);
      },
      error: function() {
        $('.messages').text("Error, yo");
        // $('input').attr('disabled',false);
      }
    });
  });
});
