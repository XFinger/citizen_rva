$(document).ready(function() {
    setTimeout(hideFlashes, 2000);
});

var hideFlashes = function() {
  $("#flash_notice, #flash_error, #flash_message").fadeOut(4000);
}


$('#stime').datetimepicker({
	beforeShowDay: $.datepicker.noWeekends,

	minDate: 1,
	stepMinute: 15,
	hourMin: 10,
	hourMax: 14,
  dateFormat: 'yy-mm-dd',
  timeFormat: 'hh:mm TT',
  alwaysSetTime: false
	});
	
 
$('#order_delivery_false').click(function() { $('.ss').hide(); });
$('#order_delivery_true').click(function() { $('.ss').show(); });




