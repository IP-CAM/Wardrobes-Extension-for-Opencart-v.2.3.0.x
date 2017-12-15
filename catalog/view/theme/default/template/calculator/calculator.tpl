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
				<div class="col-mg-12 col-lg-8 box_box_root">
					<div class="row">
						<?php foreach($categories_root as $category_root) { ?>
						<div class="col-lg-3">
							<div class="box_root box">
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
			<div class="row" id="subtype_furniture_box">
			</div>
			<!-- SUBTYPE FURNITURE END -->

			<!-- MODEL BEGIN -->
			<h1 class="text-center">Выбирете модель</h1>
			<div class="row" id="model_box">
			</div>
			<!-- MODEL END -->

			<!-- CONTENT END -->
			<?php echo $column_right; ?></div>
	</div>
	<?php echo $footer; ?>



	<script type="text/javascript">


		$(document).ready(function () {





			$(document).on('click', '.dynamic_category', category_open);
			function category_open() {
				//alert('name');
				var id = $(this).find('input:checkbox').val();
				ajaxOpenCategory(id, 'products');
			}

			$('.box_root').click(function () {
				var input = $(this).find("input");
				alert(input.attr('name'));
				input.prop('checked', true);

				//$('.box_box_root').filter(':checked').not(this).prop('checked', false);
				var id = $(this).find('input:checkbox').val();
				ajaxOpenCategory(id, 'categories');


			});
			$('.box_root input').change(function () {


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