<?php echo $header; ?>
<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>





<!-- MODAL WINDOW BEGIN END -->
<div class="container container-fix " id="calculator">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
		<?php if(!next($breadcrumbs)) { ?>
		<li class="breadcrumb_last"><a class="red" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
			<h1 class="text-center">Выберите тип мебели</h1>

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
									<div id="slider-range"></div>
									<div class="slider"></div>
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


							</div>
							<h2 id="cal_top_price">8400 рублей</h2>
							<span id="cal_sub_price">15100 рублей</span>

							<input type="button" id="calculation_button" data-modal="1" class="button-style-1" value="Заказать"/>
						</div>
					</div>


					<div id="cal-dispatch-box" class="col-lg-6 no-padding">
						<div class="calculator_dispatch">
							<input type="text" name="telephone" data-modal="1" value="" placeholder="+7 (984) 174 75 12" class="input-medium bfh-phone">
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
	<?php echo $footer; ?>



	<script type="text/javascript">



		$(document).ready(function () {
			var standard_text = 'стандарт';
			var exclusive_text = 'эксклюзив';

			$('#exclusive-box').hide();
			$('#standard p').addClass('active-button');
			$('#cal_sub_price').text(exclusive_text + ' ' + $('#cal_sub_price').text());
			$('.calculator_dispatch .error').hide();


			$(function() {
				var isResizeble = false;
				$( "#slider-range" ).slider({
					min: 100,
					max: 400,
					slide: function( event, ui ) {
						if(!isResizeble) {
							$('.ui-slider-handle.ui-corner-all.ui-state-default').before('<div class="number" style="position: relative; top: -24px;     margin-left: -9px;"></div>');
							isResizeble = true;
						} else {
							var val = $('.ui-slider-handle').css('left');
							$('.number').css('left', val);
							//$('.number').css('top)
						}
						$('.number').text(ui.value);
						$( "#input_width" ).val(ui.value);
						activeStandard();
					},
					change: function( event, ui ) {
						var val = $('.ui-slider-handle').css('left');
						$('.number').css('left', val);
					}
				});

			} );

			$('#standard').click(function () {
				//$(this).append($('#calculator_active_img'));
				$('#exclusive-box').hide();
				$('#standard-box').show();
				$('#standard p').addClass('active-button');
				$('#exclusive p').removeClass('active-button');
				var text = $('#cal_sub_price').text();
				text = text.replace(standard_text, exclusive_text);
				$('#cal_sub_price').text(text);
				$("[name='type']").val(0);


				$('#input_height').val('240');
				$('#input_depth').val('60');

				activeStandard()
			});
			$('#exclusive').click(function () {
				$('#exclusive-box').show();
				$('#standard-box').hide();
				$('#exclusive p').addClass('active-button');
				$('#standard p').removeClass('active-button');
				var text = $('#cal_sub_price').text();
				text = text.replace(exclusive_text, standard_text);
				$('#cal_sub_price').text(text);
				$("[name='type']").val(1);
				activeExclusive();
			});






			//Validation telephone

			$('#calculation_button, #banner').click(function () {
				if($('#standard-box').is(':visible')) {
					var price = 'price='+$('#cal_top_price').text();
					ajaxClientCall(1,0,1, price);
					//alert('1,0,1');
				}
				if($('#exclusive-box').is(':visible')) {
					var price = 'price='+$('#cal_top_price').text();
					ajaxClientCall(1,1,1, price);
					//alert('1,1,1');
				}
				$("[name='two_modal']").val(1);

			});
			$('#dispatch_button').click(function (event) {
				var text = $("[name='telephone']").val();
				if (text == '') {
					$('.calculator_dispatch .error').show();
					return false;
				} else {
					$('.calculator_dispatch .error').hide();
					ajaxClientCall(1,2,0);
				}
			});


			var input_size = $('#input_width, #input_height, #input_depth');
			input_size.keypress(function() {
				activeExclusive();
			});
			input_size.change(function() {
				activeExclusive();
			});
			input_size.keydown(function() {
				activeExclusive();
			});
			input_size.keyup(function() {
				activeExclusive();
			});


			function activeExclusive() {
				$( "#cal_top_price" ).text(calcExclusive() + ' рублей');
				$('#cal_sub_price').text(standard_text + ' ' + calcStandard($('.number').text()) + ' рублей');
			}
			function activeStandard() {
				$( "#cal_top_price" ).text(Math.round(calcStandard($('.number').text())) + ' рублей' );
				$('#cal_sub_price').text(exclusive_text + ' ' + calcExclusive() + ' рублей');
			}

			function calcStandard(value) {
				var price = 0;
				if(value < 111) {
					var value_norm = value - 100;
					if(value_norm < 0) { value_norm = 0}
					price = 8400 + (value_norm *  505);
				} else {
					var value_norm = value - 110;
					price = 13450 + (value_norm *  143.8);
				}
				return Math.round(price);
			}

			function calcExclusive() {
				var width = $('#input_width').val();
				var height = $('#input_height').val();
				var depth = $('#input_depth').val();
				if(width != "" && height != "" && depth != "") {
					var height_rep_1 = 100;
					var height_rep_2 = 150;
					var height_rep_3 = 273;
					var height_sum = 0;
					if(height<height_rep_1) {
						height_sum = 10000;
					} else if(height<height_rep_2) {
						height_sum = 12200;
					} else  {
						height_sum = 15100;
					}

					var width_sum = (height_sum*width)/100;
					var depth_sum= 0;
					var reper_depth = 61;
					if(depth <reper_depth) {
						depth_sum = 0;
					} else {
						depth_sum = (depth - reper_depth) * 1100;
					}
					var sum = width_sum + depth_sum;
					if(height > height_rep_3) {
						sum = sum*1.30;
					}
					return Math.round(sum);

				}
				return -1;
			}
		});




	</script>