<?php echo $header; ?>
<div class="container container-fix " id="review">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
		<?php if(!next($breadcrumbs)) { ?>
		<li class="breadcrumb_last"><span class="red">Отзывы</span></li>
		<?php continue; ?>
		<?php } ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<h1 class="text-center">Отзывы наших клиентов</h1>

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
			<h1 style="text-align: center;margin-bottom: 35px;">Отзывы компаний — партнёров</h1>

			<div class="comment-box">
				<?php for($i=0; $i<3; $i++) { ?>
				<table>
					<tr>
						<td class="image-comment aristo">

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
						<td class="reference-comment font-size-16 font-type-verdana font-underline"><a download
																									   href="../document/document.txt">Ссылка
								на рекомендацию</a></td>
						<td class="name-comment font-size-16 font-type-verdana font-bold" style="text-align: right;">
							В.Л. Герцен<br>
							Директор филиала “Аристо Северо Запад”
						</td>
					</tr>
				</table>
				<?php } ?>
			</div>
			<a id="image" href="https://vk.com/centr_mebeli"></a>
			<?php echo $content_bottom; ?>
			<?php echo $column_right; ?>
		</div>
	</div>
</div>
<?php echo $footer; ?>
