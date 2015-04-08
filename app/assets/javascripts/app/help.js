$(document).ready(function(){
  $('.help').hide();
  $('.help-btn').click(function(){
    $('.help').show('slide', {direction: "up"}, 500, function(){
    });
  });
  $('.back').click(function(){
    $('.help').hide('slide', {direction: "up"}, 500);
  });
});