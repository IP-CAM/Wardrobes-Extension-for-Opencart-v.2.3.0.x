<?php echo $header; ?>
<div class="container  visible-lg" id="special">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
			<?php if(!next($breadcrumbs)) { ?>
				<li class="breadcrumb_last"><span class="red">Акции</span></li>
				<?php continue; ?>
			<?php } ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row row-base">

			<div class="text_box special text-description"><?php echo $description; ?></div>
			<h2 class="line-red font-size-30 font-type-georgia grand-text" id="special-text">Акции</h2>
			<div id="image-box">
				<div class="row-image">
					<div class="image" id="one"></div>
					<div class="image" id="two"></div>
				</div>
				<div class="row-image">
					<div class="image" id="three"></div>
					<div class="image" id="four"></div>
				</div>

			</div>

			<h2 class="line-red font-size-30 font-type-georgia grand-text">Распродажа %</h2>
			<div class="product-box">
				<?php foreach ($sale_products as $product) { ?>
					<?php echo $product; ?>
				<?php } ?>
			</div>

			<h2 class="line-red font-size-30 font-type-georgia grand-text">Хиты продаж</h2>
			<div class="product-box">
				<?php foreach ($best_products as $product) { ?>
					<?php echo $product; ?>
				<?php } ?>
			</div>
	</div>
</div>

<!-- FOR MOBILE -->
<div class="container hidden-lg" id="special">
	<div class="row">
		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
		</div>
		<div class="col-xs-12">
			<p class="name-top-text font-type-georgia text-center">Акции и скидки на мебель компании “Центр-Мебели”</p>
		</div>

		<div class="special-plit">
			<div class="col-xs-12">
				<div class="image" id="one"></div>
			</div>
			<div class="col-xs-12">
				<div class="image" id="two"></div>
			</div>
			<div class="col-xs-12">
				<div class="image" id="four"></div>
			</div>
			<div class="col-xs-12">
				<div class="image" id="three"></div>
			</div>

		</div>
		<div class="col-xs-12" id="sale">
			<div>
				<h2 class="line-red font-size-18 font-type-georgia grand-text">Распродажа %</h2>
				<div id="carousel" class="product-box owl-carousel owl-theme" name="sale_product">
					<?php foreach ($sale_products as $product) { ?>
					<?php echo $product; ?>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>

	<?php echo $footer; ?>
