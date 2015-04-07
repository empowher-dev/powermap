$(document).ready(function(){
  $('.help').hide();
  $('.head-title').click(function(){
    $('.help').show('slide', {direction: "up"}, 500, function(){
    });
  });
  $('.back').click(function(){
    $('.help').hide('slide', {direction: "up"}, 500);
  });
});