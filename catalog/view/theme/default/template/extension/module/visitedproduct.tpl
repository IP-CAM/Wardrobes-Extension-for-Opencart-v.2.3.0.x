<?php if(isset($visitedproducts)) { ?>

	<div class="col-lg-12">
		<h2 class="line-red font-type-georgia" id="visitproduct-maiker"><?php echo $heading_title; ?></h2>
	</div>
	<div class="col-lg-12">
		<?php if(count($visitedproducts) > 4) { ?>
			<div id="carousel" class="owl-carousel owl-theme" name="visitedproduct">
		<?php } else { ?>
			<div class="no-owl-carousel">
		<?php } ?>
				<?php foreach ($visitedproducts as $visitedproduct) { ?>
					<?php echo $visitedproduct; ?>
				<?php } ?>
			</div>

	</div>


<?php } ?>
