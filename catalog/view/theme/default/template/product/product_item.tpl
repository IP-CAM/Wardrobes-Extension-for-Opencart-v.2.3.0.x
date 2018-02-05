<div class="product-thumb item universal box-icon <?php if($discount || $new) { echo 'icon'; }?>">
	<?php if($discount) { ?>
		<div class="product-icon discount">Скидка <?php echo $discount; ?>%</div>
	<?php } ?>
	<?php if($new && !$discount) { ?>
		<div class="product-icon new">Новинка</div>
	<?php } ?>

	<div class="image"><a href="<?php echo $product_reference; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $name; ?>" title="<?php echo $name; ?>" class="img-responsive" /></a></div>

	<?php if($price_view && $price) { ?>
		<p class="font-type-verdana dark name"><?php echo $name; ?></p>
		<?php if ($discount) { ?>
			<p class="price-old"><?php echo trim($price_old); ?><span> ₽</span></p>
			<p class="price green"><?php echo trim($price); ?><span> ₽</span></p>
		<?php } else { ?>
			<p class="price"><?php echo trim($price); ?><span> ₽</span></p>
		<?php } ?>

	<?php } else { ?>
		<p class="name no-price font-type-verdana dark"><?php echo $name; ?></p> <!-- нет цены -->
	<?php } ?>
	<a class="button-style-1 button" href="<?php echo $product_reference; ?>"><?php echo $button_text; ?></a>

</div>