<?php echo $header; ?>
<div class="container-fluid">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($products) { ?>
      <!--<table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-center"><?php echo $column_image; ?></td>
            <td class="text-left"><?php echo $column_name; ?></td>
            <td class="text-left"><?php echo $column_model; ?></td>
            <td class="text-right"><?php echo $column_stock; ?></td>
            <td class="text-right"><?php echo $column_price; ?></td>
            <td class="text-right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-center"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
            <td class="text-left"><?php echo $product['model']; ?></td>
            <td class="text-right"><?php echo $product['stock']; ?></td>
            <td class="text-right"><?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                <?php } ?>
              </div>
              <?php } ?></td>
            <td class="text-right"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>

          </tr>
          <?php } ?>
        </tbody>
      </table>-->
      <div class="cat_layout">
        <div class="row">
          <?php foreach ($products as $product) { ?>
          <div class="col-lg-4">
            <!--<div class="item contrast_font product-layout" style="display: none">
              <div class="image">
                <?php if ($product['special'] && $cosyone_percentage_sale_badge == 'enabled') { ?>
                <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
                <?php } ?>
                <?php if ($product['thumb_hover'] && $cosyone_rollover_effect == 'enabled') { ?>
                <div class="image_hover"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_hover']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                <?php } elseif ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                <?php } ?>

              </div>
              <div class="information_wrapper">
                <div class="left">
                  <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                  <?php if ($product['brand_name'] && $cosyone_brand) { ?>
                  <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                  <?php } ?>
                  <?php if ($product['rating']) { ?>
                  <div class="rating">
                    <span class="rating r<?php echo $product['rating']; ?>">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </span>
                  </div>
                  <?php } ?>
                </div>
                <div class="description main_font"><?php echo $product['description']; ?></div>
                <?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $product['price']; ?></span>
                  <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <br />
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </div>
                <?php } ?>
                <div class="cart">
                  <button type="submit" class="button contrast" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                </div>
                <div class="icons_wrapper">
                  <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
                  <a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>

                  <a class="sq_icon contrast add_to_cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-tooltip="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a>
                  <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
                  <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
                </div>

                <?php if (($product['special']) && ($product['special_date_end'] > 0) && ($cosyone_product_countdown)) { ?>
                <div class="offer_popup">
                  <div class="offer_background"></div>
                  <div class="offer_content">
                    <div class="countdown <?php echo $product['product_id']; ?>"></div>
                    <?php if ($cosyone_product_hurry) { ?>
                    <span class="hurry main_font"><?php echo $product['stock_quantity']; ?></span>
                    <?php } ?>
                  </div>
                </div>
                <script type="text/javascript">
                  $('.<?php echo $product['product_id']; ?>').countdown({
                    until: <?php echo $product['special_date_end']; ?>,
		layout: '<span class="main_font"><?php echo $text_category_expire; ?></span><br /><i>{dn}</i> {dl}&nbsp; <i>{hn}</i>  {hl}&nbsp; <i>{mn}</i>  {ml}&nbsp; <i>{sn}</i> {sl}'});
                </script>
                <?php } ?>
              </div>
            </div>

            -->
            <div class="product-layout item">
              <div class="product-thumb transition">
                <div class="image">
                  <a href="<?php echo $product['remove']; ?>" class="remove_prod">
                    <img src="/image/seuvi/remove.svg">
                  </a>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                  <div class="prod_labels">
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
                    <?php } ?>
                    <input type="hidden" name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
                    <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
                  </div>
                  <div class="button-group">
                    <?php if(!empty($product['options'])) { ?>
                    <button class="addto" type="button" onclick="cart.quickadd('<?php echo $product['product_id']; ?>',1,'special');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                    <?php }else{ ?>
                    <button class="addto" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>',1);"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                    <?php } ?>
                    <!--<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>-->
                  </div>
                </div>
              </div>
              <script>
                $('.product-layout.item .radgroup input').change(function (){
                  let curprod = $(this).closest('.product-layout');
                  let price = $(this).data('price-special');
                  let old_price = $(this).data('option-price');
                  if(price!==''){
                    curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
                  }else{
                    curprod.find('.price').html(old_price);
                  }
                });
                $('.product-layout.item').each(function (){
                  if($(this).find('.radgroup input:checked').length>0){
                    let curprod = $(this);
                    let price = $(this).find('.radgroup input:checked').data('price-special');
                    let old_price = $(this).find('.radgroup input:checked').data('option-price');
                    if(price!==''){
                      curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
                    }else{
                      curprod.find('.price').html(old_price);
                    }
                  }
                });
              </script>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>