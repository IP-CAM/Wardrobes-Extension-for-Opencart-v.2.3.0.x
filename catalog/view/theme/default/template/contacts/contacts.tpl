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
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<div class="picture-back contacts"></div>
			<div class="text_box contacts">
				<?php echo $description; ?>
				<script charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Aca1df9f281b7cdc437f63ccfa93c3a37f4a54b44c2866b1223376df82bcae4ea&amp;width=907&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>
				<div class="col-12-lg " id="image" style="position: relative;height: 200px; width: 910px; margin-top: 15px;">
					<div class="img-box"><img class="img" src="../image/catalog/contacts/1-max.jpg" alt="фото окрестностей"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/2-max.jpg" alt="фото окрестностей"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/3-max.jpg" alt="фото окрестностей"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/4-max.jpg" alt="фото окрестностей"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/5-max.jpg" alt="фото окрестностей"></div>
				</div>
			</div>
			<?php echo $content_bottom; ?>
			<?php echo $column_right; ?>
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
				<?php echo $description; ?>
				<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A42fafea28d64d08297cdbb5c12031bbddee25fc6b7b1917e4dfb5ca2b6f87a0c&amp;width=100%25&amp;height=240&amp;lang=ru_RU&amp;scroll=true"></script>
			</div>
		</div>
	</div>
</div>

<?php echo $footer; ?>