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
						<div class="image-box">
							<img src="<?php echo $radius['path_image']; ?>"
								 title="<?php echo $radius['name']; ?>"
								 alt="<?php echo $radius['name']; ?>"
								 class="img-responsive center-block"/>
						</div>
						<div class="name-box text-center">
							<p><?php echo $radius['name']; ?></p>
						</div>
						<a class="reference" href="<?php echo $radius['href']; ?>"></a>
					</div>
					<div class="col-lg-4">
						<div class="image-box">
							<img src="<?php echo $standard['path_image']; ?>"
								 title="<?php echo $standard['name']; ?>"
								 alt="<?php echo $standard['name']; ?>"
								 class="img-responsive center-block"/>
						</div>
						<div class="name-box text-center">
							<p><?php echo $standard['name']; ?></p>
						</div>
						<a class="reference" href="<?php echo $standard['href']; ?>"></a>
					</div>
					<div class="col-lg-4">
						<div class="image-box">
							<img src="<?php echo $built_in['path_image']; ?>"
								 title="<?php echo $built_in['name']; ?>"
								 alt="<?php echo $built_in['name']; ?>"
								 class="img-responsive center-block"/>
						</div>
						<div class="name-box text-center">
							<p><?php echo $built_in['name']; ?></p>
						</div>
						<a class="reference" href="<?php echo $built_in['href']; ?>"></a>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="image-box">
							<img src="<?php echo $corner['path_image']; ?>"
								 title="<?php echo $corner['name']; ?>"
								 alt="<?php echo $corner['name']; ?>"
								 class="img-responsive center-block"/>
						</div>
						<div class="name-box text-center">
							<p><?php echo $corner['name']; ?></p>
						</div>
						<a class="reference" href="<?php echo $corner['href']; ?>"></a>
					</div>
					<div class="col-lg-4">
						<div class="image-box">
							<img src="<?php echo $our_work['path_image']; ?>"
								 title="<?php echo $our_work['name']; ?>"
								 alt="<?php echo $our_work['name']; ?>"
								 class="img-responsive center-block"/>
						</div>
						<div class="name-box text-center">
							<p><?php echo $our_work['name']; ?></p>
						</div>
						<a class="reference" href="<?php echo $our_work['href']; ?>"></a>
					</div>
					<div class="col-lg-4">
						<div class="row">
							<div class="col-lg-12 col-min">
								<div class="image-box">
									<img src="<?php echo $hallway['path_image']; ?>"
										 title="<?php echo $hallway['name']; ?>"
										 alt="<?php echo $hallway['name']; ?>"
										 class="img-responsive center-block"/>
								</div>
								<div class="name-box name-box-mini text-center">
									<p><?php echo $hallway['name']; ?></p>
								</div>
								<a class="reference" href="<?php echo $hallway['href']; ?>"></a>
							</div>
							<div class="col-lg-12">
								<div class="image-box">
									<img src="<?php echo $dressing_room['path_image']; ?>"
										 title="<?php echo $dressing_room['name']; ?>"
										 alt="<?php echo $dressing_room['name']; ?>"
										 class="img-responsive center-block"/>
								</div>
								<div class="name-box name-box-mini text-center">
									<p><?php echo $dressing_room['name']; ?></p>
								</div>
								<a class="reference" href="<?php echo $dressing_room['href']; ?>"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row font-size-18"><?php echo $description; ?></div>
	</div>
	<div class="hidden-lg generalcatalog_image_box mobile-box">

		<a href="<?php echo $referer_mobile; ?>" id="back" class="border-gray">Назад</a>
		<?php foreach($box_images_mobile as $key => $box_image_mobile) { ?>

			<div class="box-mobile" id="box-<?php echo ((int)$key + 1); ?>">
				<div class="image-box">
					<a class="reference-mobile" href="<?php echo $box_image_mobile['href']; ?>">
						<img src="<?php echo $box_image_mobile['path_image']; ?>"
						 title="<?php echo $box_image_mobile['name']; ?>"
						 alt="<?php echo $box_image_mobile['name']; ?>"
						 class="img-responsive center-block"/>
					</a>
				</div>
				<div class="name-box name-box-mobile text-center">
					<p class="font-type-georgia"><?php echo $box_image_mobile['name']; ?></p>
				</div>

			</div>

		<?php } ?>



	</div>

	<div><?php echo $content_bottom; ?></div>
	<div><?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
