$(document).ready(function(){
  $('.loc-form > h2').click(function(){
    $('.loc-form').switchClass('active', 'inactive');
    $('.edit').switchClass('inactive', 'active');
  });
  $('.edit > h2').click(function(){
    $('.edit').switchClass('active', 'inactive');
    $('.loc-form').switchClass('inactive', 'active');
  });
});