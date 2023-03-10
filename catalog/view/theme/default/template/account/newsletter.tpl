<?php echo $header; ?>
<div class="container-fluid">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
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
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group">
            <label class="control-label"><?php echo $entry_newsletter; ?></label>
            <div>
              <?php if ($newsletter) { ?>

                <input type="radio" name="newsletter" id="n_yes" value="1" checked="checked" />
                <label class="radio-inline" for="n_yes"><?php echo $text_yes; ?> </label>

                <input type="radio" name="newsletter" id="n_no" value="0" />
                <label class="radio-inline" for="n_no"><?php echo $text_no; ?></label>
              <?php } else { ?>
                <input type="radio" name="newsletter" id="n_yes" value="1" />
                <label class="radio-inline" for="n_yes"><?php echo $text_yes; ?> </label>

                <input type="radio" name="newsletter" id="n_no" value="0" checked="checked" />
                <label class="radio-inline" for="n_no"><?php echo $text_no; ?></label>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>