<div class="checkout-heading box-heading"><?php echo $text_cart; ?></div>

  <div class="quickcheckout-cart contrast_font">

      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php }else{ ?>
      <div class="alert alert-danger" style="display: none;">
          <i class="fa fa-exclamation-circle"></i>
          <?php echo $text_quant_warn; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php }?>

    <?php if ($products || $vouchers) { ?>
	<div>
        <div class="">
        <?php foreach ($products as $product) { ?>
        <div class="item row">
            <div class="col-lg-3 col-4">
                  <div class="image mobile_hide"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                    <?php } ?>
                  </div>
            </div>
            <div class="col-lg-6 col-8">
              <div class="name">
                  <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      , <?php echo $option['value']; ?>
                      <?php } ?></a>
                  <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                <div>


                  <?php if ($product['recurring']) { ?>
                  <small><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></small>
                  <?php } ?>
                </div>
              </div>
                <div class="mobflexed">
              <div class="quant">
                  <?php if ($edit_cart) { ?>
                  <div class="minus">-</div>
                     <input type="text" readonly name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" />
                  <div class="plus">+</div>

                     <a style="display:none;" data-tooltip="<?php echo $button_update; ?>" class="button-update sq_icon"><i class="fa fa-refresh"></i></a>
                <?php } else { ?>
                  x&nbsp;<?php echo $product['quantity']; ?>
                <?php } ?>
              </div>
                <div class="total mobonly"><?php echo $product['total']; ?></div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="flexed_col">
                  <!--<div class="unit-price mobile_hide"><?php echo $product['price']; ?></div>-->
                    <a href="<?php echo $product['cart_id']; ?>" data-tooltip="<?php echo $button_remove; ?>" class="button-remove sq_icon remove_prod" data-remove="<?php echo $product['cart_id']; ?>">
                        <img src="/image/seuvi/remove.svg">
                    </a>
                  <div class="total mobnone"><?php echo $product['total']; ?></div>
                </div>
            </div>
        </div>
        <?php } ?>
        </div>

        <?php foreach ($vouchers as $voucher) { ?>
        <div>

          <div class="image mobile_hide"></div>
          <div class="name"><?php echo $voucher['description']; ?></div>
          <div class="quantity">x&nbsp;1</div>
		  <div class="price mobile_hide"><?php echo $voucher['amount']; ?></div>
          <div class="total"><?php echo $voucher['amount']; ?></div>
        </div>
        </div>
        <?php } ?>
        </div>
        <!--<div class="quickcheckout-cart contrast_font" style="margin-top:-1px">
            <div>
                <?php foreach ($totals as $total) { ?>
                    <div>
                        <div style="text-align:right;" colspan="4"><?php echo $total['title']; ?>:</div>
                        <div style="text-align:right;"><?php echo $total['text']; ?></div>
                    </div>
                <?php } ?>
            </div>
        </div>-->
    <?php } ?>
</table>
<div class="total_cost">
    <div class="name">
        <?php echo $entry_total; ?>
    </div>
    <div class="total_sum">
        <?php echo $total_order_sum; ?>
    </div>
</div>
<div class="row bottom_border">
    <div class="col-12">
        <input type="checkbox" name="callme" id="callme_check" value="0" checked/>
        <label for="callme_check"><?php echo $entry_call_me; ?></label>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function (){
        $('.quant .plus').click(function (){
            let quant_input = $(this).parent().find('input');
            quant_input.val(parseInt(quant_input.val()) + 1);
            $(this).parent().find('.button-update').click();
        })
        $('.quant .minus').click(function (){
            let quant_input = $(this).parent().find('input');
            if(quant_input.val() > 1){
                quant_input.val(parseInt(quant_input.val()) - 1);
                $(this).parent().find('.button-update').click();
            }
        })
    })
</script>