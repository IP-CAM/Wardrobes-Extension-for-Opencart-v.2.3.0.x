<div class="product-thumb item">
	<div class="image"><a href="<?php echo $product_reference; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $name; ?>" title="<?php echo $name; ?>" class="img-responsive" /></a></div>

	<p class="font-size-16 font-type-verdana dark name"><?php echo $name; ?></p>
	<?php if ($price) { ?>
		<p class="price dark font-size-18 font-type-verdana font-bold font-italic"><?php echo trim($price); ?>₽</p>
	<?php } ?>
	<?php if ($special) { ?>
		<p class="price dark font-size-18 font-type-verdana font-bold font-italic"><span class="price-new"><?php echo $special; ?></span> <span class="price-old"><?php echo $price; ?></span></p>
	<?php } ?>

	<button type="button" class="button-style-1 button-product-for-style-1" onClick='location.href="<?php echo $product_reference; ?>"'><?php echo $button_text; ?></button>

</div>