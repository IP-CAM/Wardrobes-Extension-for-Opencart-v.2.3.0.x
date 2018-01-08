<?php echo $header; ?>
<div class="container container-fix " id="contacts">
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
<?php echo $footer; ?>