<?php if(isset($best_products)) { ?>
<div class="col-lg-12 best-product">
	<h2 class="line-red font-size-30 font-type-georgia">Хиты продаж</h2>
	<div id="carousel" class="owl-carousel owl-theme" name="best_product">
		<?php foreach ($best_products as $best_product) { ?>
		<?php echo $best_product; ?>
		<?php } ?>
	</div>
</div>
<?php } ?>