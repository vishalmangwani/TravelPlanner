

jQuery(function ($) {
	// Load dialog on page load
	//$('#basic-modal-content').modal();

	// Load dialog on click
	$('#basic-modal .basic').click(function (e) {
		$('#basic-modal-content').modal();

		return false;
	});
	$('#basic-modal1 .basic1').click(function (e) {
		$('#basic-modal-content1').modal();

		return false;
	});
	$('#basic-modal2 .basic2').click(function (e) {
		$('#basic-modal-content2').modal();

		return false;
	});
});