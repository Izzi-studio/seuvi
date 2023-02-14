<?php $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";?>
<div class="list-group">
  <?php if (!$logged) { ?>
    <a href="<?php echo $login; ?>" class="list-group-item">
      <?php echo $text_login; ?>
    </a>
    <a href="<?php echo $register; ?>" class="list-group-item">
      <?php echo $text_register; ?>
    </a>
    <a href="<?php echo $forgotten; ?>" class="list-group-item">
      <?php echo $text_forgotten; ?>
    </a>
  <?php } ?>
  <a href="<?php echo $account; ?>" class="list-group-item <?php if($actual_link == $account){echo 'active';}?>">
    <?php echo $text_account; ?>
  </a>
  <?php if ($logged) { ?>
    <a href="<?php echo $edit; ?>" class="list-group-item <?php if($actual_link == $edit){echo 'active';}?>">
      <?php echo $text_edit; ?>
    </a>
    <a href="<?php echo $password; ?>" class="list-group-item <?php if($actual_link == $password){echo 'active';}?>">
      <?php echo $text_password; ?>
    </a>
  <?php } ?>
  <a href="<?php echo $address; ?>" class="list-group-item <?php if($actual_link == $address){echo 'active';}?>">
    <?php echo $text_address; ?>
  </a>
  <a href="<?php echo $wishlist; ?>" class="list-group-item <?php if($actual_link == $wishlist){echo 'active';}?>">
    <?php echo $text_wishlist; ?>
  </a>
  <a href="<?php echo $order; ?>" class="list-group-item <?php if($actual_link == $order){echo 'active';}?>">
    <?php echo $text_order; ?>
  </a>
  <!--<a href="<?php echo $download; ?>" class="list-group-item">
    <?php echo $text_download; ?>
  </a>-->
  <!--<a href="<?php echo $recurring; ?>" class="list-group-item">
    <?php echo $text_recurring; ?>
  </a>-->
  <!--
  <a href="<?php echo $reward; ?>" class="list-group-item">
    <?php echo $text_reward; ?>
  </a>
  -->
  <a href="<?php echo $return; ?>" class="list-group-item <?php if($actual_link == $return){echo 'active';}?>">
    <?php echo $text_return; ?>
  </a>
  <a href="<?php echo $transaction; ?>" class="list-group-item <?php if($actual_link == $transaction){echo 'active';}?>">
    <?php echo $text_transaction; ?>
  </a>
  <a href="<?php echo $newsletter; ?>" class="list-group-item <?php if($actual_link == $newsletter){echo 'active';}?>">
    <?php echo $text_newsletter; ?>
  </a>
  <?php if ($logged) { ?>
    <a href="<?php echo $logout; ?>" class="list-group-item">
      <?php echo $text_logout; ?>
    </a>
  <?php } ?>
</div>
