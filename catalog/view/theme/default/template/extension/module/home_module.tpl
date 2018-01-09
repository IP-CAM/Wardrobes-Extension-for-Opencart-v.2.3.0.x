<!-- TILE BANNER BEGIN -->
<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>
<!-- MODAL WINDOW BEGIN END -->

	<div class="row" >
		<div class="col-sm-12 text-center" style="margin-top: 15px;">
			<h2>Популярные категории товаров</h2>
		</div>
	</div>


	<div class="row tile_banner">
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

<!-- TILE BANNER END -->

<!-- COMMENTS BEGIN -->

	<div class="row visible-lg" >
		<div class="col-sm-12 text-center">
			<h2>Отзывы наших клиентов</h2>
		</div>
	</div>



	<div class="row visible-lg" id="home-review">

		<?php foreach($comments as $comment) { ?>
		<div class="text-left col-sm-4">
			<img src="<?php echo $comment['path_image']; ?>"
				 title="<?php echo $comment['title']; ?>"
				 alt="<?php echo $comment['alt']; ?>"
				 class="comments_image img-responsive"/>
			<p style="padding-top: 9px;">Нашла Вас в ВКонтакте и захотела купить шкаф-купе. Была приятно удивлена большим
				количеством цветов шкафов и материалов. Меня консультировала менеджер Наташа, очень
				любезная девушка, которая подобрала дизайн шкафа и сказала его стоимость. Всё очень
				здорово...</p>
			<a class="pull-right font-size-18 font-underline font-type-georgia" style="padding-top: 15px;margin-right: 12px;" href="<?php echo $link_review; ?>">Читать далее</a>
		</div>
		<?php } ?>

	</div>

<!-- COMMENTS END -->


<!-- SERVICE BEGIN -->

	<div class="row" >
		<div class="col-sm-12 text-center description-up" style=" margin-top: 20px;">
			<h2>Получите в подарок выезд <br/>
				дизайнера и технолога на дом</h2>
		</div>
	</div>


	<div class="row service">
		<div  class=" col-sm-12 col-lg-6" id="background-service">
		</div>

		<div class="col-sm-12  service_box">

			<p>Выезд специалиста на замер,<br>
				составление эскиза на месте в подарок.
				Услуга предоставляется для прихожих,
				гардеробных, встроенных и других шкафов. </p>
			<div class="service_form">
				<div class="service_input">
					<input type="text" data-modal="1" name="name"  value="" placeholder="ФИО">
					<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите имя</span>
				</div>
				<div class="service_input">
					<input type="text" data-modal="1" name="telephone"  value="" placeholder="Введите свой телефон">
					<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
				</div>

			</div>
			<div class="pull-right button" style="position: relative;right: 68px;top: 11px;">
				<button title="Заказать"
						name="service_button"
						style="width: 115px;"
						id="service_button"
						class="button-style-1">
					Заказать</button>
			</div>

		</div>
	</div>

<!-- SERVICE END -->




<!-- OUR PARTNERS  BEGIN-->
<div class="row home-partners visible-lg" style="margin-top: 4px;" >
	<div class="col-sm-12 text-center">
		<h2>Наши партнеры</h2>
	</div>
	<div class="col-sm-6">
		<div id="partners-gprom"></div>
	</div>
	<div class="col-sm-6">
		<div id="partners-sberb"></div>
	</div>
</div>
<!-- OUR PARTNERS  END-->


