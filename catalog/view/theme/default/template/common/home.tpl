<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" id="modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>
<!-- MODAL WINDOW BEGIN END -->


<?php echo $header; ?>
<div class="container visible-lg" id="home">
	<div class="row">
		<div class="col-lg-12">
			<div class="top-banner">
				<h1 class="font-type-georgia">Изготавливаем шкафы-купе на заказ</h1>
				<p class="font-type-georgia">по индивидуальным размерам</p>
				<a class="button-style-1 button" href="<?php echo $generalcatalog; ?>">Перейти к каталогу</a>
			</div>
		</div>

	</div>
	<!-- TILE BANNER BEGIN -->
	<div class="row tile_banner">
		<div class="col-lg-12">
			<div class="root-box-flex">
				<div class="root-sub-box-flex left-tile">
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html['standard']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html['radius']; ?>
					</div>
				</div>
				<div class="root-sub-box-flex center-tile">
					<?php echo $box_images_html['calculator']; ?>
				</div>
				<div class="root-sub-box-flex right-tile">
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html['built_in']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html['dressing_room']; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- TILE BANNER END -->

	<!-- BESTSELLLER -->
	<div class="row bestseller">
		<?php echo $content_top; ?>
	</div>

	<div class="row">
		<div class="col-lg-12 text-right">
			<a class="link-generalcatalog font-type-georgia" href="<?php echo $generalcatalog; ?>">Весь каталог<span></span></a>
		</div>
	</div>

	<!-- COMMENTS BEGIN -->
	<div class="row review">
		<div class="col-lg-12">
			<h2>Отзывы клиентов</h2>
		</div>
		<div class="col-lg-12 ">
			<div>
				<div id="carousel" class="owl-carousel owl-theme review-box" name="review">
					<?php foreach($comments as $comment) { ?>
					<div class="review-box border-gray">
						<div class="review-left">

							<img src="<?php echo $comment['path_image']; ?>"
								 title="<?php echo $comment['title']; ?>"
								 alt="<?php echo $comment['alt']; ?>"
								 class="comments_image"/>
							<h3 class="font-type-georgia"><?php echo $comment['name']; ?></h3>
							<?php if(isset($comment['reference'])) { ?>
							<!--noindex-->

							<a href="<?php echo $comment['reference']['link']; ?>">
								<img src="<?php echo $comment['reference']['image_path']; ?>"
									 title="<?php echo $comment['reference']['name']; ?>"
									 alt="<?php echo $comment['reference']['name']; ?>"
									 class=""/>
							</a>

							<!--/noindex-->
							<?php } ?>
						</div>
						<p class="review-right text-left"><?php echo $comment['text']; ?></p>
						<!--<a class="link-review pull-right font-size-18 font-underline font-type-georgia" style="padding-top: 15px;margin-right: 12px;" href="<?php echo $link_review; ?>">Читать далее</a> -->
					</div>
					<?php } ?>
				</div>

			</div>
		</div>
	</div>
	<!-- COMMENTS END -->
	<!-- DOWN BANNERS -->
	<div class="row">
		<div class="col-lg-12">
				<span class="down-banner" name="home_button" data-modal="1"></span>
		</div>

	</div>
	<!-- DOWN BANNERS END -->


	<!-- OUR PARTNERS  BEGIN-->
	<div class="row partner">
		<div class="col-lg-12">
			<h2>Наши партнёры</h2>
		</div>
		<div class="col-lg-12">
			<div class="partner-box-image">
				<img src="../catalog/view/theme/default/image/home-partner-1.png">
				<img src="../catalog/view/theme/default/image/home-partner-2.png">
				<img src="../catalog/view/theme/default/image/home-partner-3.png">
				<img src="../catalog/view/theme/default/image/home-partner-4.png">
			</div>
		</div>


	</div>
	<!-- OUR PARTNERS  END-->

</div>



