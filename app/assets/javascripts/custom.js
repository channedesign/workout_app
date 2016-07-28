$(document).on('turbolinks:load',function() {

	$('#workout-date').datepicker({ dateFormat: 'yy-mm-dd' });

	new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: 'workout-chart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: $("#workout-chart").data('workouts'),
	  // The name of the data record attribute that contains x-values.
	  xkey: 'activity_date',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['duration'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Duration (min)'],
	  xLabels: 'Day',
	  xLabelAngle: 60, 
	  xlabelFormat: function(x) {
	  	date_string = x.getFullYear() + '/' + parseInt(x.getMonth() + 1) + "/" + x.getDate();
	  	return date_string
	  },
	  yLabelFormat: function(y) { return y + 'min' }
	});

});