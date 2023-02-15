
<div class="product-layout cat_layout col-12" style="width: 100%;">
    <div class="row">
<?php foreach ($products as $product) { ?>
    <div class="col-lg-4">

    <div class="product-layout item">
        <div class="product-thumb transition">
            <div class="image">
                <?php if($product['on_wishlist']){ ?>
                <a href="/wishlist/?remove=<?php echo $product['product_id']?>" class="btn_wishlist remove_wish">
                    <img src="/image/seuvi/wish_icon_added.png">
                </a>
                <?php }else{ ?>
                    <button type="button" class="btn_wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><img src="/image/seuvi/wish_icon.svg"></button>
                <?php } ?>
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
                    <button class="addto" type="button" onclick="cart.quickadd('<?php echo $product['product_id']; ?>',1,'special');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span><img src="/image/seuvi/bag.svg"></button>
                    <?php }else{ ?>
                    <button class="addto" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>',1);"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span><img src="/image/seuvi/bag.svg"></button>
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