<!-- FOR MOBILE -->
<div class="container  hidden-lg mobile-box" id="home">
	<div class="row">
		<div class="col-xs-12">
			<div class="top-banner">
				<h1 class="font-type-georgia">Изготавливаем шкафы-купе на заказ</h1>
				<p class="font-type-georgia">по индивидуальным размерам</p>
				<a class="button-style-1 button" href="<?php echo $generalcatalog; ?>">Перейти к каталогу</a>
			</div>
		</div>

	</div>
	<!-- TILE BANNER BEGIN -->
	<div class="row tile_banner">
		<div class="col-xs-12">
			<div class="root-box-flex">
				<div class="root-sub-box-flex left-tile">
					<?php echo $box_images_html_mobile['calculator']; ?>
				</div>
				<div class="root-sub-box-flex right-tile">
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['standard']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['radius']; ?>
					</div>
				</div>
			</div>
			<div class="root-box-flex down-root-box-flex">
				<div class="root-sub-box-flex left-tile">
					<?php echo $box_images_html_mobile['built_in']; ?>
				</div>
				<div class="root-sub-box-flex right-tile">
					<?php echo $box_images_html_mobile['dressing_room']; ?>
				</div>
			</div>
		</div>
	</div>
	<!-- TILE BANNER END -->

	<!-- BESTSELLLER -->
	<div class="row bestseller">
		<?php echo $content_top; ?>
	</div>
	<!-- BESTSELLLER END-->
	<!-- COMMENTS BEGIN -->
	<div class="row review">
		<div class="col-xs-12">
			<h2 class="line-red font-type-georgia">Отзывы наших клиентов</h2>
		</div>
		<div class="col-xs-12 ">
			<div>
				<div id="carousel" class="owl-carousel owl-theme review-box" name="review">
					<?php foreach($comments as $comment) { ?>
					<div class="review-box border-gray">


							<img src="<?php echo $comment['path_image']; ?>"
								 title="<?php echo $comment['title']; ?>"
								 alt="<?php echo $comment['alt']; ?>"
								 class="comments_image"/>
							<h3 class="font-type-georgia"><?php echo $comment['name']; ?></h3>
							<?php if(isset($comment['reference'])) { ?>
							<!--noindex-->

							<a href="<?php echo $comment['reference']['link']; ?>">
								<img src="<?php echo $comment['reference']['image_path']; ?>"
									 title="<?php echo $comment['reference']['name']; ?>"
									 alt="<?php echo $comment['reference']['name']; ?>"
									 class=""/>
							</a>

							<!--/noindex-->
							<?php } ?>

							<p class="review-right text-left"><?php echo $comment['text']; ?></p>
						<!--<a class="link-review pull-right font-size-18 font-underline font-type-georgia" style="padding-top: 15px;margin-right: 12px;" href="<?php echo $link_review; ?>">Читать далее</a> -->
					</div>
					<?php } ?>
				</div>

			</div>
		</div>
	</div>
	<!-- COMMENTS END -->
	<!-- DOWN BANNERS -->
	<div class="row">
		<div class="col-xs-12">
			<span class="down-banner" name="home_button" data-modal="1"></span>
		</div>

	</div>
	<!-- DOWN BANNERS END -->
	<!-- OUR PARTNERS  BEGIN-->
	<div class="row partner">
		<div class="col-xs-12">
			<h2 class="line-red font-type-georgia">Наши партнёры</h2>
		</div>
		<div class="col-xs-12">
			<div class="partner-box-image">
				<img src="../catalog/view/theme/default/image/home-partner-1.png">
				<img src="../catalog/view/theme/default/image/home-partner-2.png">
				<img src="../catalog/view/theme/default/image/home-partner-3.png">
				<img src="../catalog/view/theme/default/image/home-partner-4.png">
			</div>
		</div>


	</div>
	<!-- OUR PARTNERS  END-->


</div>


<?php echo $footer; ?>