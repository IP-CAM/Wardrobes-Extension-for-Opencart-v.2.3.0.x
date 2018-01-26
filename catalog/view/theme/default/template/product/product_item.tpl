<div class="product-thumb item">
	<div class="image"><a href="<?php echo $product_reference; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $name; ?>" title="<?php echo $name; ?>" class="img-responsive" /></a></div>

	<p class="font-size-16 font-type-verdana dark name"><?php echo $name; ?></p>
	<?php if ($price) { ?>
		<p class="price font-type-verdana"><?php echo trim($price); ?><span> ₽</span></p>
	<?php } ?>
	<?php if ($special) { ?>
		<span class="price-new"><?php echo $special; ?></span>
	<?php } ?>

	<button type="button" class="button-style-1 button-product-for-style-1" onClick='location.href="<?php echo $product_reference; ?>"'><?php echo $button_text; ?></button>

</div>