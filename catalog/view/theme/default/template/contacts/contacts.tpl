<?php echo $header; ?>
<div class="container  visible-lg" id="contacts">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
		<?php if(!next($breadcrumbs)) { ?>
		<li class="breadcrumb_last"><span class="red"><?php echo $breadcrumb['text']; ?></span></li>
		<?php continue; ?>
		<?php } ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row row-base">

			<div class="picture-back contacts"></div>
			<div class="text_box contacts">

				<div class="col-12-lg description-box">
					<h1 class="text-center">Контакты</h1>
					<div class="top-text">
						<p><span class="font-bold">Дни работы:</span> понедельник-пятница, суббота и воскресенье - по договоренности</p>
						<p class="pull-right"><img src="../image/catalog/contacts/description/icon_time.png"> 9:00 — 17:30</p>
					</div>
					<p><span class="font-bold">Телефон:</span> +7 (812) 965 30 61</p>
					<p><span class="font-bold">E-mail:</span> 9653061@gmail.com</p>
					<p><span class="font-bold">Наш адрес:</span> Россия, Санкт-Петербург, Уманский переулок, 71</p>
					<div>
						<p class="metro-path-1">
							<img class="metro-img" src="../image/catalog/contacts/description/icon_metro_red.png">
							<span class="red">м.Площадь Ленина</span>
							<img class="arrow" src="../catalog/view/theme/default/image/arrow.png">
							автобусы: 28,37
						</p>
						<p class="metro-path-2">
							<img class="metro-img" src="../image/catalog/contacts/description/icon_metro_orange.png">
							<span class="orange">м.Новочеркасская</span>
							<img class="arrow" src="../catalog/view/theme/default/image/arrow.png">
							автобус: 174
						</p>
					</div>
					<!--noindex-->
					<p class="social-link-box">
						<span class="font-bold">Мы в социальных сетях:</span>
						<a href="https://vk.com/centr_mebeli" target="_blank"><img src="../catalog/view/theme/default/image/icon-vk.svg"></a>
						<a href="https://www.instagram.com/centr_mebeli_spb" target="_blank"><img src="../catalog/view/theme/default/image/icon-instagram.svg"></a>
						<a href="https://ok.ru/group/53741503316175" target="_blank"><img src="../catalog/view/theme/default/image/icon-ok.svg"></a>
						<a href="https://www.facebook.com/%D0%A6%D0%B5%D0%BD%D1%82%D1%80-%D0%9C%D0%B5%D0%B1%D0%B5%D0%BB%D0%B8-1939941169366106/" target="_blank"><img src="../catalog/view/theme/default/image/icon-facebook.svg"></a>
						<a href="https://www.youtube.com/channel/UCsOy63yxh-ldVqyCEJTZt0g" target="_blank"><img src="../catalog/view/theme/default/image/icon-youtube.svg"></a>
					</p>
					<!--/noindex-->
					<p class="font-bold text-bottom">В нашем магазине вы можете посмотреть образцы готовых изделий, всех используемых материалов, составить дизайн проект и оформить заказ.</p>
				</div>

				<script charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Aca1df9f281b7cdc437f63ccfa93c3a37f4a54b44c2866b1223376df82bcae4ea&amp;width=907&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>

				<div class="col-12-lg" id="image" name="image-box-bottom">
					<a href="../image/catalog/contacts/1-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/1-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/2-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/2-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/3-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/3-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/4-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/4-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/5-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/5-min.jpg" alt="фото окрестностей"></div></a>
				</div>

			</div>
	</div>
</div>

<!-- FOR MOBILE -->
<div class="container hidden-lg" id="contacts">
	<div class="row">
		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
		</div>
		<div class="col-xs-12 text-left">
			<div class="picture-back contacts"></div>
			<div class="text_box contacts">
				<div class="col-12-sx description-box">
					<h1 class="text-center">Контакты</h1>
					<div class="top-text">
						<p><span class="font-bold">Дни работы:</span> понедельник-пятница, суббота и воскресенье - по договоренности</p>
						<p><img src="../image/catalog/contacts/description/icon_time.png"> 9:00 — 17:30</p>
					</div>
					<p><span class="font-bold">Телефон:</span> +7 (812) 965 30 61</p>
					<p><span class="font-bold">E-mail:</span> <a href="mailto:9653061@gmail.com">9653061@gmail.com</a></p>
					<p><span class="font-bold">Наш адрес:</span> Россия, Санкт-Петербург, Уманский переулок, 71</p>
					<div>
						<p class="metro-path-1">
							<img class="metro-img" src="../image/catalog/contacts/description/icon_metro_red.png">
							<span class="red">м.Площадь Ленина</span>
							<img class="arrow" src="../catalog/view/theme/default/image/arrow.png">
							автобусы: 28,37
						</p>
						<p class="metro-path-2">
							<img class="metro-img" src="../image/catalog/contacts/description/icon_metro_orange.png">
							<span class="orange">м.Новочеркасская</span>
							<img class="arrow" src="../catalog/view/theme/default/image/arrow.png">
							автобус: 174
						</p>
					</div>

					<p class="social-text-box font-bold">Мы в социальных сетях:</p>
					<div class="social-link-box">
						<a href="https://vk.com/centr_mebeli" target="_blank"><img src="../catalog/view/theme/default/image/icon-vk.svg"></a>
						<a href="https://www.instagram.com/centr_mebeli_spb" target="_blank"><img src="../catalog/view/theme/default/image/icon-instagram.svg"></a>
						<a href="https://ok.ru/group/53741503316175" target="_blank"><img src="../catalog/view/theme/default/image/icon-ok.svg"></a>
						<a href="https://www.facebook.com/%D0%A6%D0%B5%D0%BD%D1%82%D1%80-%D0%9C%D0%B5%D0%B1%D0%B5%D0%BB%D0%B8-1939941169366106/" target="_blank"><img src="../catalog/view/theme/default/image/icon-facebook.svg"></a>
						<a href="https://www.youtube.com/channel/UCsOy63yxh-ldVqyCEJTZt0g" target="_blank"><img src="../catalog/view/theme/default/image/icon-youtube.svg"></a>
					</div>


					<p class="font-bold text-bottom">В нашем магазине вы можете посмотреть образцы готовых изделий, всех используемых материалов, составить дизайн проект и оформить заказ.</p>
				</div>

				<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A42fafea28d64d08297cdbb5c12031bbddee25fc6b7b1917e4dfb5ca2b6f87a0c&amp;width=100%25&amp;height=240&amp;lang=ru_RU&amp;scroll=true"></script>

				<div class="col-12-sx" id="image" name="image-box-bottom">
					<a href="../image/catalog/contacts/1-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/1-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/2-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/2-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/3-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/3-min.jpg" alt="фото окрестностей"></div></a>
					<a href="../image/catalog/contacts/4-max.jpg"><div class="img-box"><img class="img" src="../image/catalog/contacts/4-min.jpg" alt="фото окрестностей"></div></a>
				</div>
			</div>
		</div>
	</div>
</div>

<?php echo $footer; ?>