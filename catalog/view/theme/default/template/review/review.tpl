<?php echo $header; ?>
<div class="container container-fix " id="review">
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
			<div class="text_box review"><?php echo $description; ?></div>
			<h1 style="text-align: center;     margin-bottom: 35px;">Отзывы компаний — партнёров</h1>
			<div class="comment-box">

					<table>
						<tr>
							<td class="image-comment" id="aristo">

							</td>
							<td colspan="2" class="text-comment font-size-16 font-type-verdana">
								Компания “Аристо Северо Запад” сотрудничает с компанией “Центр Мебели” с 2013 года.
								За четыре года совместной работы ситуация на валютных рынках менялась несколько раз,
								но каждый раз мы совместными усилиями находили выходы в вопросах сотрудничества. Компания
								“Центр Мебели” имеет высокую деловую репутацию, что особенно ценно в деловом общении.
								Репутация косвенно гарантирует, что компания “не подведёт”. Нам не стыдно рекомендовать
								компанию “Центр Мебели” партнёрам нуждающихся в их услугах. Подведя итог нашего
								четырёхлетнего сотрудничества можно охарактеризовать всё одной фразой “Приятно работать
								с профессионалами”

							</td>
						</tr>
						<tr style="height: 59px;">
							<td></td>
							<td class="reference-comment font-size-16 font-type-verdana font-underline"><a href-"/">Ссылка на рекомендацию</a></td>
							<td class="name-comment font-size-16 font-type-verdana font-bold" style="text-align: right;">В.Л. Герцен<br>
								Директор филиала “Аристо Северо Запад”</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="image-comment" id="aristo">

							</td>
							<td colspan="2" class="text-comment font-size-16 font-type-verdana">
								Компания “Аристо Северо Запад” сотрудничает с компанией “Центр Мебели” с 2013 года.
								За четыре года совместной работы ситуация на валютных рынках менялась несколько раз,
								но каждый раз мы совместными усилиями находили выходы в вопросах сотрудничества. Компания
								“Центр Мебели” имеет высокую деловую репутацию, что особенно ценно в деловом общении.
								Репутация косвенно гарантирует, что компания “не подведёт”. Нам не стыдно рекомендовать
								компанию “Центр Мебели” партнёрам нуждающихся в их услугах. Подведя итог нашего
								четырёхлетнего сотрудничества можно охарактеризовать всё одной фразой “Приятно работать
								с профессионалами”

							</td>
						</tr>
						<tr style="height: 59px;">
							<td></td>
							<td class="reference-comment font-size-16 font-type-verdana font-underline"><a href-"/">Ссылка на рекомендацию</a></td>
							<td class="name-comment font-size-16 font-type-verdana font-bold" style="text-align: right;">В.Л. Герцен<br>
								Директор филиала “Аристо Северо Запад”</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="image-comment" id="aristo">

							</td>
							<td colspan="2" class="text-comment font-size-16 font-type-verdana">
								Компания “Аристо Северо Запад” сотрудничает с компанией “Центр Мебели” с 2013 года.
								За четыре года совместной работы ситуация на валютных рынках менялась несколько раз,
								но каждый раз мы совместными усилиями находили выходы в вопросах сотрудничества. Компания
								“Центр Мебели” имеет высокую деловую репутацию, что особенно ценно в деловом общении.
								Репутация косвенно гарантирует, что компания “не подведёт”. Нам не стыдно рекомендовать
								компанию “Центр Мебели” партнёрам нуждающихся в их услугах. Подведя итог нашего
								четырёхлетнего сотрудничества можно охарактеризовать всё одной фразой “Приятно работать
								с профессионалами”

							</td>
						</tr>
						<tr style="height: 59px;">
							<td></td>
							<td class="reference-comment font-size-16 font-type-verdana font-underline"><a href-"/">Ссылка на рекомендацию</a></td>
							<td class="name-comment font-size-16 font-type-verdana font-bold" style="text-align: right;">В.Л. Герцен<br>
								Директор филиала “Аристо Северо Запад”</td>
						</tr>
					</table>


			</div>
			<div id="image"></div>
			<?php echo $content_bottom; ?></div>
		<?php echo $column_right; ?></div>
	</div>
</div>


<script type="text/javascript">



//	$(document).ready(function () {
//		$("#carousel").owlCarousel({
//			interval: 500,
//			navigation: true,
//			items: 1,
//			pagination:  false,
//			navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
//		});
//	});



</script>

	<?php echo $footer; ?>
