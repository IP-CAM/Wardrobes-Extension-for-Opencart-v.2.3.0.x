<?php foreach ($products as $product) { ?>
<div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12" data-product_id=<?php echo $product['product_id']; ?> >
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

	  <button type="button" class="btn pull-left btn-danger" onClick='location.href="<?php echo $product['href']; ?>"'><span class="hidden-xs hidden-sm hidden-md">Подробнее</span></button>

  </div>
</div>
<?php } ?>
</div>

