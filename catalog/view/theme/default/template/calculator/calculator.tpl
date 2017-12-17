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
								<p><?php echo $category_root['name']; ?></p>
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
			<div class="row" id="model_box">
			</div>
			<!-- PRODUCTS END -->
			<!-- CALCULATOR BEGIN -->
			<h1 class="text-center">Подберите размеры для изделия</h1>
			<div class="row" id="calculator_box">
				<div class="col-lg-6">
					<div id="calculator_box_calculation_box" class="row">
						<div id="calculation_box_button_check">
							<div id="standard" title="Стандарт">
								<p>Стандарт</p>
							</div>
							<div id="exclusive" title="Эксклюзив">
								<p>Эксклюзив</p>
							</div>
						</div>
						<div id="calculation_box_validate_form">
							<div id="calculation_box_standard">
								<div id="calculation_box_width_slider">
									<input id="width_slider" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
									<p>Ширина (см)</p>
								</div>

								<span id="calculation_text_width_and_height">Высота: 240см Глубина: 60см </span>
								<span id="calculation_text_advanced_settings">Расширенные настройки </span>

								<h2 id="calculation_text_sum_standard">25 000 рублей</h2>
								<span id="calculation_text_sum_exclusive">эксклюзив 25 000 рублей</span>

								<button type="button" id="calculation_button_standard"  class="btn btn-lg btn_calculator">Заказать</button>
							</div>
							<div id="calculation_box_exclusive">

								<span id="calculation_exclusive_text_width">Ширина (см)</span>
								<input type="text" name="calculation_exclusive_input_width" id="calculation_exclusive_input_width" value="" class="form-control">
								<span id="calculation_exclusive_text_height">Высота (см)</span>
								<input type="text" name="calculation_exclusive_input_height" id="calculation_exclusive_input_height" value="" class="form-control">
								<span id="calculation_exclusive_text_depth">Глубина (см)</span>
								<input type="text" name="calculation_exclusive_input_depth" id="calculation_exclusive_input_depth" value="" class="form-control">

								<h2 id="calculation_exclusive_text_sum_exclusive">25 000 рублей</h2>
								<span id="calculation_exclusive_text_sum_standard">стандарт 25 000 рублей</span>

								<button type="button" id="calculation_button_exclusive"  class="btn btn-lg btn_calculator">Заказать</button>
							</div>
						</div>


					</div>
				</div>
				<div class="col-lg-6">
					<div id="calculator_box_dispatch_box" class="row">
						<form action="<?php echo $link_calculator; ?>/setclient" method="post" id="form-base-modifier-terminal"> <!-- TO DO -->

							<img src="<?php echo $calculator_dispatch_img; ?>"
								 alt="Отправте телефон для связи"
								 class="img-responsive center-block"/>
							<div class="calculator_dispatch">
								<input type="text" name="telephone" value="" placeholder="+7 (984) 174 75-12" pattern="\d+(\.\d*)?" class="input-medium bfh-phone">
								<input type="submit" value="Отправить" class="btn btn-lg btn_calculator" />
							</div>
						</form>
					</div>

				</div>


			</div>







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
	<?php echo $footer; ?>



	<script type="text/javascript">


		$(document).ready(function () {
			var check_root_id = 0; //if root category not select

			$('#calculation_box_exclusive').hide();

			$('#standard').click(function () {
				//$(this).append($('#calculator_active_img'));
				$('#calculation_box_exclusive').hide();
				$('#calculation_box_standard').show();
				//$('#calculator_active_img').addClass('calculator_active_button_standard');
				$('#standard p').addClass('calculator_active_button');
			});
			$('#exclusive').click(function () {
				$('#calculation_box_exclusive').show();
				$('#calculation_box_standard').hide();
			//	$('#calculator_active_img').removeClass();
			//	$('#calculator_active_img').addClass('calculator_active_button_standard');
			});

			// With JQuery SLider calculation
			$('#width_slider').slider({
				formatter: function(value) {
					return '' + value;
				}
			});

			$(document).on('click', '.dynamic_category', category_open);
			function category_open() {
				//alert('name');
				var id = $(this).find('input:checkbox').val();
				ajaxOpenCategory(id, 'products');
			}

			$('.box_root_item').click(function () {
				ajaxRenderRoot($(this));
			});
			$('.box_root_item input').change(function () {
				ajaxRenderRoot($(this));
			});

			function ajaxRenderRoot(this_root_item) {
				var id = this_root_item.find('input').val();
				alert('id=' + id + '&check_root_id=' + check_root_id);
				if(check_root_id != id) {
					alert('dfg');
					$('.box_root').find('input').prop('checked', false);
					this_root_item.find("input").prop('checked', true);
					ajaxOpenCategory(id, 'categories'); //Show sub categories
				} else {
					$('.box_root').find('input').prop('checked', false);
					hideSubCategories(); // Hide sub categories and products
					check_root_id = 0;
				}

			}

			function hideSubCategories() {
				var type_sub_box = $('#sub_box');
				type_sub_box.empty();
				var type_product_box = $('#model_box');
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
						html += 'class="img-responsive center-block"/>';
						html += '<p>' + value["name"] + '</p>';
						html += '</div>';
					html += '</div>';
				});

				type_sub_box.append(html);
			}

			function ajaxRenderProducts(data) {

				var type_product_box = $('#model_box');
				type_product_box.empty();
				var html = '<div id="carousel" class="carousel-control">';
				$.each(data, function (index, value) {

						html += '<div class="product_box box">';
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
				alert('id=' + id + '&type=' + type);
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
							check_root_id = id;
						}
						if (type.localeCompare("products") == 0) {
							ajaxRenderProducts(json['data']);
						}


					},
					error: function (xhr, ajaxOptions, thrownError) {
						//alert('error');
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		});


	</script>