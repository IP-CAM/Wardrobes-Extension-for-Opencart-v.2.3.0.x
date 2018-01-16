<!-- modal window start -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
	 aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body" id="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Ок</button>
			</div>
		</div>
	</div>
</div> <!-- modal window end -->


<?php echo $header; ?>
<div class="container" id="home">
<div class="row">
	<div class="col-xs-12 text-center">
		<h1>Изготавливаем шкафы-купе на заказ</h1>
	</div>
</div>
<div class="row"><?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-xs-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-xs-9'; ?>
<?php } else { ?>
<?php $class = 'col-xs-12'; ?>
<?php } ?>
<div id="content" style="margin-top: 11px;" class="<?php echo $class; ?>"><?php echo $content_top; ?>


<div class="row">
	<div class="col-xs-12 text-center" style="margin-top: 15px;">
		<h2>Популярные категории товаров</h2>
	</div>
</div>


<div class="row tile_banner visible-lg">
	<div class="block-im block-root-1">
		<div class="block-im-1">
			<a href="<?php echo $tile_banner_standard['href']; ?>">
				<img src="<?php echo $tile_banner_standard['path_image']; ?>"
					 title="<?php echo $tile_banner_standard['title']; ?>"
					 alt="<?php echo $tile_banner_standard['alt']; ?>"
					 class="img-responsive"/></a>
		</div>
		<div class="block-im-2">
			<a href="<?php echo $tile_banner_radius['href']; ?>">
				<img src="<?php echo $tile_banner_radius['path_image']; ?>"
					 title="<?php echo $tile_banner_radius['title']; ?>"
					 alt="<?php echo $tile_banner_radius['alt']; ?>"
					 class="img-responsive"/></a>
		</div>

	</div>
	<div class="block-im text-center block-root-2">
		<a href="<?php echo $tile_banner_calculator['href']; ?>">
			<img src="<?php echo $tile_banner_calculator['path_image']; ?>"
				 title="<?php echo $tile_banner_calculator['title']; ?>"
				 alt="<?php echo $tile_banner_calculator['alt']; ?>"
				 class="img-responsive"/></a>
	</div>

	<div class="block-im block-root-3">

		<div class="block-im-4">
			<a href="<?php echo $tile_banner_built_in['href']; ?>">
				<img src="<?php echo $tile_banner_built_in['path_image']; ?>"
					 title="<?php echo $tile_banner_built_in['title']; ?>"
					 alt="<?php echo $tile_banner_built_in['alt']; ?>"
					 class="img-responsive"/></a>
		</div>


		<div class="block-im-5">
			<a href="<?php echo $tile_banner_dressing_rooms['href']; ?>">
				<img src="<?php echo $tile_banner_dressing_rooms['path_image']; ?>"
					 title="<?php echo $tile_banner_dressing_rooms['title']; ?>"
					 alt="<?php echo $tile_banner_dressing_rooms['alt']; ?>"
					 class="img-responsive"/></a>
		</div>
	</div>


</div>


<div class="row tile_banner hidden-lg mobile">
	<div class="col-xs-12">
		<div class="row">
			<div class="col-xs-6" style="padding-right: 2px;">
				<a href="<?php echo $tile_banner_calculator['href']; ?>">
					<img src="<?php echo $tile_banner_calculator['path_image']; ?>"
						 title="<?php echo $tile_banner_calculator['title']; ?>"
						 alt="<?php echo $tile_banner_calculator['alt']; ?>"
						 class="img-responsive"/></a>
			</div>
			<div class="col-xs-6">
				<div class="row">
					<div class="col-xs-12" style="padding-left: 2px;">
						<a href="<?php echo $tile_banner_standard['href']; ?>">
							<img src="<?php echo $tile_banner_standard['path_image']; ?>"
								 title="<?php echo $tile_banner_standard['title']; ?>"
								 alt="<?php echo $tile_banner_standard['alt']; ?>"
								 class="img-responsive"/></a>
					</div>
					<div class="col-xs-12 margin-top" style="padding-left: 2px; margin-top: 4px;">
						<a href="<?php echo $tile_banner_radius['href']; ?>">
							<img src="<?php echo $tile_banner_radius['path_image']; ?>"
								 title="<?php echo $tile_banner_radius['title']; ?>"
								 alt="<?php echo $tile_banner_radius['alt']; ?>"
								 class="img-responsive"/></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12">
		<div class="row margin-top">
			<div class="col-xs-6" style="padding-right: 2px;">
				<a href="<?php echo $tile_banner_built_in['href']; ?>">
					<img src="<?php echo $tile_banner_built_in['path_image']; ?>"
						 title="<?php echo $tile_banner_built_in['title']; ?>"
						 alt="<?php echo $tile_banner_built_in['alt']; ?>"
						 class="img-responsive"/></a>
			</div>
			<div class="col-xs-6" style="padding-left: 2px;">
				<a href="<?php echo $tile_banner_dressing_rooms['href']; ?>">
					<img src="<?php echo $tile_banner_dressing_rooms['path_image']; ?>"
						 title="<?php echo $tile_banner_dressing_rooms['title']; ?>"
						 alt="<?php echo $tile_banner_dressing_rooms['alt']; ?>"
						 class="img-responsive"/></a>
			</div>
		</div>
	</div>
