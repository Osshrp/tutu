$(document).ready(function() {
  $('a.edit_route').click(function(e) {
    e.preventDefault();
    var route_id = $(this).data('routeId');
    var form = $('#edit_route_' + route_id);
    var name = $('#route_name_' + route_id);

    if (!$(this).hasClass('cancel')) {
      $(this).html('Отменить');
      $(this).addClass('cancel');
    } else {
      $(this).html('Редактировать');
      $(this).removeClass('cancel');
    }

    form.toggle();
    name.toggle();
  });
});
