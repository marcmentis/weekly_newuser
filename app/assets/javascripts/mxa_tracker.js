$(function(){
if ($('body.mxa_tracker').length) {
	//VARIABLES
	
	//STYLING
		//divs
		$('#divMxAWPageWrapper')
			.addClass('pad_3_sides');
		$('#divMxAWPageInnerWrapper')
			.addClass('centered')
			.css({'max-width': '1300px'})
		$('#div_MxAWTitle')
			.css({'text-align': 'center',
					'color': '#2e6e9e',
					'font-size': '17px',
					'font-weight': 'bold',
					'margin': '0 0 7px 0'});
		// $('#div_MxAW_uppercontainer')
		// 	.css({'background-color': 'red'});

		//forms
		$('#fMxAWsearch').addClass('form_container')
						.css({'width':'60%'});

	//SELECT HANDLERS

	//DATE HANDLERS
		$('[id^=dt]')
			.datepicker({
				dateFormat: 'yy-mm-dd',
				changeMonth: true,
				changeYear: true,
				yearRange: "-10: +10" })
			.addClass('texts')
			.css({'width':'7em'});

	//BUTTON HANLERS
		$('[id^=bt_]').button().addClass('reduce_button')
		// Can't use .hide() as wont work with IE 10
		$('#bt_MxAW_search_select').addClass('move_off_page')

	//RADIO HANLDERS

	//TEXTAREA HANDLERS

	//Run on open
	MxAW_refreshgrid('nil')
};  // if ($('body.widgets').length) {
}); // $(function(){
