<?php if (count($languages) > 1) { ?>
<div class="pull-left">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">

    <span class="hidden-xs hidden-sm hidden-md">
      <?php foreach ($languages as $language) { ?>
       <?php if ($language['code'] == $code) { ?>
         <?php echo $language['name']; ?>
       <?php } ?>
      <?php } ?>
    </span>
    <ul class="dropdown-menu">
      <?php foreach ($languages as $language) { ?>
      <li>
        <a href="<?php echo $language['code']; ?>">
          <?php echo $language['name']; ?>
        </a>
      </li>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
