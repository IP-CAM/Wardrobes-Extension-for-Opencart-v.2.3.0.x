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
		<div class="row"><?php echo $column_left; ?>
			<?php if ($column_left && $column_right) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } elseif ($column_left || $column_right) { ?>
			<?php $class = 'col-sm-9'; ?>
			<?php } else { ?>
			<?php $class = 'col-sm-12'; ?>
			<?php } ?>
			<div id="content" class="<?php echo $class; ?> generalcatalog_image_box"><?php echo $content_top; ?>
				<div class="row row-big">
					<div class="col-lg-4">
						<?php echo $box_images_html['radius']; ?>
					</div>
					<div class="col-lg-4">
						<?php echo $box_images_html['standard']; ?>
					</div>
					<div class="col-lg-4">
						<?php echo $box_images_html['built_in']; ?>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<?php echo $box_images_html['corner']; ?>
					</div>
					<div class="col-lg-4">
						<?php echo $box_images_html['our_work']; ?>
					</div>
					<div class="col-lg-4">
						<div class="row">
							<div class="col-lg-12 col-min">
								<?php echo $box_images_html['hallway']; ?>
							</div>
							<div class="col-lg-12">
								<?php echo $box_images_html['dressing_room']; ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row font-size-18"><?php echo $description; ?></div>
	</div>
	<div class="row hidden-lg generalcatalog_image_box mobile-box">

		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
		</div>



		<div class="col-xs-12">
			<div class="row">
				<div class="col-xs-6 col-hh-6">
					<?php echo $box_images_mobile_html['standard']; ?>
				</div>
				<div class="col-xs-6 col-hh-5">
					<div class="row">
						<div class="col-xs-12">
							<?php echo $box_images_mobile_html['built_in']; ?>
						</div>
						<div class="col-xs-12">
							<?php echo $box_images_mobile_html['corner']; ?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<?php echo $box_images_mobile_html['our_work']; ?>
		</div>
		<div class="col-xs-12">
			<div class="row">
				<div class="col-xs-6 col-hh-6">
					<?php echo $box_images_mobile_html['radius']; ?>
				</div>
				<div class="col-xs-6 col-hh-5">
					<div class="row">
						<div class="col-xs-12">
							<?php echo $box_images_mobile_html['hallway']; ?>
						</div>
						<div class="col-xs-12">
							<?php echo $box_images_mobile_html['dressing_room']; ?>
						</div>
					</div>
				</div>
			</div>
		</div>







	</div>

	<div><?php echo $content_bottom; ?></div>
	<div><?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
