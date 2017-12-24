<?php echo $header; ?>
<div class="container" id="category">
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
    <div id="content" class="<?php echo $class; ?> catalog"><?php echo $content_top; ?>
      <h2 class="line-dark-before cat-bef-h4" style="position: absolute; top: -37px;left: 24px;"><?php echo $heading_title; ?></h2>
      <div class="row" style="margin-top: 25px;">
		  <div class="col-lg-12">
			  <div id="reference_characteristic">
				  <a class="gray" href="<?php echo $categories[67]['href'] ?>">Стандартные шкафы-купе</a></li>
				  <a class="gray" href="<?php echo $categories[66]['href'] ?>">Угловые шкафы-купе</a></li>
				  <a class="gray" href="<?php echo $categories[60]['href'] ?>">Встроенные шкафы-купе</a></li>
				  <a class="gray" href="<?php echo $categories[59]['href'] ?>">Шкафы-Купе</a></li>
				  <a class="gray" href="<?php echo $categories[64]['href'] ?>">Радиусные шкафы-купе</a></li>
			  </div>
		  </div>

        <?php if ($description) { ?>
        <div class="col-lg-12" id="description-p" style="padding-top: 15px;"><?php echo $description; ?></div>
        <?php } ?>
		  <div class="col-lg-12" style="width: 95%; position: relative; left: 18px;">
			  <div class="row picture-characteristic line-dark-before">
				  <div class="col-lg-3" id="delivery">
					  <p class="text pull-right" style="padding-left: 9px;">Быстрая доставка</p>
				  </div>
				  <div class="col-lg-3" id="compilation">
					  <p class="text pull-right" style="padding-left: 7px;">Бесплатная сборка</p>
				  </div>
				  <div class="col-lg-3" id="quality">
					  <p class="text pull-right" style="padding-left: 0;">Качество и надежность</p>
				  </div>
				  <div class="col-lg-3" id="installments">
					  <p class="text pull-right" style="padding-left: 4px;">Рассчрочка 0% без переплат</p>
				  </div>
			  </div>
		  </div>
      </div>
      <?php if ($products) { ?>
		<div class="row select-product-box" style="margin-top: 22px;">
			<div class="col-lg-6">
				<div class="input-select" style="display: table;">
					<label class=""
						   style="display: table-cell; vertical-align: middle; font-size: 14px; width: 124px;"
						   for="input-sort"><?php echo $text_sort; ?></label>
					<select id="input-sort" class="" style="width: 223px; height: 33px;" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>"
								selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div id="check-left">
				</div>
			</div>
			<div class="col-lg-6">
				<div class="input-select" style="display: table; float: right;">
					<label class=""
						   style="display: table-cell; vertical-align: middle; font-size: 14px; width: 124px;"
						   for="input-limit"><?php echo $text_limit; ?></label>
					<select id="input-limit" class="" style="width: 66px; height: 33px;" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>"
								selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div id="check-right">
				</div>
        </div>
      </div>
      <div class="row product-box" style="padding-top: 27px;">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

			  <p class="font-size-16 font-type-verdana dark name"><?php echo $product['name']; ?></p>
			  <?php if ($product['price']) { ?>
			  <?php if (!$product['special']) { ?>
			  <p class="price dark font-size-18 font-type-verdana font-bold font-italic" style="text-align: left;"><?php echo trim($product['price']); ?></p>
			  <?php } else { ?>
			  <p class="price dark font-size-18 font-type-verdana font-bold font-italic" style="text-align: left;"><span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span></p>
			  <?php } ?>
			  <?php } ?>

               <button type="button" class="btn pull-left btn-danger" onClick='location.href="<?php echo $product['href']; ?>"'><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_more_info_cart; ?></span></button>
			</div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>


	</div>
	  <?php echo $content_bottom; ?>
		  <?php if ($description_down) { ?>
		  <div class="col-sm-12 text"><?php echo $description_down; ?></div>
		  <?php } ?>


    <?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>
