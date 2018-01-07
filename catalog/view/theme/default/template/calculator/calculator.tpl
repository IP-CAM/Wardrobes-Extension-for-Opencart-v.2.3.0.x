<?php echo $header; ?>
<input type="hidden" name="product_id" data-modal="1" value="" />
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
			<h1 class="text-center" id="type-wardrobes" hidden="hidden">Выбирете тип шкафа</h1>
			<div class="row text-center" id="sub_box">
			</div>
			<!-- SUBTYPE FURNITURE END -->

			<!-- PRODUCTS BEGIN -->

			<h1 class="text-center" id="type-products" hidden="hidden">Выбирете модель</h1>
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
	<?php echo $footer; ?>