<?php echo $header; ?>
<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>
<!-- MODAL WINDOW BEGIN END -->
<div class="container " id="product">

<div class="border-gray" id="message-characteristic" style="display: none;">
	<p class="font-size-12 font-type-verdana" id="text">Мы можем изготовить шкаф-купе который
		присутствует на нашем сайте с любыми
		вашими индивидуальными размерами </p>
	<p class="arrow"></p>
</div>

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
<div class="row">
	<?php if ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-8'; ?>
	<?php } ?>
	<div class="<?php echo $class; ?>">
		<?php if ($thumb || $images) { ?>
		<div class="thumbnails" style="height: 54px;">
			<div class=" thumbnail-left" style="width: 80px; height: 400px;">
				<?php if ($images) { ?>
				<?php foreach ($images as $image) { ?>
				<div class="image-additional">
					<a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
						<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
							 alt="<?php echo $heading_title; ?>"/>
					</a>
				</div>
				<?php } ?>
				<div class="border-gray" id="thumbnail-button"  ></div>
				<?php } ?>
			</div>

			<div class=" images-item">
				<?php if ($thumb) { ?>
				<a class="thumbnail" style="width: 631px; height: 400px;" href="<?php echo $popup; ?>"
				   title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>"
															  title="<?php echo $heading_title; ?>"
															  style="max-width: 100%; max-height: 100%;"
															  alt="<?php echo $heading_title; ?>"/></a>

				<?php } ?>
			</div>
		</div>

		<?php } ?>
		<div class="nav nav-tabs border-gray">
			<div class="button" id="characteristic" style="width: 146px;" ><p class="active-button">Характеристика</p></div>
			<div class="button" id="description" style="width: 146px;"><p  class="active-div">Описание</p></div>
			<div class="button" id="color" style="width: 146px;"><p class="active-div">Цвет</p></div>
			<div class="button" id="reviews" style="width: 146px;"><p  class="active-div">Отзывы</p></div>
			<div class="button" id="delivery" style="width: 146px;"><p  class="active-div">Доставка</p></div>
		</div>
		<div class="check-info border-gray">
			<div id="characteristic" style="">
				<div class="characteristic-top">
					<div id="size-box">
						<div id="size" class="block-line font-size-15 font-type-verdana">Размеры</div>
						<div id="width" class="block-line">
							<p class="block-line font-size-15 font-type-verdana">Ширина:</p>
							<?php if($width=='') { ?>
							<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
							<?php } else { ?>
							<p class="block-line font-size-15 font-type-verdana"><?php echo $width ?></p>
							<?php } ?>
						</div>
						<div id="height" class="block-line">
							<p class="block-line font-size-15 font-type-verdana">Высота:</p>
							<?php if($height=='') { ?>
							<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
							<?php } else { ?>
							<p class="block-line font-size-15 font-type-verdana"><?php echo $height ?></p>
							<?php } ?>
						</div>
						<div id="depth" class="block-line">
							<p class="block-line font-size-15 font-type-verdana">Глубина:</p>
							<?php if($depth=='') { ?>
							<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
							<?php } else { ?>
							<p class="block-line font-size-15 font-type-verdana"><?php echo $depth ?></p>
							<?php } ?>
						</div>
					</div>
				</div>
				<div style="margin: 15px"><?php echo $characteristic; ?></div>
			</div>
			<div id="description" style="padding: 12px; display: none">
				<?php echo $description; ?>
			</div>
			<div id="color" style="padding: 12px; display: none">
				<p style="    position: absolute; left: 43px;" >Доступные цвета</p>
			</div>
			<div id="reviews" style="display: none">
				<?php if(!empty($reviews)) { ?>
					<?php if(isset($reviews[count($reviews)-2])) { ?>
							<div class="reviews-box" id="review">
								<p style="color: #3e70c5; font-size: 18px;     margin-bottom: 7px;"><?php echo $reviews[count($reviews)-1]['author']?></p>

								<p style="padding-top: 0; margin: 0;"><?php echo $reviews[count($reviews)-1]['text']?></p>

								<p style="padding-top: 5px; font-size: 11px;"><?php echo $reviews[count($reviews)-1]['date_added']?></p>
								<a href="/" style=" position: absolute; color: #3e70c5; top: 90px; left: 177px; font-size: 13px;">Ответить</a>
							</div>
							<div class="reviews-box" id="review" style="padding-top: 0px; background-position-y: 4px;">
								<p style="color: #3e70c5; font-size: 18px;     margin-bottom: 7px;"><?php echo $reviews[count($reviews)-2]['author']?></p>

								<p style="padding-top: 0; margin: 0;"><?php echo $reviews[count($reviews)-2]['text']?></p>

								<p style="padding-top: 0px; font-size: 11px;"><?php echo $reviews[count($reviews)-2]['date_added']?></p>
								<a href="/" style=" position: absolute; color: #3e70c5; top: 73px; left: 177px; font-size: 13px;">Ответить</a>
							</div>
							<p style="position: relative; color: #3e70c5; font-size: 18px; top: -6px; left: 24px; cursor: pointer;">
								Оставить отзыв</p>
					<?php } else { ?>
						<?php if(isset($reviews[count($reviews)-1])) { ?>
							<div class="reviews-box" id="review">
								<p style="color: #3e70c5; font-size: 18px;     margin-bottom: 7px;"><?php echo $reviews[count($reviews)-1]['author']?></p>
								<p style="padding-top: 0; margin: 0;"><?php echo $reviews[count($reviews)-1]['text']?></p>
								<p style="padding-top: 5px; font-size: 11px;"><?php echo $reviews[count($reviews)-1]['date_added']?></p>
								<a href="/" style=" position: absolute; color: #3e70c5; top: 90px; left: 177px; font-size: 13px;">Ответить</a>
							</div>
							<div class="messange-review">
								<p style="position: relative; color: #3e70c5; font-size: 18px; top: -6px; left: 24px; cursor: pointer;">Оставить отзыв</p>
								<textarea name="review" rows="4" placeholder="Написать комментарий..." class="form-control" id="textarea-review"></textarea>
								<div class="mes">
									<p style="position: relative">Вход с помощью</p><a href="/" id="sosseti"></a>
								</div>
							</div>
						<?php } ?>
					<?php } ?>
				<?php } else { ?>

					<div class="empty-review font-italic gray" id="">
						Здесь пока нет отзывов
					</div>
					<div class="messange-review">
						<p style="position: relative; color: #3e70c5; font-size: 18px; top: -6px; left: 24px; cursor: pointer;">Оставить отзыв</p>
						<textarea name="review" rows="4" placeholder="Написать комментарий..." class="form-control" id="textarea-review"></textarea>
						<div class="mes">
							<p style="position: relative">Вход с помощью</p><a href="/" id="sosseti"></a>
						</div>
					</div>
				<?php } ?>


			</div>
			<div id="delivery" style="padding: 12px; padding-top: 28px; display: none">
				<div class="delivery-box" id="calck"><p>После заказа с вами свяжется менеджер для уточнения удобной времени доставки.</p></div>
				<div class="delivery-box" id="cart"><p style="padding-top: 15px;">Доставка и изготовление происходит в течении 7 дней.</p></div>
				<div class="delivery-box" id="drill"><p style="padding-top: 12px;">Монтаж  и сборка происходит в течении 2 - 4 часов в зависимости от сложности</p></div>
			</div>

		</div>
	</div>
	<?php if ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-4'; ?>
	<?php } ?>
	<div class="<?php echo $class; ?>">
		<h1 id="text-name"><?php echo $heading_title; ?></h1>
		<div class="phone-box border-gray" style="">
			<div class="text text-right">Если возникли вопросы, вы можете обратиться в нашу справочную службу, мы Вам перезвоним через 20 секунд.</div>
			<div>
				<input type="text" name="telephone" data-modal="1" value="" placeholder="+7 (984) 174 75 12" class="input-fild-telephone">
				<input type="button" data-modal="1" value="Отправить" class="button-style-2" id="active" style="margin-left: 6px;" />
			</div>
			<span class="error" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
		</div>
		<?php if ($price) { ?>
		<?php if (!$special) { ?>
		<h2 class="font-italic font-bold font-size-30 font-type-verdana" style="margin-top: 39px;"><?php echo $price; ?></h2>
		<?php } else { ?>
		<span style="text-decoration: line-through;"><?php echo $price; ?></span>

		<h2><?php echo $special; ?></h2>

		<?php } ?>
		<?php if ($discounts) { ?>
		<?php foreach ($discounts as $discount) { ?>
		<?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
		<?php } ?>
		<?php } ?>
		<?php } ?>

		<a href="<?php echo $calculator ?>"
		   title="Рассчитать"
		   class="due button-style-1 font-type-verdana font-size-18" style="margin-bottom: 15px;">Рассчитать</a>
		<a href="<?php echo $calculator ?>"
		   title="Купить в рассрочку от 2 000 руб./мес"
		   class="due button-style-3 font-type-verdana font-size-16">Купить в рассрочку от 2 000 руб./мес</a>
		<div class="advantages border-gray">
			<div class="advantages-top" style="margin-top: 12px;">
				<p class="ont-type-georgia font-size-18">Способы оплаты</p>
				<div class="item">
					<p class="font-type-verdana font-size-14">Наличный расчет</p>
					<p class="font-type-verdana font-size-14">Банковской картой</p>
					<p class="font-type-verdana font-size-14">Оплата в расрочку</p>
				</div>
				<div class="image"></div>
			</div>
			<div class="advantages-down">
				<p class="ont-type-georgia font-size-18">Наши преимущества</p>
				<div class="item">
					<p class="font-type-verdana font-size-14">На рынке с 2008г</p>
					<p class="font-type-verdana font-size-14">Гарантия от 2х лет</p>
					<p class="font-type-verdana font-size-14">Изготовление от 7 дней</p>
				</div>
				<div class="image"></div>
			</div>
		</div>

	</div>
