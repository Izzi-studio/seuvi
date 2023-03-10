<?php echo $header; ?>
<div class="container-fluid">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <h1 class="mobonly prod_h"><?php echo $heading_title; ?></h1>
  <div class="flexed_sku mobonly">
    <div class="sku">
      <span><?php echo $text_sku; ?></span>
      <?php echo $sku; ?>
    </div>
    <div class="rate_com">
    <?php if ($review_status) { ?>
    <div class="rating">

      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($rating < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
      <?php } ?>
      <?php } ?>
      <!-- AddThis Button BEGIN
      <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
      <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
      AddThis Button END -->
    </div>
    <div class="revnum"><?php echo $reviews_count; ?></div>
    <?php } ?>
    </div>
  </div>
  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> prod_main">
      <?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="col-lg-7">
          <button type="button" class="btn_wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">
            <img src="/image/seuvi/wish_icon.svg">
          </button>
          <div class="owl-carousel prod_gal">
            <?php $i = 1;
            if ($thumb) { ?>
              <div class="item" data-hash="thumb0">
                <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
              </div>
            <?php }?>
            <?php if ($images) { ?>
              <?php foreach ($images as $image) { ?>
                <div class="item" data-hash="thumb<?php echo $i;?>">
                  <img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
                </div>
              <?php $i++; } ?>
            <?php } ?>
          </div>
          <div class="hash_nav">
            <?php $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
            $i = 1;
            if ($thumb) { ?>
            <a class="active" href="<?php echo $actual_link;?>#thumb0">
              <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
            </a>
            <?php }?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <a href="<?php echo $actual_link;?>#thumb<?php echo $i;?>">
              <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
            </a>
            <?php $i++; } ?>
            <?php } ?>
          </div>

          <script type="text/javascript">
            $(document).ready(function () {
              $('.prod_gal').owlCarousel({
                items:1,
                nav: true,
                URLhashListener:true,
                dots:false,
                navText: ['<img src="/image/seuvi/left.svg">','<img src="/image/seuvi/right.svg">'],
                responsive : {
                  0 : {
                    dots:true
                  },
                  992:{
                    dots:false
                  }
                }
              });
              var owl = $('.prod_gal');
              owl.on('changed.owl.carousel', function(event) {
                var url = window.location.href;
                $('.hash_nav a.active').removeClass('active');
                $('.hash_nav a[href="'+url+'"]').addClass('active');
              })
            })
          </script>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="col-lg-5">
          <!--<div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          </div>-->
          <div class="man_img mobnone">
            <img src="<?php echo $manufacturer_image;?>">
          </div>
          <h1 class="mobnone"><?php echo $heading_title; ?></h1>
          <div class="flexed mobnone">
            <div class="sku">
              <span><?php echo $text_sku; ?></span>
              <?php echo $sku; ?>
            </div>
            <?php if ($review_status) { ?>
            <div class="rating">

                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($rating < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              <!-- AddThis Button BEGIN
              <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
              AddThis Button END -->
            </div>
            <div class="revnum"><?php echo $reviews_count; ?></div>
            <?php } ?>
          </div>






          <!--<ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
          </ul>-->

          <div id="product">

            <?php if ($options) { ?>
            <div class="options">
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
              <form>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <!--<label class="control-label"><?php echo $option['name']; ?></label>-->
                <div id="input-option<?php echo $option['product_option_id']; ?>" class="radgroup">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <input type="radio" id="prod_option_<?php echo $option_value['product_option_value_id']; ?>"
                           name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"
                           data-option-price = "<?php echo $option_value['price']; ?>"
                           data-price-special = "<?php echo $option_value['price_special']; ?>"
                           data-percent-sale = "<?php echo $option_value['percent_sale']; ?>" <?php if ($option_value['default_selected']) { ?> checked <?php } ?>/>
                    <label for="prod_option_<?php echo $option_value['product_option_value_id']; ?>">
                      <?php echo $option_value['name']; ?>
                      <!--<?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>-->
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              </form>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            </div>
            <?php } ?>


            <?php if ($price) { ?>
            <div class="price">
              <?php if (!$special) { ?>
                <span class="price-new"><?php echo $price; ?></span>
              <?php } else { ?>
                <span class="price-old"><?php echo $price; ?></span>
                <span class="price-new"><?php echo $special; ?></span>
              <?php } ?>
            </div>
            <?php } ?>

            <!--<?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>-->
            <div class="form-group addtocart">
              <div class="quant">
                <div class="minus">-</div>
                <input readonly type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                <div class="plus">+</div>
                <script type="text/javascript">
                  $(document).ready(function (){
                    $('.quant .plus').click(function (){
                      $('.quant input').val(parseInt($('.quant input').val()) + 1);
                    })
                    $('.quant .minus').click(function (){
                      if($('.quant input').val() > 1){
                        $('.quant input').val(parseInt($('.quant input').val()) - 1);
                      }
                    })
                  })
                </script>
              </div>
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block">
                <?php echo $button_cart; ?> <img src="/image/seuvi/cart_white.svg">
              </button>
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>

            <div class="gift_consult">
              <img src="/image/seuvi/gift.svg"> <?php echo $text_get_free_consultation; ?>
            </div>
          <div class="prod_drops">
            <div class="item">
              <div class="name">
                <?php echo $text_shipping; ?>
                <img src="/image/seuvi/prod_drop.svg">
              </div>
              <div class="desc">
                <?php echo $description_shipping; ?>
              </div>
            </div>
            <div class="item">
              <div class="name">
                <?php echo $text_pay; ?>
                <img src="/image/seuvi/prod_drop.svg">
              </div>
              <div class="desc">
                <?php echo $description_pay; ?>
              </div>
            </div>
            <div class="item">
              <div class="name">
                <?php echo $text_return; ?>
                <img src="/image/seuvi/prod_drop.svg">
              </div>
              <div class="desc">
                <?php echo $description_return; ?>
              </div>
            </div>
          </div>
            <script type="text/javascript">
              $(document).ready(function (){
                $('.prod_drops .name').click(function (){
                  $(this).parent().toggleClass('active');
                  $(this).next('.desc').slideToggle();
                })
              })
            </script>
          </div>



        </div>
        <div class="col-12 prod_tabs">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
            <li><a href="#tab-cosmetology" data-toggle="tab"><?php echo $tab_beautician_comment; ?></a></li>
          </ul>
          <script type="text/javascript">
            $(document).ready(function (){
              $('.prod_tabs .nav-tabs li a').click(function (){
                $('.prod_tabs .nav-tabs li.active').removeClass('active');
                $(this).parent().addClass('active');
              })
            })
          </script>
          <div class="row justify-content-center">
            <div class="col-lg-10">
          <div class="tab-content">

            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                <tr>
                  <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                <tr>
                  <td><?php echo $attribute['name']; ?></td>
                  <td><?php echo $attribute['text']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div>
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div>
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div>
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
            <div class="tab-pane" id="tab-cosmetology">
              <?php echo $beautician_comment; ?>
            </div>
          </div>
            </div>
          </div>
        </div>
      </div>

    </div>
<div class="col-12">
    <?php if ($products) { ?>
    <div class="f_cat spec prod_car">
      <h3><?php echo $text_related; ?></h3>
      <div class="owl-carousel prods_list">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <div class="product-layout item">
          <div class="product-thumb transition">
            <div class="image">
              <?php if($product['on_wishlist']){ ?>
                <a href="/wishlist/?remove=<?php echo $product['product_id']?>" class="btn_wishlist remove_wish">
                  <img src="/image/seuvi/wish_icon_added.png">
                </a>
              <?php }else{ ?>
                <button type="button" class="btn_wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><img src="/image/seuvi/wish_icon.svg"></button>
              <?php }?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
              <div class="prod_labels">
                <?php if ($product['new']) { ?>
                <div class="lab newlab">NEW</div>
                <?php } ?>
                <?php if ($product['special']) { ?>
                <div class="lab">SALE</div>
                <?php } ?>
                <?php if($product['percent_sale']) { ?>
                <div class="lab">-<?php echo $product['percent_sale']; ?> %</div>
                <?php } ?>
              </div>
            </div>
            <div class="flexed">
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php }else{ ?>
              <div class="rating">
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
              </div>
              <?php }?>
              <div class="revnum">
                <?php echo $product['reviews'];?>
              </div>
            </div>
            <div class="caption">
              <a class="prodname" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div class="prod_brand"><?php echo $product['manufacturer']; ?></div>

              <!--<p><?php echo $product['description']; ?></p>-->

              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span>
                <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
                <!--<?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>-->
              </div>
              <?php } ?>
            </div>
            <div class="abs">
              <div id="product-special-<?php echo $product['product_id']; ?>">
                <?php foreach ($product['options'] as $option) { ?>
                <?php if ($option['type'] == 'radio') { ?>
                <form>
                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <!--<label class="control-label"><?php echo $option['name']; ?></label>-->
                  <div id="input-option<?php echo $option['product_option_id']; ?>" class="radgroup">
                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                    <div class="radio">
                      <input type="radio" id="prod_option_<?php echo $option_value['product_option_value_id']; ?>_<?php echo $product['product_id']?>"
                             name="option[<?php echo $option['product_option_id']; ?>]"
                             value="<?php echo $option_value['product_option_value_id']; ?>"
                             data-option-price = "<?php echo $option_value['price']; ?>"
                             data-price-special = "<?php echo $option_value['price_special']; ?>"
                             data-percent-sale = "<?php echo $option_value['percent_sale']; ?>" <?php if ($option_value['default_selected']) { ?> checked <?php } ?>/>
                      <label for="prod_option_<?php echo $option_value['product_option_value_id']; ?>_<?php echo $product['product_id']?>">
                        <?php echo $option_value['name']; ?>
                        <!--<?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>-->
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
                </form>
                <?php } ?>
                <?php } ?>
                <input type="hidden" name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
                <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
              </div>
              <div class="button-group">
                <?php if(!empty($product['options'])) { ?>
                <button class="addto mobnone" type="button" onclick="cart.quickadd('<?php echo $product['product_id']; ?>',1,'special');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span><img src="/image/seuvi/bag.svg"></button>
                <a class="addto mobonly" href="<?php echo $product['href']; ?>"><span><?php echo $button_cart; ?></span><img src="/image/seuvi/bag.svg"></a>
                <?php }else{ ?>
                <button class="addto" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>',1);"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span><img src="/image/seuvi/bag.svg"></button>
                <?php } ?>
                <!--<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>-->
              </div>
            </div>
          </div>
        </div>
        <?php $i++; ?>
        <?php } ?>
      </div>
    </div>
    <script type="text/javascript">
      $('.f_cat.spec .prods_list').owlCarousel({
        autoPlay: 3000,
        singleItem: true,
        nav: true,
        dots:false,
        navText: ['<img src="/image/seuvi/left.svg">','<img src="/image/seuvi/right.svg">'],
        responsive : {
          0 : {
            items:2
          },
          992 : {
            items:3
          },
          1300 : {
            items:4
          }
        }
      });
    </script>
    <?php } ?>



    <?php if ($tags) { ?>
    <p><?php echo $text_tags; ?>
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
      <?php if ($i < (count($tags) - 1)) { ?>
      <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
      <?php } else { ?>
      <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
      <?php } ?>
      <?php } ?>
    </p>
    <?php } ?>


    <?php echo $content_bottom; ?>
</div>



    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				//$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				//$('html, body').animate({ scrollTop: 0 }, 'slow');
              $('#cart > button.dropdown-toggle').click();
				$('#cart ul.load_json').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