</div>


<!-- TILE BANNER END -->

<!-- COMMENTS BEGIN -->

	<div class="row visible-lg" >
		<div class="col-xs-12 text-center">
			<h2>Отзывы наших клиентов</h2>
		</div>
	</div>



	<div class="row visible-lg" id="home-review">

		<?php foreach($comments as $comment) { ?>
		<div class="text-left col-xs-4">
			<div class="review-top">
				<div class="review-image">
					<img src="<?php echo $comment['path_image']; ?>"
						 title="<?php echo $comment['title']; ?>"
						 alt="<?php echo $comment['alt']; ?>"
						 class="comments_image img-responsive"/>
				</div>
				<div class="review-name">
					<h3 class="font-type-georgia"><?php echo $comment['name']; ?></h3>
				</div>

			</div>
			<p class="text-left" style="padding-top: 9px;"><?php echo $comment['text']; ?></p>
			<!--<a class="pull-right font-size-18 font-underline font-type-georgia" style="padding-top: 15px;margin-right: 12px;" href="<?php echo $link_review; ?>">Читать далее</a> -->
		</div>
		<?php } ?>

	</div>

<!-- COMMENTS END -->


<!-- SERVICE BEGIN -->

<div class="row">
	<div class="col-xs-12 text-center description-up" style=" margin-top: 20px;">
		<h2>Получите в подарок выезд <br/>
			дизайнера и технолога на дом</h2>
	</div>
</div>


<div class="row service visible-lg">
	<div class=" col-xs-12 col-lg-6" id="background-service">
	</div>

	<div class="col-xs-12  service_box">

		<p>Выезд специалиста на замер,<br>
			составление эскиза на месте в подарок.
			Услуга предоставляется для прихожих,
			гардеробных, встроенных и других шкафов. </p>

		<div class="service_form">
			<div class="service_input">
				<input type="text" data-modal="1" name="name" value="" placeholder="ФИО">
				<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите имя</span>
			</div>
			<div class="service_input">
				<input type="text" data-modal="1" name="telephone" value="" placeholder="Введите свой телефон">
				<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
			</div>

		</div>
		<div class="pull-right button" style="position: relative;right: 68px;top: 11px;">
			<button title="Заказать"
					name="service_button"
					style="width: 115px;"
					class="button-style-1">
				Заказать
			</button>
		</div>

	</div>
</div>


<div class="row service hidden-lg">
	<div class="col-xs-12 text-center" >
		<div class="row">
		<div class="col-xs-12" >
			<div id="background-service">
				<!-- <img style="position: relative; width: 100%; height: 100%;" src="../catalog/view/theme/default/image/home-service-mobile.jpg"> -->
				<p>Выезд специалиста на замер,<br>
					составление эскиза на месте в подарок.
					Услуга предоставляется для прихожих,
					гардеробных, встроенных и других шкафов. </p>
				<div class="service_input">
					<input type="text" data-modal="1" name="name-mobile" value="" placeholder="ФИО" class="text-center">
					<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите имя</span>
				</div>
				<div class="service_input text-center">
					<input type="text" data-modal="1" name="telephone-mobile" value="" placeholder="Введите свой телефон" class="text-center">
					<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
				</div>
				<button title="Заказать"
						name="service_button-mobile"
						style="width: 115px; margin-bottom: 5vw;"
						class="button-style-1"
						onclick="yaCounter‎35873337.reachGoal('nomer'); return true;">
					Заказать
				</button>
			</div>

		</div>
		</div>
		</div>


	</div>

</div>

<!-- SERVICE END -->


<!-- OUR PARTNERS  BEGIN-->
<div class="row home-partners visible-lg" style="margin-top: 4px;">
	<div class="col-xs-12 text-center">
		<h2>Наши партнеры</h2>
	</div>
	<div class="col-xs-6">
		<div id="partners-gprom"></div>
	</div>
	<div class="col-xs-6">
		<div id="partners-sberb"></div>
	</div>
</div>
<!-- OUR PARTNERS  END-->


<?php echo $content_bottom; ?>
</div>
<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>