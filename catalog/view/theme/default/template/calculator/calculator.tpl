<?php echo $header; ?>
<div class="container container-fix " id="calculator">
	<!-- MODAL WINDOW BEGIN -->
	<div class="overlay modal_window_box" style="display: none" title="окно"></div>
	<div class="popup modal_window_box" style="display: none">
		<div class="close_window">x</div>
	</div>
	<!-- MODAL WINDOW BEGIN END -->
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
			<input type="hidden" name="product_id" data-modal="1" value="" />
			<h1 class="text-center">Выбирете модель</h1>
			<div class="row" id="product_box">
			</div>
			<!-- PRODUCTS END -->
			<!-- CALCULATOR BEGIN -->
			<h1 class="text-center">Подберите размеры для изделия</h1>

				<input type="hidden" name="type" data-modal="1" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
				<input type="hidden" name="two_modal" data-modal="1" value="0" />
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
									<input id="slider_width" name="width_slider" data-modal="1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
									<p>Ширина (см)</p>
								</div>

								<span id="width">Высота: 240см</span>
								<span id="height">Глубина: 60см </span>
								<span id="settings">Расширенные настройки </span>
							</div>
							<div id="exclusive-box">

								<span id="text-width">Ширина (см)</span>
								<input type="text" name="width" id="input_width" data-modal="1" value="" class="form-control">
								<span id="text-height">Высота (см)</span>
								<input type="text" name="height" id="input_height" data-modal="1" value="" class="form-control">
								<span id="text-depth">Глубина (см)</span>
								<input type="text" name="depth" id="input_depth" data-modal="1" value="" class="form-control">


							</div>
							<h2 id="cal_top_price">25 000 рублей</h2>
							<span id="cal_sub_price">25 000 рублей</span>

							<input type="button" id="calculation_button" data-modal="1" class="btn btn-lg btn_calculator" value="Заказать"/>
						</div>
					</div>


					<div id="cal-dispatch-box" class="col-lg-6 no-padding">
						<div class="calculator_dispatch">
							<input type="text" name="telephone" data-modal="1" value="" placeholder="+7 (984) 174 75 12" class="input-medium bfh-phone">
							<input type="button"  id="dispatch_button" data-modal="1" value="Отправить" class="btn btn-lg btn_calculator" />
							<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
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
</div>
	<?php echo $footer; ?>



	<script type="text/javascript">



		$(document).ready(function () {
			var standard_text = 'стандарт';
			var exclusive_text = 'эксклюзив';


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

			//Validation telephone

			$('#calculation_button').click(function () {
				if($('#standard-box').is(':visible')) {
					$("[name='type']").val(0);
				}
				if($('#exclusive-box').is(':visible')) {
					$("[name='type']").val(1);
				}
				$("[name='two_modal']").val(1);
				ajaxClientCall();
			});

			$('#dispatch_button').click(function (event) {
				var text = $("[name='telephone']").val();
alert('dis');
				if ((text.indexOf("_") != -1) || text == '') {
					$('.calculator_dispatch .error').show();
					return false;
				} else {
					$("[name='type']").val(2);
					alert('модальное окно не нужно');
					$("[name='two_modal']").val(0);
					$('.calculator_dispatch .error').hide();
					ajaxClientCall();
				}
			});


//			$('#calculation_button').hover(function () {
//				$.fancybox.open('<div class="message">Здесь может быть любой ваш контент</div>');
//			});
		});



	</script>