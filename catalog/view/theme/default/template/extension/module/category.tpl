<div class="border-gray list-group line-dark-before"  style="width:263px; height: 361px">
	<h4>Мебель</h4>
	<div class="body">
		<p>Шкафы</p>
		<ul class="">
			<li><a href="<?php echo $categories[67]['href'] ?>">Стандартные шкафы-купе</a></li>
			<li><a href="<?php echo $categories[66]['href'] ?>">Угловые шкафы-купе</a></li>
			<li><a href="<?php echo $categories[60]['href'] ?>">Встроенные шкафы-купе</a></li>
			<!-- <li><a href="<?php echo $categories[59]['href'] ?>">Шкафы-Купе</a></li> -->
			<li><a href="<?php echo $categories[64]['href'] ?>">Радиусные шкафы-купе</a></li>
		</ul>
		<div class="text"><a href="<?php echo $categories[69]['href'] ?>">Прихожие</a></div>
		<div class="text"><a href="<?php echo $categories[68]['href'] ?>">Гардеробные</a></div>
		<div class="text"><a href="<?php echo $categories[70]['href'] ?>">Наши работы</a></div>
	</div>
</div>
<div class="border-gray text-center"  style="width:263px; height: 151px">
	<p class="font-size-18 font-type-georgia" style="margin-top: 22px;">Минимальная цена (руб.)</p>
	<div id="input-slider">
		<input type="text" name="input-min" data-modal="1" value="0" class="input-medium bfh-phone font-size-14" style="float: left;margin-left: 31px;">
		<input type="text" name="input-max" data-modal="1" value="200000" class="input-medium bfh-phone font-size-14" style="float: right;margin-right: 30px;">
	</div>
	<div id="slider-category"></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#slider-category").slider({
		range: true,
		min: 0,
		max: 200000,
		values: [0, 200000],
		slide: function (event, ui) {
			$('[name="input-min"]').val(ui.values[0]);
			$('[name="input-max"]').val(ui.values[1]);
			productFilterPrice();
		}
	});


	$('[name="input-min"], [name="input-max"]').keydown(function() {
		updateSlider();
	});

	function updateSlider() {
		var price_min  = $('[name="input-min"]').val();
		var price_max = $('[name="input-max"]').val();
		//alert(price_max);
		$("#slider-category").slider('values', 0, price_min);
		$("#slider-category").slider('values', 1, price_max);
		//alert($('[name="products_json_id"]').val());
		productFilterPrice();
	}


	$('[name="input-min"], [name="input-max"]').keypress(function(e) {
		if (e.keyCode < 48 || e.keyCode > 57) {
			return false;
		}
	});
});
function productFilterPrice() {
	$.ajax({
		url: 'index.php?route=extension/module/category/productFilterPrice',
		dataType: 'html',
		data: 'products_json_id=' + $('[name="products_json_id"]').val() + '&min=' + $('[name="input-min"]').val() + '&max=' + $('[name="input-max"]').val(),
		type: 'post',
		beforeSend: function () {
		},
		success: function (html) {
			//alert($.isArray(json));
			$('.product-box').empty();
			$('.product-box').append(html)
		},
		error: function (xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
function ajaxFilterPrice() {
	$.ajax({
		url: 'index.php?route=extension/module/category/ajaxFilterPrice',
		dataType: 'json',
		data: 'products_json_id=' + $('[name="products_json_id"]').val() + '&min=' + $('[name="input-min"]').val() + '&max=' + $('[name="input-max"]').val() + '&category_id=' + $('[name="category_id"]').val(),
		type: 'post',
		beforeSend: function () {
		},
		success: function (json) {
			//alert($.isArray(json));
			$('.product-layout').each(function (index, value) {
				var arJson = json['approved_product_id'];
				for(var i=0; i<arJson.length; i++) {
					if(arJson[i] == $(this).data('product_id')) {
						$(this).css('color', '#FFFFFF');
						$(this).hide();
						console.log("BINGO !!!! json['approved_product_id'] " + json['approved_product_id']);
					} else {
						$(this).show();
					}
				}

			});
		},
		error: function (xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}




</script>