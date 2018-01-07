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
				<div class="col-12-lg " id="image" style="    height: 200px; width: 910px;">
					<img class="img" src="../image/catalog/contacts/1-max.jpg">
					<img class="img" src="../image/catalog/contacts/2-max.jpg">
					<img class="img" src="../image/catalog/contacts/3-max.jpg">
					<img class="img" src="../image/catalog/contacts/4-max.jpg">
					<img class="img" src="../image/catalog/contacts/5-max.jpg">

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
		var cont_left = $("#image").position().left;

		// рапределяем миниатюра по длинне,
		// смещая их по горизонтали
		$(".img").each(function(index) {
			var left = (index * 185) + cont_left;
		    $(this).css("left", left + "px");
		});
		                          
		                                                  
		$(".img").hover(
			function() {
				// при наведении курсора мыши
				$(this).css("z-index", 1);
				$(this).animate({
					height  : "250",
					width   : "250",
					left            : "-=50",
					top             : "-=50"
					}, "fast");
		 	},
			function() {
				// hover out
				$(this).css("z-index", 0);
				$(this).animate({
					height  : "180",
					width   : "170",
					left            : "+=50",
					top             : "+=50"
					}, "fast");
		 	});
		  



	});




</script>