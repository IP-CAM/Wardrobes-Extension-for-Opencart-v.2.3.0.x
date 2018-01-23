<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" id="modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>
<!-- MODAL WINDOW BEGIN END -->


<?php echo $header; ?>
<div class="container visible-lg" id="home">
	<div class="row">
		<div class="home-text-1 col-lg-12 text-center">
			<h1>Изготавливаем шкафы-купе на заказ</h1>
		</div>
		<div class="col-lg-12 text-center">
			<?php echo $content_top; ?>  <!-- carousel -->
		</div>
		<div class="home-text-2 col-lg-12 text-center">
			<h2>Популярные <a class="link-generalcatalog" href="<?php echo $generalcatalog; ?>">категории товаров</a></h2>
		</div>
	</div>
	<!-- TILE BANNER BEGIN -->
	<div class="row tile_banner row-norm">
		<div class="col-lg-12">
			<div class="root-box-flex">
				<div class="root-sub-box-flex">
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html['standard']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html['radius']; ?>
					</div>
				</div>
				<div class="root-sub-box-flex">
					<?php echo $box_images_html['calculator']; ?>
				</div>
				<div class="root-sub-box-flex">
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

	<!-- COMMENTS BEGIN -->
	<div class="row row-norm" id="home-review">
		<div class="home-text-3 col-lg-12 text-center">
			<h2>Отзывы наших клиентов</h2>
		</div>
		<div class="text-left col-lg-12 review">
			<?php foreach($comments as $comment) { ?>
			<div class="review-box border-gray">
				<div class="review-top">
					<div class="review-image">
						<img src="<?php echo $comment['path_image']; ?>"
							 title="<?php echo $comment['title']; ?>"
							 alt="<?php echo $comment['alt']; ?>"
							 class="comments_image img-responsive"/>
					</div>
					<div class="review-top-right">
						<div class="review-name">
							<h3 class="font-type-georgia"><?php echo $comment['name']; ?></h3>
						</div>
						<?php if(isset($comment['reference'])) { ?>
						<!--noindex-->
						<div class="review-link">
							<a href="<?php echo $comment['reference']['link']; ?>">
								<img src="<?php echo $comment['reference']['image_path']; ?>"
									 title="<?php echo $comment['reference']['name']; ?>"
									 alt="<?php echo $comment['reference']['name']; ?>"
									 class="img-responsive"/>
							</a>
						</div>
						<!--/noindex-->
						<?php } ?>
					</div>

				</div>
				<p class="text-left"><?php echo $comment['text']; ?></p>
				<!--<a class="link-review pull-right font-size-18 font-underline font-type-georgia" style="padding-top: 15px;margin-right: 12px;" href="<?php echo $link_review; ?>">Читать далее</a> -->
			</div>
			<?php } ?>
		</div>
	</div>
	<!-- COMMENTS END -->
	<!-- SERVICE BEGIN -->

	<div class="row">
		<div class="home-text-4 col-lg-12 text-center">
			<h2>Получите в подарок выезд <br/>
				дизайнера и технолога на дом</h2>
		</div>
		<div class="col-lg-12 service">
		<div class="border-gray" id="background-service">
			<div class="service_box">
				<p>Выезд специалиста на замер,<br>
					составление эскиза на месте <a class="red font-underline" href="<?php echo $special; ?>">в подарок</a>.<br>
					Услуга предоставляется для прихожих,<br>
					гардеробных, встроенных и других шкафов. </p>
				<div class="service_box_box">
					<div class="service_input one">
						<input type="text" data-modal="1" name="name" value="" placeholder="ФИО">
						<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите имя</span>
					</div>
					<div class="service_input two">
						<input type="text" data-modal="1" name="telephone" value="" placeholder="Введите свой телефон">
						<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
					</div>
					<div class="pull-right button">
						<button title="Заказать"
								name="service_button"
								style="width: 115px;"
								class="button-style-1">
							Заказать
						</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- SERVICE END -->

<!-- OUR PARTNERS  BEGIN-->
<div class="row home-partners visible-lg" style="margin-top: 4px;">
	<div class="home-text-5 col-lg-12 text-center">
		<h2>Наши партнеры</h2>
	</div>
	<div class="col-lg-6">
		<div id="partners-gprom"></div>
	</div>
	<div class="col-lg-6">
		<div id="partners-sberb"></div>
	</div>
</div>
<!-- OUR PARTNERS  END-->

<?php echo $content_bottom; ?>

<?php echo $column_right; ?></div>
</div>


<!-- FOR MOBILE -->
<div class="container  hidden-lg mobile-box" id="home">
	<div class="row">
		<div class="home-text-1 col-xs-12 text-center">
			<h1>Изготавливаем шкафы-купе на заказ</h1>
		</div>
		<div class="col-xs-12 carousel-box-mobile">
			<?php echo $content_top; ?>  <!-- carousel -->
		</div>
		<div class="home-text-2 col-xs-12 text-center">
			<h2>Популярные категории товаров</h2>
		</div>
		<div class="col-xs-12  tile_banner container-norm">
			<div class="root-box-flex">
				<div class="root-sub-box-flex">
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['calculator']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['built_in']; ?>
					</div>
				</div>
				<div class="root-sub-box-flex">
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['standard']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['radius']; ?>
					</div>
					<div class="root-sub-sub-box-flex">
						<?php echo $box_images_html_mobile['dressing_room']; ?>
					</div>
				</div>
			</div>
		</div>
		<div class="home-text-3 col-xs-12 text-center description-up">
			<h2>Получите в подарок выезд <br/>
				дизайнера и технолога на дом</h2>
		</div>


		<div class="col-xs-12 text-center service container-norm" >
			<div class="row">
				<div class="col-xs-12" >
					<div id="background-service">
						<p name="text_free">Выезд специалиста на замер,<br>
							составление эскиза на месте в подарок.
							Услуга предоставляется для прихожих,
							гардеробных, встроенных и других шкафов. </p>
						<div class="bottom-box">
							<div class="service_input one">
								<input type="text" data-modal="2" name="name" value="" placeholder="ФИО" class="text-center">
								<span class="error" data-modal="2" hidden="hidden">Пожалуйста, введите имя</span>
							</div>
							<div class="service_input two">
								<input type="text" data-modal="2" name="telephone" value="" placeholder="Введите свой телефон" class="text-center">
								<span class="error" data-modal="2" hidden="hidden">Пожалуйста, введите телефон</span>
							</div>
							<button title="Заказать"
									name="service_button"
									class="service_button button-style-1"
									data-modal="2">
								Заказать
							</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<?php echo $footer; ?>