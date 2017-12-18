<?php echo $header; ?>
<div class="container container-fix " id="calculator">
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<!-- CONTENT BEGIN -->
			<div class="row">
				<div class="col-sm-12">
					<?php echo $description; ?>
				</div>
			</div>
			<!-- CONTENT END -->
			<!-- TYPE OF FURNITURE BEGIN -->
			<h1 class="text-center">Выбирете тип мебели</h1>

			<div class="row">
				<div class="col-mg-0 col-lg-2">
				</div>
				<div class="col-mg-12 col-lg-8 box_root">
					<div class="row">
						<?php foreach($categories_root as $category_root) { ?>
						<div class="col-lg-3">
							<div class="box_root_item box">
								<input type="checkbox" name="category_root" value="<?php echo $category_root['category_id'] ?>" >
								<img src="<?php echo $category_root['image']; ?>"
									 title="<?php echo $category_root['name']; ?>"
									 alt="<?php echo $category_root['name']; ?>"
									 class="img-responsive center-block"/>
								<p class="no-active"><?php echo $category_root['name']; ?></p>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
				<div class="col-mg-0 col-lg-2">
				</div>
			</div>
			<!-- TYPE OF FURNITURE END -->
			<!-- SUBTYPE FURNITURE BEGIN -->
			<h1 class="text-center">Выбирете тип шкафа</h1>
			<div class="row" id="sub_box">
			</div>
			<!-- SUBTYPE FURNITURE END -->

			<!-- PRODUCTS BEGIN -->
			<h1 class="text-center">Выбирете модель</h1>
			<div class="row" id="product_box">
			</div>
			<!-- PRODUCTS END -->
			<!-- CALCULATOR BEGIN -->
			<h1 class="text-center">Подберите размеры для изделия</h1>
			<form action="<?php echo $link_calculator; ?>/addclient" method="post" id="form-base-modifier-terminal"> <!-- TO DO -->
				<input type="hidden" name="type" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
				<div class="row" id="calculator-box">

					<div id="cal-calculation-box" class="col-lg-6 no-padding margin-left">
						<div id="button-check">
							<div id="standard" title="Стандарт">
								<p>Стандарт</p>
							</div>
							<div class="line"></div>
							<div id="exclusive" title="Эксклюзив">
								<p>Эксклюзив</p>
							</div>
						</div>
						<div id="calculation-standard-or-exclusive">
							<div id="standard-box">
								<div id="slider">
									<input id="slider_width" name="width_slider" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
									<p>Ширина (см)</p>
								</div>

								<span id="width">Высота: 240см</span>
								<span id="height">Глубина: 60см </span>
								<span id="settings">Расширенные настройки </span>
							</div>
							<div id="exclusive-box">

								<span id="text-width">Ширина (см)</span>
								<input type="text" name="input_width" id="input_width" value="" class="form-control">
								<span id="text-height">Высота (см)</span>
								<input type="text" name="input_height" id="input_height" value="" class="form-control">
								<span id="text-depth">Глубина (см)</span>
								<input type="text" name="input_depth" id="input_depth" value="" class="form-control">


							</div>
							<h2 id="cal_top_price">25 000 рублей</h2>
							<span id="cal_sub_price">25 000 рублей</span>

							<input type="submit" id="calculation_button"  class="btn btn-lg btn_calculator" value="Заказать"/>
						</div>
					</div>


					<div id="cal-dispatch-box" class="col-lg-6 no-padding">
						<div class="calculator_dispatch">
							<input type="text" name="telephone" value="" placeholder="+7 (984) 174 75 12" class="input-medium bfh-phone">
							<input type="submit"  id="dispatch_button" value="Отправить" class="btn btn-lg btn_calculator" />
							<span class="error" hidden="hidden">Пожалуйста, введите телефон</span>
						</div>
					</div>
				</div>
			</form>







			<!-- CALCULATOR END -->
			<!-- BANNER BEGIN -->
			<div class="row">
				<div class="col-lg-12 text-center" id="banner">
					<a href="/">
					</a>
				</div>
			</div>
			<!-- BANNER END -->
			<!-- CONTENT END -->
			<?php echo $column_right; ?></div>
	</div>
</div>
	<?php echo $footer; ?>



	<script type="text/javascript">



		$(document).ready(function () {
			var standard_text = 'стандарт';
			var exclusive_text = 'эксклюзив';

			var check_root_cat_id = 0; //if root category not select
			var check_sub_cat_id = 0; //if sub category not select
			var check_product_id = 0; //if sub category not select


			$('#exclusive-box').hide();
			$('#standard p').addClass('active-button');
			$('#cal_sub_price').text(standard_text + ' ' + $('#cal_sub_price').text());
			$("[name='telephone']").mask("(999) 999-9999", {autoсlear: false});
			$('.calculator_dispatch .error').hide();
			// With JQuery SLider calculation
			$("[name='width_slider']").slider({
				formatter: function(value) {
					return '' + value;
				}
			});



			$('.box_root_item').click(function () {
				ajaxRenderRoot($(this));
			});
			$('.box_root_item input').change(function () {
				ajaxRenderRoot($(this));
			});


			$(document).on('click', '.dynamic_category', function () {
				$('.dynamic_category').find('img').addClass('no-active');
				$('.dynamic_category').find('p').addClass('no-active');
				var this_sub_category = $(this);
				var id = this_sub_category.find('input:checkbox').val();
				if(check_sub_cat_id != id) {
					ajaxOpenCategory(id, 'products');
					$('.dynamic_category').find('input').prop('checked', false);
					this_sub_category.find("input").prop('checked', true);
					this_sub_category.find('img').removeClass('no-active');
					this_sub_category.find('p').removeClass('no-active');

				} else {
					var product_box = $('#product_box');
					product_box.empty();
				}
			});

			function ajaxRenderRoot(this_root_item) {
				var id = this_root_item.find('input').val();
				$(".box_root_item").find('p').addClass('no-active');
				//alert('id=' + id + '&check_root_id=' + check_root_cat_id);

				if(check_root_cat_id != id) {
				//	alert('dfg');
					$('.box_root').find('input').prop('checked', false);
					this_root_item.find("input").prop('checked', true);
					this_root_item.find('p').removeClass('no-active');
					ajaxOpenCategory(id, 'categories'); //Show sub categories
				} else {
					$('.box_root').find('input').prop('checked', false);
					hideSubCategories(); // Hide sub categories and products
					check_root_cat_id = 0;
				}

			}

			function hideSubCategories() {
				var type_sub_box = $('#sub_box');
				type_sub_box.empty();
				var type_product_box = $('#product_box');
				type_product_box.empty();
			}

			function ajaxRenderCategories(data) {
				hideSubCategories();
				var type_sub_box = $('#sub_box');
				var html = '';

				$.each(data, function (index, value) {
					html += '<div class="col-sm-3 dynamic_category">';
						html += '<div class="box sub_box_item">';
						html += '<input type="checkbox" name="category_sub" value="' + value['category_id'] + '" >';
						html += '<img src="' + value['image'] + '"';
						html += 'title="' + value["name"] + '"';
						html += 'alt="' + value["name"] + '"';
						html += 'class="img-responsive center-block no-active"/>';
						html += '<p>' + value["name"] + '</p>';
						html += '</div>';
					html += '</div>';
				});

				type_sub_box.append(html);
			}

			function ajaxRenderProducts(data) {

				var type_product_box = $('#product_box');
				type_product_box.empty();
				var html = '<div id="carousel" class="carousel-control">';
				$.each(data, function (index, value) {

						html += '<div class="product_item box">';
						html += '<input type="checkbox" name="products" value="' + value['product_id'] + '" >';
						html += '<img src="' + value['image'] + '"';
						html += 'title="' + value["name"] + '"';
						html += 'alt="' + value["name"] + '"';
						html += 'class="img-responsive center-block"/>';
						html += '<p>' + value["name"] + " Модель:" + value["model"] + '</p>';
						html += '</div>';

				});
				html += '</div>';
				type_product_box.append(html);
				$("#carousel").owlCarousel({
					navigation: true,
					pagination:  false,
					navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
				});
			}

			function ajaxOpenCategory(id, type) {
				//alert('id=' + id + '&type=' + type);
				$.ajax({
					url: 'index.php?route=calculator/calculator/ajax',
					dataType: 'json',
					data: 'id=' + id + '&type=' + type,
					type: 'post',
					beforeSend: function () {
					},
					success: function (json) {

						var type = json['type'];
						if (type.localeCompare("categories") == 0) {
							ajaxRenderCategories(json['data']);
							check_root_cat_id = id;
						}
						if (type.localeCompare("products") == 0) {
							ajaxRenderProducts(json['data']);
							check_sub_cat_id = id;
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						//alert('error');
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}


			$(document).on('click', '.product_item', function () {
				$('.product_item').find('img').addClass('no-active');
				$('.product_item').find('p').addClass('no-active');
				var this_product = $(this);
				var id = this_product.find('input:checkbox').val();
				if(check_product_id != id) {
					$('.product_item').find('input').prop('checked', false);
					this_product.find("input").prop('checked', true);
					this_product.find('img').removeClass('no-active');
					this_product.find('p').removeClass('no-active');
					alert(id);
				} else {
					alert(id);

				}
			});









			$('#standard').click(function () {
				//$(this).append($('#calculator_active_img'));
				$('#exclusive-box').hide();
				$('#standard-box').show();
				$('#standard p').addClass('active-button');
				$('#exclusive p').removeClass('active-button');
				var text = $('#cal_sub_price').text();
				text = text.replace(exclusive_text, standard_text);
				$('#cal_sub_price').text(text);
				$("[name='type']").val(0);
			});
			$('#exclusive').click(function () {
				$('#exclusive-box').show();
				$('#standard-box').hide();
				$('#exclusive p').addClass('active-button');
				$('#standard p').removeClass('active-button');
				var text = $('#cal_sub_price').text();
				text = text.replace(standard_text, exclusive_text);
				$('#cal_sub_price').text(text);
				$("[name='type']").val(1);
			});

			$('#dispatch_button').click(function () {
				var text = $("[name='telephone']").val();
				if ((text.indexOf("_") != -1) || text == '') {
					$('.calculator_dispatch .error').show();
					return false;
				} else {
					$("[name='type']").val(2);
				}
			});


			$("a.fancybox").fancybox({
				'width':1024,
				'height':700,
				'transitionIn':'elastic',
				'transitionOut':'elastic',
				'speedIn':600,
				'speedOut':200,
				'overlayColor':'#666',
				'overlayShow':true
			});


		});




	</script>