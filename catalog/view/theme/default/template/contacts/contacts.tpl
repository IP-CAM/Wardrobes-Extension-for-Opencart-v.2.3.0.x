<!-- MODAL WINDOW BEGIN END -->
<?php echo $header; ?>
<div class="container container-fix " id="contacts">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
			<?php if(!next($breadcrumbs)) { ?>
				<li class="breadcrumb_last"><a class="red" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
			<div class="picture-back contacts">
			</div>
			<div class="text_box contacts">
				<?php echo $description; ?>
				<div class="col-12-lg " id="image" style="position: relative;height: 200px; width: 910px;">
					<div class="img-box"><img class="img" src="../image/catalog/contacts/1-max.jpg"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/2-max.jpg"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/3-max.jpg"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/4-max.jpg"></div>
					<div class="img-box"><img class="img" src="../image/catalog/contacts/5-max.jpg"></div>

				</div>
			</div>
			<?php echo $content_bottom; ?></div>
		<?php echo $column_right; ?></div>
	</div>
</div>

	<?php echo $footer; ?>

<script type="text/javascript">




	$(document).ready(function () {
                          
		//пременная отступа

		var height_img_box = 180;
		var width_img_box = 170;

		var wh_img = [];

		// рапределяем миниатюра по длинне,
		// смещая их по горизонтали
		$(".img-box").each(function(index) {
			var left = (index * (width_img_box + 15)) + 0;
			left_img.push(left);
		    $(this).css("left", left + "px");

			var elem = $(this).find('img').clone();
			elem.css({'width':'auto', 'height' : 'auto'});
			$('body').before(elem);

			var top_img_sub = Math.round(-1*($(this).find('img').height()-height_img_box)/2);
			var left_img_sub = Math.round(-1*($(this).find('img').width()-width_img_box)/2);

			if(elem.width() > elem.height()) {
				//elem.offset(elem.height(), elem.position().top);
				$(this).find('img').css({
					top: top_img_sub,
					left: left_img_sub
				});

			}
			wh_img.push([left, elem.width(), elem.height()]);
			elem.remove();
			console.log(wh_img);

		});
		                          
		                                                  
		$(".img-box").hover(
			function() {
				var elem = $(this).find('img').clone();
				elem.find('img').css({'width':'auto', 'height' : 'auto'});
				$('body').before(elem);
				var height_img = elem.height();
				var width_img = elem.width();
				//left_img[$(this).index()] = Math.round($(this).position().left);
				//top_img[$(this).index()]  = $(this).position().top;
				elem.remove();
				//console.log(top_img);
				//alert(width_img);
				var left_img_show = left_img[$(this).index()] - ((width_img-width_img)/2);
				var top_img_show = -1*(height_img-180)/2;

				//alert(left_img_show);

				// при наведении курсора мыши
				$(this).find('img').addClass('img-gr');
				$(this).css("z-index", 1);
				//$(this).css('overflow', 'visible');
				$(this).animate({
					height  : height_img,
					width   : width_img,
					left            : left_img_show,
					top             : top_img_show
					}, "fast");
		 	},
			function() {
				// hover out
				$(this).find('img').removeClass('img-gr');
				$(this).css("z-index", 0);
				//$(this).css('overflow', 'hidden');
				$(this).stop(true);
				$(this).animate({
					height  : "180",
					width   : "170",
					left            : left_img[$(this).index()],
					top             : 0
				}, "fast");
		 	});
	});




</script>