$('input[type="submit"]').mousedown(function(){
  $(this).css('background', '#2ecc71');
});
$('input[type="submit"]').mouseup(function(){
  $(this).css('background', '#1abc9c');
});

$('#loginform').click(function(){
  $('.arrow-up').css('left','10%');
  $('.login').fadeToggle('slow');
  $(this).toggleClass('green');
});

$('#registerform').click(function(){
  $('.arrow-up').css('left','25%');
  $('.register').fadeToggle('slow');
  $(this).toggleClass('green');
});



$(document).mouseup(function (e)
{
    var container = $(".login");
    var container_reg = $('.register');

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        $('#loginform').removeClass('green');
    }

    if (!container_reg.is(e.target) // if the target of the click isn't the container...
        && container_reg.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container_reg.hide();
        $('#registerform').removeClass('green');
    }
});