<?php echo $header; ?>
<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>
<!-- MODAL WINDOW BEGIN END -->
<!-- PUPAP MESSAGE END -->
<div class="message-pupop" id="message-calculation" style="display: none;">
	<p class="font-size-12 font-type-verdana" id="text">Выберите предполагаемую ширину желаемой мебели. Для настройки высоты и глубины перейдите во вкладку "Эксклюзивные". Также в стоимость будет включена возможность изменять материалы, форму, наполнение и любые другие характеристики.</p>
	<p class="arrow"></p>
</div>
<!-- PUPAP MESSAGE END -->

<div class="container visible-lg" id="calculator">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
			<?php if(!next($breadcrumbs)) { ?>
				<li class="breadcrumb_last"><span class="red">Расчет стоимости</span></li>
				<?php continue; ?>
				<?php } ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

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
			<h2 class="text-center">Выберите тип мебели</h2>

			<div class="row">
				<div class="col-mg-0 col-lg-2">
				</div>
				<div class="col-mg-12 col-lg-8 box_root">
					<div class="row">
						<?php foreach($categories_root as $category_root) { ?>
						<div class="col-lg-3">
							<div class="box_root_item box border-gray" data-cal_root="1">
								<input type="checkbox" name="category_root" value="<?php echo $category_root['category_id'] ?>" data-cal_root="1" >
								<img src="<?php echo $category_root['image']; ?>"
									 title="<?php echo $category_root['name']; ?>"
									 alt="<?php echo $category_root['name']; ?>"
									 class="img-responsive center-block"/>
								<p class="no-active">
									<?php if($category_root['category_id'] == 59) { ?>
										Шкафы - Купе на заказ
									<?php } else { ?>
										<?php echo $category_root['name']; ?>
									<?php } ?>
								</p>
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
			<div class="col-lg-12">
				<h2 class="text-center" name="type-wardrobes" hidden="hidden">Выберите тип шкафа</h2>
			</div>

			<div class="col-lg-12 text-center" name="sub_box">
			</div>
			<!-- SUBTYPE FURNITURE END -->

			<!-- PRODUCTS BEGIN -->
			<input type="hidden" name="product_id" data-modal="1" value="" />
			<h2 class="text-center" name="type-products" hidden="hidden">Выбирете модель</h2>
			<div class="row" name="product_box">
			</div>
			<!-- PRODUCTS END -->
			<!-- CALCULATOR BEGIN -->
			<h2 class="text-center">Подберите размеры для изделия</h2>

				<input type="hidden" name="type" data-modal="1" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
				<input type="hidden" name="two_modal" data-modal="1" value="0" />
				<div class="row" id="calculator-box">

					<div id="cal-calculation-box" class="col-lg-6 no-padding margin-left">
						<div id="button-check">
							<div id="quest-calculation"></div>
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
									<div id="slider-range"></div>
									<p>Ширина (см)</p>
								</div>

								<span id="width">Высота: 240см</span>
								<span id="height">Глубина: 60см </span>
							</div>
							<div id="exclusive-box">

								<span id="text-width">Ширина (см)</span>
								<input type="text" name="width" id="input_width" data-modal="1" value="100" class="form-control">
								<span id="text-height">Высота (см)</span>
								<input type="text" name="height" id="input_height" data-modal="1" value="240" class="form-control">
								<span id="text-depth">Глубина (см)</span>
								<input type="text" name="depth" id="input_depth" data-modal="1" value="60" class="form-control">
								<p>Минимальные размеры: 100х100х100</p>
								<p>Максимальные размеры: 200х100х100</p>

							</div>

							<h2 id="cal_top_price">8400 рублей</h2>
							<span id="cal_sub_price">15100 рублей</span>

							<input type="button" id="calculation_button" data-modal="1" class="button-style-1" value="Заказать"/>
						</div>
					</div>


					<div id="cal-dispatch-box" class="col-lg-6 no-padding">
						<div class="calculator_dispatch">
							<input type="text" name="telephone" data-modal="1" value="" placeholder="+7 (984) 174 75 12" class="input-medium bfh-phone font-size-12">
							<input type="button"  id="dispatch_button" data-modal="1" value="Отправить" class="button-style-1" />
							<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
						</div>
					</div>
				</div>

			<!-- CALCULATOR END -->
			<!-- BANNER BEGIN -->
			<div class="row">
				<div class="col-lg-12 text-center" id="banner">
					<div >
					</div>
				</div>
			</div>
			<!-- BANNER END -->
			<!-- CONTENT END -->
			<?php echo $column_right; ?></div>
	</div>
</div>




<!-- FOR MOBILE -->
<div class="container hidden-lg" id="calculator">
	<div class="row">
		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
		</div>
		<div class="col-xs-12 text-type-furniture">
			<h2 class="text-center">Выберите тип мебели</h2>
		</div>

		<div class="col-xs-12 box_root">
			<div class="box-root-sub">
				<?php foreach($categories_root as $category_root) { ?>
				<div class="box_root box_root-mobile">
					<div class="box_root_item box  border-gray" data-cal_root="1">
						<input type="checkbox" name="category_root" value="<?php echo $category_root['category_id'] ?>" data-cal_root="1">
						<img src="<?php echo $category_root['image']; ?>"
							 title="<?php echo $category_root['name']; ?>"
							 alt="<?php echo $category_root['name']; ?>"
							 class="img-responsive center-block"/>
						<p class="no-active">
							<?php if($category_root['category_id'] == 59) { ?>
							Шкафы - Купе на заказ
							<?php } else { ?>
							<?php echo $category_root['name']; ?>
							<?php } ?>
						</p>
					</div>
				</div>
				<?php } ?>
			</div>
		</div>
		<!-- TYPE OF FURNITURE END -->

		<!-- SUBTYPE FURNITURE BEGIN -->
		<div class="col-xs-12">
			<h2 class="text-center" name="type-wardrobes" hidden="hidden">Выберите тип шкафа</h2>
		</div>
		<div class="col-xs-12 text-center" >
			<div class="box-root-sub" name="sub_box">

			</div>
		</div>
		<!-- SUBTYPE FURNITURE END -->

		<!-- PRODUCTS BEGIN -->
		<input type="hidden" name="product_id" data-modal="1" value="" />
		<div class="col-xs-12">
			<h2 class="text-center" name="type-products" hidden="hidden">Выбирете модель</h2>
		</div>
		<div class="col-xs-12 text-center" >
			<div class="box-root-sub" name="product_box">

			</div>
		</div>
		<!-- PRODUCTS END -->

	</div>
</div>

	<?php echo $footer; ?>

<script>
$(document).ready(function () {





	var check_sub_cat_id = 0; //if sub category not select
	var check_product_id = 0; //if sub category not select



	//Выбор главной категории
	$("[data-cal_root]:visible:not(input)").click(function () {
		ajaxRenderRoot($(this));
	});
	//Выбор главной категории
	$("input[data-cal_root]:visible").change(function () {
		ajaxRenderRoot($(this));
	});

	function ajaxRenderRoot(this_root_item) {
		var id = this_root_item.parent().find('input').val();
		//alert('check_root_cat_id' + check_root_cat_id + 'id' +id);
		$(".box_root_item:visible").find('p').addClass('no-active');

		if( check_sub_cat_id != id) {

			$('.box_root:visible').find('input').prop('checked', false);
			this_root_item.find("input").prop('checked', true);
			this_root_item.find('p').removeClass('no-active');
			ajaxOpenCategory(id, 'root'); //Show sub categories

		} else { //Если этот элемент уже был выбран, то закрываем все, и делаем как было
			$('.box_root:visible').find('input').prop('checked', false);
			hideSubCategories(); // Hide sub categories and products
			check_sub_cat_id = 0;
		}

	}




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
			var product_box = $("[name='product_box']");
			product_box.empty();
		}

	});






	function hideSubCategories() {
		var type_sub_box = $("[name='sub_box']");
		type_sub_box.empty();
		var type_product_box = $("[name='product_box']");
		type_product_box.empty();
		$("[name='type-wardrobes']").hide();
		$('#type-products').hide();
	}



	function ajaxRenderCategories_desktop(data, root) {

		hideSubCategories();
		$("[name='type-wardrobes']").show();
		var type_sub_box = $("[name='sub_box']:visible");
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





	function ajaxRenderCategories_mobile(data, root) {

		hideSubCategories();
		$("[name='type-wardrobes']").show();
		var type_sub_box = $("[name='sub_box']:visible");
		var html = '';
		$.each(data, function (index, value) {
			html += '<div class="dynamic_category">';
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



	function ajaxRenderProducts_desktop(data, root) {

		// alert('products' + root);
		if(root == 1) {
			// alert('hide');
			hideSubCategories();
		}

		$("[name='type-products']").show();
		var type_product_box = $("[name='product_box']");
		type_product_box.empty();
		var html = '<div id="carousel" class=" owl-carousel">';
		$.each(data, function (index, value) {
			html += '<div class="product_item box">';
			html += '<input type="checkbox" name="products" value="' + value['product_id'] + '" >';
			html += '<img src="' + value['image'] + '"';
			html += 'title="' + value["name"] + '"';
			html += 'alt="' + value["name"] + '"';
			html += 'class="img-responsive center-block"/>';
			html += '<p>' + value["name"] + "<br> Модель:" + value["model"] + '</p>';
			html += '</div>';
		});

		html += '</div>';
		type_product_box.append(html);
//		$("#carousel").owlCarousel({
//			navigation: true,
//			pagination:  false,
//			navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
//		});
		$("#carousel").owlCarousel({
			nav:true,
			navText : ["",""]
		});

	}


	function ajaxRenderProducts_mobile(data, root) {

		// alert('products' + root);
		if(root == 1) {
			hideSubCategories();
		}
		$("[name='type-products']").show();
		var type_product_box = $("[name='product_box']");
		type_product_box.empty();
		var html = '<div class="product-box-mobile" id="carusel">';
		for(var i = 0; i < data.length;) {
			html += '<div class="product-box-carusel-mobile">';
			for(var ii = 0; ii < 4; ii++) {
				html += '<div class="product_item box sub_box_item">';
				html += '<input type="checkbox" name="products" value="' + data[i]['product_id'] + '" >';
				html += '<img src="' + data[i]['image'] + '"';
				html += 'title="' + data[i]["name"] + '"';
				html += 'alt="' + data[i]["name"] + '"';
				html += 'class="img-responsive center-block"/>';
				html += '<p>Модель: ' + data[i]["model"] + '</p>';
				html += '</div>';
			}
			html += '</div>';
			i += 4;
		}

		html += '</div>';
		type_product_box.append(html);

	}


	function ajaxOpenCategory(id, type) {
		$.ajax({
			url: 'index.php?route=calculator/calculator/ajaxOpen',
			dataType: 'json',
			data: 'id=' + id + '&type=' + type,
			type: 'post',
			beforeSend: function () {
			},
			success: function (json) {
				var type = json['type'];
				if (type.localeCompare("categories") == 0) {
					if($('.visible-lg').is(':visible')) {
						ajaxRenderCategories_desktop(json['data'], json['root']); //Для компьютерной версии
					} else  {
						ajaxRenderCategories_mobile(json['data'], json['root']); //Для мобильной версии
					}

				}
				if (type.localeCompare("products") == 0) {
					if($('.visible-lg').is(':visible')) {
						ajaxRenderProducts_desktop(json['data'], json['root']); //Для компьютерной версии
					} else {
						ajaxRenderProducts_mobile(json['data'], json['root']); //Для мобильной версии
					}
				}
				if (type.localeCompare("no_edit") == 0) {
				}
				check_sub_cat_id = id;
			},
			error: function (xhr, ajaxOptions, thrownError) {
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

			$('input[name="product_id"]').val(id);

		} else {
			var product_box = $("[name='product_box']");
			product_box.empty();
		}

	});

});






</script>