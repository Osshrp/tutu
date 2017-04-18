$(document).ready(function() {
  // $('.first_class_carriage').show();
  // $('.second_class_carriage').toggle();
  // $('.third_class_carriage').toggle();
  // $('.couch_carriage').toggle();

  $('#carriage_type').change(function() {
    var select_value;

    select_value = $(this).val();
    if (select_value == 'FirstClassCarriage') {
      $('.first_class_carriage').show();
      $('.second_class_carriage').hide();
      $('.third_class_carriage').hide();
      $('.couch_carriage').hide();
    } else if (select_value == 'SecondClassCarriage') {
      $('.first_class_carriage').hide();
      $('.second_class_carriage').show();
      $('.third_class_carriage').hide();
      $('.couch_carriage').hide();
    } else if (select_value == 'ThirdClassCarriage') {
      $('.first_class_carriage').hide();
      $('.second_class_carriage').hide();
      $('.third_class_carriage').show();
      $('.couch_carriage').hide();
    } else if (select_value == 'CouchCarriage') {
      $('.first_class_carriage').hide();
      $('.second_class_carriage').hide();
      $('.third_class_carriage').hide();
      $('.couch_carriage').show();
    }
  });
})
