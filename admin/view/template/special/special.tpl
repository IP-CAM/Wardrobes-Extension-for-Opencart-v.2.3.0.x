<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<!-- HEADER MODULE BEGIN-->
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-special" data-toggle="tooltip" title="<?php echo $button_save; ?>"
						class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
				   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<!-- HEADER MODULE END-->

	<div class="container-fluid">
		<!-- MESSAGE BEGIN -->
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<!-- MESSAGE END -->
		<div class="panel panel-default">
			<div class="panel-heading">
			</div>

			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-special"
					  class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
					</ul>
					<div class="tab-content">
						<!-- TITLE BEGIN -->
						<div class="form-group required">
							<label class="col-sm-2 control-label"
								   for="input-meta-title"><?php echo $entry_title; ?></label>
							<div class="col-sm-10">
								<input type="text"
									   name="title"
									   value="<?php echo $title; ?>"
									   placeholder="<?php echo $entry_title; ?>"
									   id="input-title"
									   class="form-control"/>
							</div>
						</div>
						<!-- TITLE END -->
						<!-- META TITLE BEGIN -->
						<div class="form-group required">
							<label class="col-sm-2 control-label"
								   for="input-meta-title"><?php echo $entry_meta_title; ?></label>
							<div class="col-sm-10">
								<input type="text"
									   name="meta_title"
									   value="<?php echo $meta_title; ?>"
									   placeholder="<?php echo $entry_meta_title; ?>"
									   id="input-meta-title"
									   class="form-control"/>
							</div>
						</div>
						<!-- META TITLE END -->
						<!-- META DESCRIPTION BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label"
								   for="input-meta-description"><?php echo $entry_meta_description; ?></label>

							<div class="col-sm-10">
								<textarea
										name="meta_description"
										rows="5" placeholder="<?php echo $entry_meta_description; ?>"
										id="input-meta-description"
										class="form-control"><?php echo $meta_description; ?></textarea>
							</div>
						</div>
						<!-- META DESCRIPTION END -->
						<!-- META KEYWORD BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-meta-keyword"><?php echo $entry_meta_keyword; ?></label>

							<div class="col-sm-10">
								<textarea
										name="meta_keyword"
										rows="5" placeholder="<?php echo $entry_meta_keyword; ?>"
										id="input-meta-keyword"
										class="form-control"><?php echo $meta_keyword ?></textarea>
							</div>
						</div>
						<!-- META KEYWORD END -->
						<!-- SEO URL (KEYWORD) BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-keyword">
								<span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span>
							</label>

							<div class="col-sm-10">
								<input type="text" name="keyword" value="<?php echo $keyword; ?>"
									   placeholder="<?php echo $entry_keyword; ?>" id="input-keyword"
									   class="form-control"/>
								<?php if ($error_keyword) { ?>
								<div class="text-danger"><?php echo $error_keyword; ?></div>
								<?php } ?>
							</div>
						</div>
						<!-- SEO URL (KEYWORD) END -->
						<!-- DESCRIPTION BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
							<div class="col-sm-10">

									<textarea name="description"
											  placeholder="<?php echo $entry_description; ?>"
											  id="input-description"
											  class="form-control summernote"><?php echo $description; ?>
									</textarea>

							</div>
						</div>
						<!-- DESCRIPTION END -->


						<!-- WIDTH BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
							<div class="col-sm-10">
								<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
								<?php if ($error_width) { ?>
								<div class="text-danger"><?php echo $error_width; ?></div>
								<?php } ?>
							</div>
						</div>
						<!-- WIDTH END -->

						<!-- HEIGHT BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
							<div class="col-sm-10">
								<input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
								<?php if ($error_height) { ?>
								<div class="text-danger"><?php echo $error_height; ?></div>
								<?php } ?>
							</div>
						</div>
						<!-- HEIGHT END -->
						<!-- STATUS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label"
								   for="input-status"><?php echo $entry_status; ?></label>

							<div class="col-sm-10">
								<select name="status" id="input-status" class="form-control">
									<?php if ($status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<!-- STATUS END -->


						<!-- PRODUCT DISCOUNTS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product_discounts; ?></span></label>
							<div class="col-sm-10">
								<input type="text" name="product_name_discounts" value="" placeholder="<?php echo $entry_product_discounts; ?>" id="input-product" class="form-control" />
								<div id="featured-product-discounts" class="well well-sm" style="height: 150px; overflow: auto;">
									<?php if(isset($products_discounts)) { ?>
										<?php foreach ($products_discounts as $product_discounts) { ?>
										<div id="featured-product-discounts<?php echo $product_discounts['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_discounts['name']; ?>
											<input type="hidden" name="product_discounts[]" value="<?php echo $product_discounts['product_id']; ?>" />
										</div>
										<?php } ?>
									<?php } ?>
								</div>
							</div>
						</div>
						<!-- PRODUCT DISCOUNTS END -->
						<!-- LIMIT DISCOUNTS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit_discounts; ?></label>
							<div class="col-sm-10">
								<input type="text" name="limit_discounts" value="<?php echo $limit_discounts; ?>" placeholder="<?php echo $entry_limit_discounts; ?>" id="input-limit" class="form-control" />
							</div>
						</div>
						<!-- LIMIT DISCOUNTS END -->
						<!-- STATUS DISCOUNTS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label"
								   for="input-status"><?php echo $entry_status_discounts; ?></label>
							<div class="col-sm-10">
								<select name="status_discounts" id="input-status" class="form-control">
									<?php if ($status_discounts) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<!-- STATUS DISCOUNTS END -->


						<!-- PRODUCT BESTSELLERS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product_bestsellers; ?></span></label>
							<div class="col-sm-10">
								<input type="text" name="product_name_bestsellers" value="" placeholder="<?php echo $entry_product_bestsellers; ?>" id="input-product" class="form-control" />
								<div id="featured-product-bestsellers" class="well well-sm" style="height: 150px; overflow: auto;">
									<?php if(isset($products_bestsellers)) { ?>
										<?php foreach ($products_bestsellers as $product_bestsellers) { ?>
										<div id="featured-product-bestsellers<?php echo $product_bestsellers['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_bestsellers['name']; ?>
											<input type="hidden" name="product_bestsellers[]" value="<?php echo $product_bestsellers['product_id']; ?>" />
										</div>
										<?php } ?>
									<?php } ?>
								</div>
							</div>
						</div>
						<!-- PRODUCT BESTSELLERS END -->
						<!-- LIMIT BESTSELLERS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit_bestsellers; ?></label>
							<div class="col-sm-10">
								<input type="text" name="limit_bestsellers" value="<?php echo $limit_bestsellers; ?>" placeholder="<?php echo $entry_limit_bestsellers; ?>" id="input-limit" class="form-control" />
							</div>
						</div>
						<!-- LIMIT BESTSELLERS END -->
						<!-- STATUS BESTSELLERS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label"
								   for="input-status"><?php echo $entry_status_bestsellers; ?></label>
							<div class="col-sm-10">
								<select name="status_bestsellers" id="input-status" class="form-control">
									<?php if ($status_bestsellers) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<!-- STATUS BESTSELLERS END -->


						<div class="tab-pane" id="tab-data">


						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
	<link href="view/javascript/summernote/summernote.css" rel="stylesheet"/>
	<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>

	<script type="text/javascript">
		$('input[name=\'product_name_discounts\']').autocomplete({
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['product_id']
							}
						}));
					}
				});
			},
			select: function(item) {

				$('input[name=\'product_name_discounts\']').val('');

				$('#featured-product-discounts' + item['value']).remove();

				$('#featured-product-discounts').append('<div id="featured-product-discounts' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_discounts[]" value="' + item['value'] + '" /></div>');
			}
		});

		$('#featured-product-discounts').delegate('.fa-minus-circle', 'click', function() {
			$(this).parent().remove();
		});




		$('input[name=\'product_name_bestsellers\']').autocomplete({
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['product_id']
							}
						}));
					}
				});
			},
			select: function(item) {

				$('input[name=\'product_name_bestsellers\']').val('');

				$('#featured-product-bestsellers' + item['value']).remove();

				$('#featured-product-bestsellers').append('<div id="featured-product-bestsellers' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_discounts[]" value="' + item['value'] + '" /></div>');
			}
		});

		$('#featured-product-bestsellers').delegate('.fa-minus-circle', 'click', function() {
			$(this).parent().remove();
		});
		//--></script>
</div>
<?php echo $footer; ?>