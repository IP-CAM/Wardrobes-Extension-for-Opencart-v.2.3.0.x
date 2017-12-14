<?php echo $header; ?>
<div class="container">
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
			<!-- TYPE OF FURNITURE BEGIN -->
			<h1 class="text-center">Выбирете тип мебели</h1>

			<div class="row">
				<div class="col-sm-2">
				</div>
				<?php foreach($categories_root as $category_root) { ?>
				<div class="col-sm-2">
					<div class="sir_box" name="59">
						<img src="<?php echo $category_root['image']; ?>"
							 title="<?php echo $category_root['name']; ?>"
							 alt="<?php echo $category_root['name']; ?>"
							 class="img-responsive center-block"/>
					</div>
				</div>
				<?php } ?>

				<div class="col-sm-2">

				</div>
			</div>
			<!-- TYPE OF FURNITURE END -->
			<h1 class="text-center" id="text_type_sub">Выбирете тип шкафа</h1>

			<div class="row" id="type_sub_box">
			</div>
			<div class="row" id="type_product_box">
			</div>


			<!-- CONTENT END -->
			<?php echo $column_right; ?></div>
	</div>
	<?php echo $footer; ?>

	<script type="text/javascript">


		$(document).ready(function () {

			$(document).on('click', '.dynamic_category', category_open);
			function category_open() {
				//alert('name');
				var name = $(this).attr('name');
				ajaxOpenCategory(name);
			}

			$('.sir_box').click(function () {
				var name = $(this).attr('name');
				ajaxOpenCategory(name);
			});

			function ajaxRenderCategories(data) {
				var type_sub_box = $('#type_sub_box');
				type_sub_box.empty();
				var html = '';

				$.each(data, function (index, value) {
					html = html + '<div class="col-sm-3 dynamic_category" name="' + value['category_id'] + '"> ' +
					'<img src="' + value["image"] +
					'" title="' + value["name"] +
					'" alt="' + value["name"] +
					'" class="img-responsive center-block"/>' +
					'</div>';
				});

				type_sub_box.append(html);
			}

			function ajaxRenderProducts(data) {
				var type_product_box = $('#type_product_box');
				type_product_box.empty();
				var html = '';
				$.each(data, function (index, value) {
					html = html + '<div class="col-sm-3" name="product_id_' + value['product_id'] + '"> ' +
					'<img src="' + value["image"] +
					'" title="' + value["name"] +
					'" alt="' + value["name"] +
					'" class="img-responsive center-block"/>' +
					'</div>';
				});
				type_product_box.append(html);
			}

			function ajaxOpenCategory(id) {
				$.ajax({
					url: 'index.php?route=calculator/calculator/ajax',
					dataType: 'json',
					data: 'type=' + id,
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