<?php echo $header; ?>
<div class="container container-fix " id="generalcatalog">
	<div class="visible-lg">
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
			<?php if(!next($breadcrumbs)) { ?>
			<li class="breadcrumb_last"><span class="red"><?php echo $breadcrumb['text']; ?></span>
			</li>
			<?php continue; ?>
			<?php } ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		<div class="row row-base">
			<div class="col-lg-12 generalcatalog_image_box">
				<div class="row-big">
					<div>
						<?php echo $box_images_html['our_work']; ?>
					</div>
					<div>
						<?php echo $box_images_html['built_in']; ?>
					</div>
					<div>
						<?php echo $box_images_html['corner']; ?>
					</div>
				</div>
				<div class="row-big">
					<div class="">
						<div class="col-min">
							<?php echo $box_images_html['cabinet_cabinets']; ?>
						</div>
						<div class="">
							<?php echo $box_images_html['standard']; ?>
						</div>
					</div>
					<div class="">
						<div class="col-min">
							<?php echo $box_images_html['hallway']; ?>
						</div>
						<div class="">
							<?php echo $box_images_html['dressing_room']; ?>
						</div>
					</div>
					<div class="">
						<div class="col-min">
							<?php echo $box_images_html['radius']; ?>
						</div>
						<div class="">
							<?php echo $box_images_html['door_coupe']; ?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12 font-size-18 description  text-description">
					<?php echo $description; ?>
			</div>
		</div>

	</div>

	<!-- FOR MOBILE -->
	<div class="row hidden-lg generalcatalog generalcatalog_image_box mobile-box">

		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
		</div>
		<div class="col-xs-12 row-gencat">

				<?php echo $box_images_mobile_html['standard']; ?>

				<div class="row-gencat-sub">

					<?php echo $box_images_mobile_html['built_in']; ?>
					<?php echo $box_images_mobile_html['corner']; ?>

				</div>
		</div>
		<div class="col-xs-12 row-gencat-one">
			<?php echo $box_images_mobile_html['our_work']; ?>
		</div>
		<div class="col-xs-12 row-gencat">

			<?php echo $box_images_mobile_html['radius']; ?>

			<div class="row-gencat-sub">
				<?php echo $box_images_mobile_html['hallway']; ?>
				<?php echo $box_images_mobile_html['dressing_room']; ?>
			</div>
		</div>
		<div class="col-xs-12 row-gencat down">

			<?php echo $box_images_mobile_html['cabinet_cabinets']; ?>
			<?php echo $box_images_mobile_html['door_coupe']; ?>
		</div>

	</div>
</div>
<?php echo $footer; ?>
