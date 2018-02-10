<?php echo $header; ?>

<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" id="modal_window_box" style="display: none">
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

	<div class="row row-base">
		<div class="col-lg-12">

			<!-- CONTENT BEGIN -->
			<div class="row block-padding-min">
				<div class="col-lg-12">
						<h1 class="text-center">Шкафы-купе по индивидуальному проекту</h1>
						<p>Для расчёта примерной цены будущего изделия воспользуйтесь нашим онлайн-калькулятором цены, следуя инструкциям ниже.</p>
				</div>
			</div>
			<!-- CONTENT END -->

			<!-- TYPE OF FURNITURE BEGIN -->
			<h2 class="text-center">Выберите тип мебели</h2>

			<div class="row">
				<div class="col-lg-9 box_root">
					<div class="row">
						<?php foreach($categories_root as $category_root) { ?>
						<div class="col-lg-3 col-lg-mod">
							<div class="box_root_item box border-gray no-active" data-category_id_root="<?php echo $category_root['category_id'] ?>">
								<div class="category_check"><div class="checkmark"></div></div>
								<img src="<?php echo $category_root['image']; ?>"
									 title="<?php echo $category_root['name']; ?>"
									 alt="<?php echo $category_root['name']; ?>"
									 class="img-responsive center-block"/>
								<p class="no-active">
									<?php if($category_root['category_id'] == 59) { ?>
										Шкафы - Купе <br>на заказ
									<?php } else { ?>
										<?php echo $category_root['name']; ?>
									<?php } ?>
								</p>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
			</div>



			<!-- CALCULATOR BEGIN -->


			<input type="hidden" name="type" data-modal="1" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
			<input type="hidden" name="two_modal" data-modal="1" value="0" />
			<input type="hidden" name="root_check" value="0" />
			<div class="row" id="calculator-box">

					<div id="cal-calculation-box" class="col-lg-6 no-padding margin-left">
						<h2 class="text-center text-calculator-size">Подберите размеры для изделия</h2>
						<div class="slider-1">
							<div name="slider-range-1">
								<div class="custom-handle custom-handle-1 ui-slider-handle"><span class="value-output"></span>
								</div>
							</div>
							<p>Ширина (см)</p>
						</div>
						<div class="slider-2" hidden="hidden">
							<div name="slider-range-2">
								<div class="custom-handle custom-handle-2 ui-slider-handle"><span class="value-output"></span>
								</div>
							</div>
							<p>Глубина (см)</p>
						</div>
						<span id="height" name="height" class="textillate-demo">Высота: 240см</span>
						<span id="depth" name="depth">Глубина: 60см </span>

						<div class="price"><h2 class="textillate-demo  font-type-verdana" name="price">При включенном JS тут отображается цена</h2><span> pублей</span></div>
						<input type="button"
							   name="calculation_button"
							   data-modal="1"
							   class="calculation-button button-style-1"
							   value="Заказать расчёт"/>
					</div>
					<div id="cal-dispatch-box" class="col-lg-6 no-padding">
						<div class="text-1">Не знаете размеров?</div>
						<div class="text-2">Отправьте нам свой номер телефона и мы поможем</div>
						<div class="calculator_dispatch">
							<input type="text" name="telephone" data-modal="1" value="" placeholder="Введите свой номер" class="input-medium bfh-phone font-size-12">
							<input type="button"
								   name="dispatch-button"
								   data-modal="1"
								   value="Отправить"
								   class="button-style-1" />
							<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
						</div>
					</div>

				</div>

			<!-- CALCULATOR END -->
			<!-- BANNER BEGIN -->
			<div class="row block-padding-min">
				<div class="col-lg-12 text-center" name="banner" id="banner">
				</div>
			</div>
			<!-- BANNER END -->
			<!-- CONTENT BEGIN -->
			<div class="row block-padding-min text-description">
				<div class="col-sm-12">
						<?php echo $description; ?>
				</div>
			</div>
			<!-- CONTENT END -->
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
					<div class="box_root_item box  no-active border-gray" data-category_id_root="<?php echo $category_root['category_id'] ?>">
						<div class="category_check"><div class="checkmark"></div></div>
						<img src="<?php echo $category_root['image']; ?>"
							 title="<?php echo $category_root['name']; ?>"
							 alt="<?php echo $category_root['name']; ?>"
							 class="img-responsive center-block"/>
						<p class="no-active">
							<?php if($category_root['category_id'] == 59) { ?>
							Шкафы - Купе <br> на заказ
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

		<!-- CALCULATOR BEGIN -->
		<div class="col-xs-12">
			<h2 class="text-center" name="type-products" hidden="hidden">Подберите размеры для изделия</h2>
		</div>

		<input type="hidden" name="type" data-modal="2" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
		<input type="hidden" name="two_modal" data-modal="2" value="0" />
		<input type="hidden" name="root_check" value="0" />
		<div class="col-xs-12" id="calculator-box">

			<div id="cal-calculation-box" class="col-lg-6 no-padding margin-left">
				<h2 class="text-center text-calculator-size">Подберите размеры для изделия</h2>

				<div class="slider-1">
					<div class="width-mobile-box"><p>Ширина (см)  </p> <span name="width_mobile"></span></div>
					<div name="slider-range-1">
					</div>
				</div>
				<div class="slider-2" hidden="hidden">
					<div class="depth-mobile-box"><p>Глубина (см)  </p> <span name="depth_mobile"></span></div>
					<div name="slider-range-2">
					</div>
				</div>
				<div class="mobile-box-size">
					<span id="height" name="height">Высота: 240см</span>
					<span id="depth" name="depth">Глубина: 60см </span>
				</div>

				<div class="price"><h2 class="textillate-demo  font-type-verdana" name="price">При включенном JS тут отображается цена</h2><span> pублей</span></div>
				<input type="button"
					   name="calculation_button"
					   data-modal="1"
					   class="block calculation-button button-style-1"
					   value="Заказать расчёт"/>
			</div>

			<div id="cal-dispatch-box" class="col-lg-12">
				<div class="text-1">Не знаете размеров?</div>
				<div class="text-2">Отправьте нам свой номер телефона и мы поможем</div>
				<div class="calculator_dispatch">
					<div>
						<input type="text" name="telephone" data-modal="2" value="" placeholder="Введите свой номер" class="input-medium bfh-phone font-size-12">
						<input type="button"
							   name="dispatch-button"
							   data-modal="2"
							   value="Отправить"
							   class="button-style-1" />
					</div>
					<div class="error-box">
						<p class="error" data-modal="2" hidden="hidden">Пожалуйста, введите телефон</p>
					</div>
				</div>
			</div>

		</div>


		<!-- CALCULATOR END -->
		<!-- BANNER BEGIN -->

		<div class="col-xs-12 text-center" name="banner" id="banner-mobile">

		</div>

		<!-- BANNER END -->
		<!-- CONTENT END -->

	</div>
</div>
	<?php echo $footer; ?>
<script>
	var price_for_1m_na_zakaz = <?php echo $price_for_1m_na_zakaz; ?>;
	var price_for_1m_standard = <?php echo $price_for_1m_standard; ?>;
	var price_for_1m_garderob = <?php echo $price_for_1m_garderob; ?>;
	var price_for_1m_prihogie = <?php echo $price_for_1m_prihogie; ?>;
	var price_for_1m_doors = <?php echo $price_for_1m_doors; ?>;
</script>
