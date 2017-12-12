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
	<div class="row" id="tile_banner">

		<?php foreach($comments as $comment) { ?>
		<div class="text-left col-sm-4">
			<div class="row">
				<div class="text-left col-sm-12">
					<table class="table">
						<tr>
							<td>
								<div class="sa">
									<img src="<?php echo $comment['path_image']; ?>"
										 title="<?php echo $comment['title']; ?>"
										 alt="<?php echo $comment['alt']; ?>"
										 class="img-responsive"/>
							</div>
							</td>
							<td>Арина Игнатьева</td>
						</tr>
						<tr>
							<td colspan="2">
								<p>Нашла Вас в ВКонтакте и захотела купить шкаф-купе. Была приятно удивлена большим
									количеством цветов шкафов и материалов. Меня консультировала менеджер Наташа, очень
									любезная девушка, которая подобрала дизайн шкафа и сказала его стоимость. Всё очень
									здорово...</p>
								<a href="<?php echo $tile_banner_dressing_rooms['href']; ?>">Читать далее</a>
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

<footer>
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="col-sm-3">
				<h5><?php echo $text_information; ?></h5>
				<ul class="list-unstyled">
					<?php foreach ($informations as $information) { ?>
					<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
			<div class="col-sm-3">
				<h5><?php echo $text_service; ?></h5>
				<ul class="list-unstyled">
					<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
			<div class="col-sm-3">
				<h5><?php echo $text_extra; ?></h5>
				<ul class="list-unstyled">
					<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
			<div class="col-sm-3">
				<h5><?php echo $text_account; ?></h5>
				<ul class="list-unstyled">
					<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
		</div>
		<hr>
		<p><?php echo $powered; ?></p>
	</div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>