<?php if(isset($products)) { ?>
<div class="col-lg-12" style="padding: 0; margin:0">
	<h2 class="line-red font-size-30 font-type-georgia" id="visitproduct-maiker"><?php echo $heading_title; ?></h2>
	<div id="carousel" class="carousel-control" data-ride="carousel">

		<?php foreach ($products as $product) { ?>
		<div class="product-layout carousel-product">
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

				<button type="button" class="button-style-1 button-product-for-style-1" onClick='location.href="<?php echo $product['href']; ?>"'><?php echo $button_more_info_cart; ?></button>

			</div>
		</div>
		<?php } ?>


	</div>
</div>
<?php } ?>
<script>



	$(document).ready(function () {
		if($("#carousel").length> 0) {
			$("#carousel").owlCarousel({
				interval: 500,
				navigation: true,
				items: 4,
				pagination:  false,
				navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
			});
		}

	});



</script>
