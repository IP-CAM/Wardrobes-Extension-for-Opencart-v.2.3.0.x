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
			<div class="row block-padding-min" name="product_box">
			</div>
			<!-- PRODUCTS END -->
			<!-- CALCULATOR BEGIN -->
			<h2 class="text-center text-calculator-size">Подберите размеры для изделия</h2>

			<input type="hidden" name="type" data-modal="1" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
			<input type="hidden" name="two_modal" data-modal="1" value="0" />
			<div class="row" id="calculator-box">

					<div id="cal-calculation-box" class="col-lg-6 no-padding margin-left">
						<div id="button-check">
							<div id="quest-calculation"></div>
							<div id="standard" name="standard" title="Стандарт">
								<p>Стандарт</p>
							</div>
							<div class="line"></div>
							<div id="exclusive" name="exclusive" title="Эксклюзив">
								<p>Эксклюзив</p>
							</div>
						</div>
						<div class="calculation-standard-or-exclusive">
							<div name="standard-box" class="standard-box">
								<div id="slider">
									<div name="slider-range"></div>
									<p>Ширина (см)</p>
								</div>
								<span id="width">Высота: 240см</span>
								<span id="height">Глубина: 60см </span>
							</div>
							<div name="exclusive-box" class="exclusive-box">
								<span id="text-width">Ширина (см)</span>
								<input type="text" name="width" id="input_width" data-modal="1" value="100" class="form-control">
								<span id="text-height">Высота (см)</span>
								<input type="text" name="height" id="input_height" data-modal="1" value="240" class="form-control">
								<span id="text-depth">Глубина (см)</span>
								<input type="text" name="depth" id="input_depth" data-modal="1" value="60" class="form-control">
								<p class="size-min">Минимальные размеры: 100х100х100</p>
								<p class="size-max">Максимальные размеры: 200х100х100</p>
							</div>


							<h2 class="cal_top_price " name="cal_top_price">При включенном JS тут отображается цена</h2>
							<span class="cal_sub_price" name="cal_sub_price">При включенном JS тут отображается цена</span>
							<input type="button"
								   name="calculation_button"
								   data-modal="1"
								   class="calculation-button button-style-1"
								   value="Заказать"/>
						</div>
					</div>

					<div id="cal-dispatch-box" class="col-lg-6 no-padding">
						<div class="calculator_dispatch">
							<input type="text" name="telephone" data-modal="1" value="" placeholder="+7 (984) 174 75 12" class="input-medium bfh-phone font-size-12">
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
		<input type="hidden" name="product_id" data-modal="2" value="" />
		<div class="col-xs-12">
			<h2 class="text-center" name="type-products" hidden="hidden">Выбирете модель</h2>
		</div>
		<div class="col-xs-12 text-center product-root-box" >
			<div class="box-root-sub" name="product_box">

			</div>
		</div>
		<!-- PRODUCTS END -->

		<!-- CALCULATOR BEGIN -->
		<div class="col-xs-12">
			<h2 class="text-center" name="type-products" hidden="hidden">Подберите размеры для изделия</h2>
		</div>

		<input type="hidden" name="type" data-modal="2" value="0" /> <!-- 0 - standard, 1 - exclusive, 2 - telephone -->
		<input type="hidden" name="two_modal" data-modal="2" value="0" />
		<div class="col-xs-12" id="calculator-box">

			<div id="cal-calculation-box" class="col-xs-12 no-padding margin-left">
				<div class="row">
					<div class="col-xs-12 button-box">
						<div id="button-check">
							<div name="standard" id="standard" title="Стандарт">
								<p>Стандарт</p>
							</div>
							<div name="exclusive" id="exclusive" title="Эксклюзив">
								<p>Эксклюзив</p>
							</div>
						</div>
					</div>
					<div class="col-xs-12">
						<div class="calculation-standard-or-exclusive">

							<div name="standard-box" class="standard-box">
								<div class="block">
									<span>Ширина (см) </span><span name="width-text-mobile"></span>
								</div>
								<div class="block">
									<div id="slider">
										<div name="slider-range"></div>
									</div>
								</div>
								<div class="block">
									<span id="width">Высота: 240см</span>
									<span id="height">Глубина: 60см </span>
								</div>
							</div>

							<div name="exclusive-box" class="exclusive-box">
								<div class="size">
									<span>Ширина (см)</span>
									<input type="text" name="width" data-modal="2" value="100" class="form-control">
								</div>
								<div class="size">
									<span>Высота (см)</span>
									<input type="text" name="height" data-modal="2" value="240" class="form-control">
								</div>
								<div class="size">
									<span>Глубина (см)</span>
									<input type="text" name="depth" data-modal="2" value="60" class="form-control">
								</div>
								<div class="size">
									<p>Минимальные размеры: 100х100х100</p>
									<p>Максимальные размеры: 200х100х100</p>
								</div>
							</div>
							<div class="price">
								<span class="cal_sub_price " name="cal_sub_price">При включенном JS тут отображается цена</span>
								<h2 class="cal_top_price font-type-verdana" name="cal_top_price">При включенном JS тут отображается цена</h2>
								<input type="button"

									   name="calculation_button"
									   data-modal="2"
									   class="calculation-button button-style-1"
									   value="Заказать"/>
							</div>
						</div>
					</div>
				</div>


			</div>
			<div id="cal-dispatch-box" class="col-lg-12">
				<div class="calculator_dispatch">
					<input type="text" name="telephone" data-modal="2" value="" placeholder="+7 (984) 174 75 12" class="input-medium bfh-phone font-size-12">
					<input type="button"
						   name="dispatch-button"
						   data-modal="2"
						   value="Отправить"
						   class="button-style-1" />
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