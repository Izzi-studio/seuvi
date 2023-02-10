<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	 <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">	
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
        <div class="form-group">
		<label class="col-sm-2 control-label" for="input-field"><?php echo $entry_status; ?></label>
			<div class="col-sm-10">
				<select class="form-control" name="ukrposhta_status">
				  <?php if ($ukrposhta_status) { ?>
				  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				  <option value="0"><?php echo $text_disabled; ?></option>
				  <?php } else { ?>
				  <option value="1"><?php echo $text_enabled; ?></option>
				  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				  <?php } ?>
				</select>
			</div>
	</div>

        <div class="form-group required">
		<label class="col-sm-2 control-label" for="input-field">
			API URL Укрпочта
		</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" name="ukrposhta_api_url" value="<?php echo $ukrposhta_api_url; ?>" />
			<?php if ($error_api_url) { ?>
	              		<div class="text-danger"><?php echo $error_api_url; ?></div>
			<?php } ?>
		</div>
	</div>
        <div class="form-group required">
		<label class="col-sm-2 control-label" for="input-field">
			API KEY
		</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" name="ukrposhta_api_key" value="<?php echo $ukrposhta_api_key; ?>" />
			<?php if ($error_api_key) { ?>
	              		<div class="text-danger"><?php echo $error_api_key; ?></div>
			<?php } ?>
		</div>
	</div>

        <div class="form-group">
		<label class="col-sm-2 control-label" for="input-field">
			<?php echo $entry_sort_order; ?>
		</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" name="ukrposhta_sort_order" value="<?php echo $ukrposhta_sort_order; ?>" size="1" />
		</div>
	</div>
    </form>
   </div>
  </div>
 </div>
</div>
<?php echo $footer;