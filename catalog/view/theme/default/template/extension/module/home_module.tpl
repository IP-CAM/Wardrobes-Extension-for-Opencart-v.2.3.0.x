<!-- TILE BANNER BEGIN -->
<div class="container">
	<div class="row" id="tile_banner">
		<div class="col-sm-4 text-center">

			<div class="row">
				<div class="text-center col-sm-12">
					<a href="<?php echo $tile_banner_standard['href']; ?>">
						<img src="<?php echo $tile_banner_standard['path_image']; ?>"
							 title="<?php echo $tile_banner_standard['title']; ?>"
							 alt="<?php echo $tile_banner_standard['alt']; ?>"
							 class="img-responsive"/></a>
				</div>
			</div>
			<div class="row">
				<div class="text-center col-sm-12">
					<a href="<?php echo $tile_banner_radius['href']; ?>">
						<img src="<?php echo $tile_banner_radius['path_image']; ?>"
							 title="<?php echo $tile_banner_radius['title']; ?>"
							 alt="<?php echo $tile_banner_radius['alt']; ?>"
							 class="img-responsive"/></a>
				</div>
			</div>

		</div>
		<div class="col-sm-4 text-center">
			<div class="text-center">
				<a href="<?php echo $tile_banner_calculator['href']; ?>">
					<img src="<?php echo $tile_banner_calculator['path_image']; ?>"
						 title="<?php echo $tile_banner_calculator['title']; ?>"
						 alt="<?php echo $tile_banner_calculator['alt']; ?>"
						 class="img-responsive"/></a>
			</div>
		</div>

		<div class="col-sm-4 text-center">
			<div class="row">
				<div class="text-center col-sm-12">
					<a href="<?php echo $tile_banner_built_in['href']; ?>">
						<img src="<?php echo $tile_banner_built_in['path_image']; ?>"
							 title="<?php echo $tile_banner_built_in['title']; ?>"
							 alt="<?php echo $tile_banner_built_in['alt']; ?>"
							 class="img-responsive"/></a>
				</div>
			</div>
			<div class="row">
				<div class="text-center col-sm-12">
					<a href="<?php echo $tile_banner_dressing_rooms['href']; ?>">
						<img src="<?php echo $tile_banner_dressing_rooms['path_image']; ?>"
							 title="<?php echo $tile_banner_dressing_rooms['title']; ?>"
							 alt="<?php echo $tile_banner_dressing_rooms['alt']; ?>"
							 class="img-responsive"/></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- TILE BANNER END -->

<!-- COMMENTS BEGIN -->
<div class="container">
	<div class="row" id="main_inscription">
		<div class="col-sm-12 text-center">
			<h1>Отзывы наших клиентов</h1>
		</div>
	</div>
</div>

<div class="container">
	<div class="row" id="tile_banner">

		<?php foreach($comments as $comment) { ?>
		<div class="text-left col-sm-4">
			<div class="row">
				<div class="text-left col-sm-12">
					<table class="table">
						<tr>
							<td class="comments_image">
								<img src="<?php echo $comment['path_image']; ?>"
									 title="<?php echo $comment['title']; ?>"
									 alt="<?php echo $comment['alt']; ?>"
									 class="img-responsive"/>
							</td>
							<td>Арина Игнатьева</td>
						</tr>
						<tr>
							<td colspan="2">
								<p>Нашла Вас в ВКонтакте и захотела купить шкаф-купе. Была приятно удивлена большим
									количеством цветов шкафов и материалов. Меня консультировала менеджер Наташа, очень
									любезная девушка, которая подобрала дизайн шкафа и сказала его стоимость. Всё очень
									здорово...</p>
								<a class="pull-right" href="<?php echo $tile_banner_dressing_rooms['href']; ?>">Читать далее</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<?php } ?>

	</div>
</div>
<!-- COMMENTS END -->


<!-- SERVICE BEGIN -->
<div class="container">
	<div class="row" id="main_inscription">
		<div class="col-sm-12 text-center">
			<h1>Получите в подарок выезд <br/>
				дизайнера и технолога на дом</h1>
		</div>
	</div>
</div>

<div class="container">
	<div class="row" id="tile_banner">
		<div class="">
			<div class=" col-sm-6">
				<img src="<?php echo $service['path_image']; ?>"
					 title="<?php echo $service['title']; ?>"
					 alt="<?php echo $service['alt']; ?>"
					 class="img-responsive pull-right"/>
			</div>
		</div>

		<div class="col-sm-6 service_box">

			<p>Выезд специалиста на замер,
				составление эскиза на месте в подарок.
				Услуга предоставляется для прихожих,
				гардеробных, встроенных и других шкафов. </p>
			<div class="service_form">
				<div class="service_input">
					<input type="text" name="customer[name]"  value="" placeholder="ФИО">
				</div>
				<div class="service_input">
					<input type="text" name="customer[phone]"  value="" placeholder="Введите свой телефон">
				</div>
			</div>
			<div class="pull-right">
				<button title="Заказать"
						name="service_button"
						class="btn pull-left btn-danger">
					Заказать</button>
			</div>

		</div>
	</div>
</div>
<!-- SERVICE END -->
