<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <!-- Header-->
    <div class="page-header">
        <div class="container-fluid">
			<div class="pull-right">
				<a onclick="$('form').submit();" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_delete_label; ?>"><i class="fa fa-trash-o"></i></a>
			</div>
            <h1><?php echo $client_heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <!-- /Header-->
    <!-- Content -->
    <div class="container-fluid">
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title_sub; ?></h3>
            </div>
            <div class="panel-body">
                <!-- ListContent -->
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-article">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td width="1" lass="text-center"><input type="checkbox"
                                                                                 onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"/>
                                </td>
                                <td class="center" style="width: 50px;"><?php if ($sort == 'cc.client_id') { ?>
                                    <a href="<?php echo $sort_client_id; ?>"
                                       class="<?php echo strtolower($order); ?>"><?php echo $column_client_id_label; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_client_id; ?>"><?php echo $column_client_id_label; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="left"><?php if ($sort == 'cc.name') { ?>
                                    <a href="<?php echo $sort_name; ?>"
                                       class="<?php echo strtolower($order); ?>"><?php echo $column_name_label; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name_label; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="left"><?php echo $column_telephone_label; ?></td>
								<td class="left"><?php echo $column_email_label; ?></td>
                                <td class="right"><?php echo $column_type_label; ?></td>
                                <td class="right"><?php echo $column_width_label; ?></td>
                                <td class="right"><?php echo $column_height_label; ?></td>
                                <td class="right"><?php echo $column_depth_label; ?></td>
                                <td class="right"><?php echo $column_ip_label; ?></td>
                                <td class="right"><?php echo $column_status_label; ?></td>
                                <td class="text-right"><?php echo $column_action_label; ?></td>

                            </tr>
                            </thead>
                            <tbody>
                            <?php if ($clients) { ?>
                            <?php foreach ($clients as $client) { ?>
                            <tr>
                                <td style="text-align: center;">
                                    <input type="checkbox" name="selected[]" value="<?php echo $client['client_id']; ?>"/>
                                </td>
                                <td class="center"><?php echo $client['client_id']; ?></td>
                                <td class="center"><?php echo $client['name']; ?></td>
                                <td class="center"><?php echo $client['telephone']; ?></td>
                                <td class="center"><?php echo $client['email']; ?></td>
                                <td class="center"><?php echo $client['type']; ?></td>
                                <td class="center"><?php echo $client['width']; ?></td>
                                <td class="center"><?php echo $client['height']; ?></td>
                                <td class="center"><?php echo $client['depth']; ?></td>
                                <td class="center"><?php echo $client['ip']; ?></td>
                                <td class="center"><?php echo $client['status']; ?></td>

                                <td class="text-right">
                                    <?php $action = $client['action']?>
                                    <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo $action['text']; ?>"><i class="fa fa-pencil"></i></a>
                                </td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="center" colspan="7"><?php echo $text_no_results_label; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <!-- /ListContent -->

            </div>
        </div>
    </div>
    <!-- /Content -->
<?php echo $footer; ?>