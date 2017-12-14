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
				<div class="col-mg-12 col-lg-8">
					<div class="row">
						<?php foreach($categories_root as $category_root) { ?>
						<div class="col-lg-3">
							<div class="box_root box">
								<input type="radio" name="category_root" value="<?php echo $category_root['category_id'] ?>" >
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
			<div class="row" id="subtype_furniture_box">
			</div>
			<!-- SUBTYPE FURNITURE END -->

			<!-- MODEL BEGIN -->
			<h1 class="text-center">Выбирете модель</h1>
			<div class="row" id="model_box">
			</div>
			<!-- MODEL END -->

			<!-- Html код карусели -->
			<!-- Назад Вперед -->
			<p class="center-text"><a href="#" id="js-prev">Назад</a>
				<a href="#" id="js-next">Вперед</a></p>
			<div id="carousel">
				<div class="carousel-element">1</div>
				<div class="carousel-element">2</div>
				<div class="carousel-element">3</div>
				<div class="carousel-element">4</div>
				<div class="carousel-element">5</div>
				<div class="carousel-element">6</div>
				<div class="carousel-element">7</div>
				<div class="carousel-element">8</div>
				<div class="carousel-element">9</div>
				<div class="carousel-element">10</div>
				<div class="carousel-element">11</div>
				<div class="carousel-element">12</div>
				<div class="carousel-element">13</div>
				<div class="carousel-element">14</div>
			</div>


			<!-- CONTENT END -->
			<?php echo $column_right; ?></div>
	</div>
	<?php echo $footer; ?>



	<script type="text/javascript">


		$(document).ready(function () {

			// Находим блок карусели
			var carousel = $("#carousel");

			// Запускаем плагин карусели
			carousel.owlCarousel({
				// Количество отображающихся блоков
				// в зависимости от устройства (ширины экрана)

				// Количество блоков на больших экранах
				items:             10,

				// 5 блоков на компьютерах (экран от 1400px до 901px)
				itemsDesktop:      [1400, 5],

				// 3 блока на маленьких компьютерах (экран от 900px до 601px)
				itemsDesktopSmall: [900, 3],

				// 2 элемента на планшетах (экран от 600 до 480 пикселей)
				itemsTablet:       [600, 2],

				// Настройки для телефона отключены, в этом случае будут
				// использованы настройки планшета
				itemsMobile:       false
			});

			// Назад
			// При клике на "Назад"
			$('#js-prev').click(function () {

				// Запускаем перемотку влево
				carousel.trigger('owl.prev');

				return false;
			});

				// Вперед
				// При клике на "Вперед"
			$('#js-next').click(function () {

				// Запускаем перемотку вправо
				carousel.trigger('owl.next');

				return false;
			});






			$(document).on('click', '.dynamic_category', category_open);
			function category_open() {
				//alert('name');
				var id = $(this).find('input:radio').val();
				ajaxOpenCategory(id, 'products');
			}

			$('.box_root').click(function () {
				/*$('.box_root').find("input:radio").attr('checked', null);
				$(this).find("input:radio").attr('checked', 'checked');*/
				var id = $(this).find('input:radio').val();
				ajaxOpenCategory(id, 'categories');
			});

			function ajaxRenderCategories(data) {
				var type_sub_box = $('#subtype_furniture_box');
				type_sub_box.empty();
				var type_product_box = $('#model_box');
				type_product_box.empty();
				var html = '';

				$.each(data, function (index, value) {
					html += '<div class="col-sm-3 dynamic_category">';
						html += '<div class="box box_sub">';
						html += '<input type="radio" name="category_sub" value="' + value['category_id'] + '" >';
						html += '<img src="' + value['image'] + '"';
						html += 'title="' + value["name"] + '"';
						html += 'alt="' + value["name"] + '"';
						html += 'class="img-responsive center-block"/>';
						html += '</div>';
					html += '</div>';
				});

				type_sub_box.append(html);
			}

			function ajaxRenderProducts(data) {

				var type_product_box = $('#model_box');
				type_product_box.empty();
				var html = '<div id="carousel">';
				$.each(data, function (index, value) {
					html += '<div class="col-sm-3 dimamic_products">';
						html += '<div class="box box_sub">';
						html += '<input type="radio" name="products" value="' + value['product_id'] + '" >';
						html += '<img src="' + value['image'] + '"';
						html += 'title="' + value["name"] + '"';
						html += 'alt="' + value["name"] + '"';
						html += 'class="img-responsive center-block"/>';
						html += '</div>';
					html += '</div>';
				});
				html += '</div>';
				type_product_box.append(html);
				$("#carousel").owlCarousel();
			}

			function ajaxOpenCategory(id, type) {
			//	alert('id=' + id + '&type=' + type);
				$.ajax({
					url: 'index.php?route=calculator/calculator/ajax',
					dataType: 'json',
					data: 'id=' + id + '&type=' + type,
					type: 'post',
					beforeSend: function () {
					},
					success: function (json) {
						var html = '';

						var type = json['type'];
						if (type.localeCompare("categories") == 0) {
							html = ajaxRenderCategories(json['data']);
						}
						if (type.localeCompare("products") == 0) {
							html = ajaxRenderProducts(json['data']);
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