</div>


<?php if ($tags) { ?>
<p><?php echo $text_tags; ?>
	<?php for ($i = 0; $i < count($tags); $i++) { ?>
	<?php if ($i < (count($tags) - 1)) { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
	<?php } else { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
	<?php } ?>
	<?php } ?>
</p>
<?php } ?>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
	$(document).ready(function() {

		$('.nav-tabs .button').on('click', function() {
			$('.nav-tabs .button p').removeClass('active-button');
			$(this).find('p').addClass('active-button');

			var id = $(this).attr('id');
			$('.check-info>div').hide();
			$('.check-info').find('#' + id).show();
		});

		$('#characteristic .any').mouseenter(function() {
			$('#message-characteristic').show();
			$(this).before($('#message-characteristic'));
		});
		$('#characteristic .any').mouseleave(function() {
			$('#message-characteristic').hide();
		});



		$('#active').click(function (event) {
			var text = $("[name='telephone']").val();
			if (text == '') {
				$('.phone-box .error').show();
				return false;
			} else {
				$('.phone-box .error').hide();
				$('.calculator_dispatch .error').hide();
				ajaxClientCall(1,3,0);
			}
		});

		$('.thumbnails').magnificPopup({
			type:'image',
			delegate: 'a',
			gallery: {
				enabled:true
			}
		});


	});
	//--></script>





<?php echo $footer; ?>
