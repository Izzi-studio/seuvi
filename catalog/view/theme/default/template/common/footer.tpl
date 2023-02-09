<footer>
  <div class="container">
    <div class="foot_cols">
      <div class="foot_col">
        <div class="foot_heading">
          <?php echo $heading_text_column_1; ?>
        </div>
        <ul>
          <li><a href="<?php echo $sitemap;?>"><?php echo $text_column_1_sitemap;?></a></li>
          <li><a href="<?php echo $contact;?>"><?php echo $text_column_1_contact_contact;?></a></li>
        </ul>
      </div>
      <div class="foot_col">
        <div class="foot_heading">
          <?php echo $heading_text_column_2; ?>
        </div>
        <ul>
          <?php foreach($informations as $info){ ?>
            <li><a href="<?php echo $info['href'];?>"><?php echo $info['title'];?></a></li>
          <?php } ?>
        </ul>
      </div>
      <div class="foot_col">
        <div class="foot_heading">
          <?php echo $heading_text_column_3; ?>
        </div>
        <ul>
          <li><a href="<?php echo $account;?>"><?php echo $text_column_3_account?></a></li>
          <li><a href="<?php echo $order;?>"><?php echo $text_column_3_text_order_history;?></a></li>
          <li><a href="<?php echo $wishlist;?>"><?php echo $text_column_3_wishlist;?></a></li>
        </ul>
      </div>
      <div class="foot_col">
        <div class="foot_heading">
          <?php echo $heading_text_column_4; ?>
        </div>
        <div class="infos">
          <div class="address">
            <?php echo html_entity_decode($address);?>
          </div>
          <div class="phones">
            <?php echo html_entity_decode($telephone_footer);?>
          </div>
          <div class="email">
            <a href="mailto:<?php echo $email_footer;?>">
              <?php echo $email_footer;?>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div class="social_footer">
      <div class="flexed">
        <?php if(!empty($fb_link)){ ?>
          <a href="<?php echo $fb_link;?>">
            <img src="/image/seuvi/fb_white.svg">
          </a>
        <?php }?>
        <?php if(!empty($inst_link)){ ?>
        <a href="<?php echo $inst_link;?>">
          <img src="/image/seuvi/inst_white.svg">
        </a>
        <?php }?>
        <?php if(!empty($tiktok_link)){ ?>
        <a href="<?php echo $tiktok_link;?>">
          <img src="/image/seuvi/tiktok_white.svg">
        </a>
        <?php }?>
        <?php if(!empty($tg_link)){ ?>
        <a href="<?php echo $tg_link;?>">
          <img src="/image/seuvi/tg_white.svg">
        </a>
        <?php }?>
      </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row align-items-center">
      <div class="col-lg-9">
        <div class="copyright">
          <?php echo $text_copyright;?><br/>
          <?php echo $text_copyright_bottom;?>
        </div>
      </div>
      <div class="col-lg-3">
        <div class="foot_icons">
          <img src="/image/seuvi/wallet.svg">
          <img src="/image/seuvi/np.svg">
          <img src="/image/seuvi/up.svg">
        </div>
      </div>
    </div>
  </div>

    <!--<div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <div class="copy">
      <?php echo $powered; ?>
    </div>-->
  </>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>