<?php echo $header; ?>
<div class="container container-fix " id="special">
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
			<div class="text_box special description-up"><?php echo $description; ?></div>
			<h2 class="line-red font-size-30 font-type-georgia grand-text" id="special-text">Акции</h2>
			<div id="image-box">
				<div class="row" style="margin-bottom: 47px;">
					<div class="col-lg-6">
						<div class="image" id="one"></div>
					</div>
					<div class="col-lg-6">
						<div class="image" id="two"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="image" id="three"></div>
					</div>
					<div class="col-lg-6">
						<div class="image" id="four"></div>
					</div>
				</div>

			</div>

			<h2 class="line-red font-size-30 font-type-georgia grand-text" id="">Распродажа %</h2>
			<div id="product-box">
				<?php foreach ($products_discounts as $product) { ?>
				<div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
					<div class="product-thumb">
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

						<p class="font-size-16 font-type-verdana dark name"><?php echo $product['name']; ?></p>
						<?php if ($product['price']) { ?>
						<?php if (!$product['special']) { ?>
						<p class="price dark font-size-18 font-type-verdana font-bold font-italic" style="text-align: left;"><?php echo trim($product['price']); ?></p>
						<?php } else { ?>
						<p class="price dark font-size-18 font-type-verdana font-bold font-italic" style="text-align: left;"><span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span></p>
						<?php } ?>
						<?php } ?>

						<button type="button" class="btn pull-left btn-danger" onClick='location.href="<?php echo $product['href']; ?>"'><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_more_info_cart; ?></span></button>
					</div>
				</div>
				<?php } ?>
			</div>

			<h2 class="line-red font-size-30 font-type-georgia grand-text" id="">Хиты продаж</h2>
			<div id="product-box">
				<?php foreach ($products_discounts as $product) { ?>
				<div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
					<div class="product-thumb">
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

						<p class="font-size-16 font-type-verdana dark name"><?php echo $product['name']; ?></p>
						<?php if ($product['price']) { ?>
						<?php if (!$product['special']) { ?>
						<p class="price dark font-size-18 font-type-verdana font-bold font-italic" style="text-align: left;"><?php echo trim($product['price']); ?></p>
						<?php } else { ?>
						<p class="price dark font-size-18 font-type-verdana font-bold font-italic" style="text-align: left;"><span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span></p>
						<?php } ?>
						<?php } ?>

						<button type="button" class="btn pull-left btn-danger" onClick='location.href="<?php echo $product['href']; ?>"'><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_more_info_cart; ?></span></button>
					</div>
				</div>
				<?php } ?>
			</div>



		<?php echo $content_bottom; ?>
		<?php echo $column_right; ?>
		</div>
	</div>
</div>
	<?php echo $footer; ?>
