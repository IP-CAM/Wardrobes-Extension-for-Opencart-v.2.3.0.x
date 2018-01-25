<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<!-- HEADER MODULE BEGIN-->
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-contacts" data-toggle="tooltip" title="<?php echo $button_save; ?>"
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
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-contacts"
					  class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
					</ul>
					<div class="tab-content">
						<!-- TITLE BEGIN -->
						<div class="form-group required">
							<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
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
							<label class="col-sm-2 control-label"><?php echo $entry_meta_title; ?></label>
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
							<label class="col-sm-2 control-label"><?php echo $entry_meta_description; ?></label>

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
							<label class="col-sm-2 control-label"><?php echo $entry_meta_keyword; ?></label>

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
							<label class="col-sm-2 control-label">
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
						<!--<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
							<div class="col-sm-10">
									<textarea name="description"
											  placeholder="<?php echo $entry_description; ?>"
											  id="input-description"
											  class="form-control summernote"><?php echo $description; ?>
									</textarea>

							</div>
						</div> -->
						<!-- DESCRIPTION END -->
						<!-- STATUS BEGIN -->
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>

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
	<script type="text/javascript"><!--
		$('#language a:first').tab('show');
		//--></script>
</div>
<?php echo $footer; ?>