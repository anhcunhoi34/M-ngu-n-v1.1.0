$(document).ready(function () {
	
	$('#price-range-submit').hide();

	$("#min_price,#max_price").on('change', function () {
        
		$('#price-range-submit').show();

		var min_price_range = parseInt($("#min_price").val());

		var max_price_range = parseInt($("#max_price").val());

		if (min_price_range > max_price_range) {
			$('#max_price').val(min_price_range);
		}

		$("#slider-range").slider({
			values: [min_price_range, max_price_range]
		});

	});


	$("#min_price,#max_price").on("paste keyup", function () {
		$('#price-range-submit').show();

		var min_price_range = parseInt($("#min_price").val());

		var max_price_range = parseInt($("#max_price").val());

		if (min_price_range == max_price_range) {

			max_price_range = min_price_range + 100;

			$("#min_price").val(min_price_range);
			$("#max_price").val(max_price_range);
		}

		$("#slider-range").slider({
			values: [min_price_range, max_price_range]
		});

	});


	$(function () {

		let session_currency_rate = $('#session_currency_rate').val();
		let min_price=$('#get_min_price').val() * session_currency_rate;
		let max_price=$('#get_max_price').val() * session_currency_rate;
		let product_max_price=$('#product_max_price').val() * session_currency_rate;
		let product_min_price = 0 * session_currency_rate;

		$("#slider-range").slider({
			range: true,
			orientation: "horizontal",
			min: product_min_price,
			max: product_max_price,
			values: [min_price, max_price],
			step: 10,

			slide: function (event, ui) {
				if (ui.values[0] == ui.values[1]) {
					return false;
				}

				$("#min_price").val(ui.values[0]);
				$("#max_price").val(ui.values[1]);
			}
		});

		$("#min_price").val($("#slider-range").slider("values", 0));
		$("#max_price").val($("#slider-range").slider("values", 1));

	});

	$("#slider-range,#price-range-submit").click(function () {
		var min_price = $('#min_price').val();
		var max_price = $('#max_price').val();
		
		$("#searchResults").text("Here List of products will be shown which are cost between " + min_price + " " + "and" + " " + max_price + ".");
	});

	

	$('#slider-range').on('click', function(){
		let min_price = $('#min_price').val();
		let max_price = $('#max_price').val();
		$('#filter_min_price').val(min_price);
		$('#filter_max_price').val(max_price);
	})


});