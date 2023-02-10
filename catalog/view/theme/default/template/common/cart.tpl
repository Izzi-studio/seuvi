<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="modal" data-target="#minicart" class="dropdown-toggle">
    <span id="cart-total"><?php echo $text_items; ?></span>
  </button>
  <div id="minicart" class="modal fade">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="topper">
          <h3><?php echo $text_cart_name;?></h3>
          <a class="closemodal_cart"><img src="/image/seuvi/close.svg"></a>
        </div>
    <ul class="load_json">
    <?php if ($products || $vouchers) { ?>
    <li>
      <div class="cart_prods">
        <?php foreach ($products as $product) { ?>
        <div class="row align-items-center">
          <div class="col-md-2">
            <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>" class="image">
              <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
            </a>
            <?php } ?>
          </div>
          <div class="col-md-5">
            <a href="<?php echo $product['href']; ?>" class="prod_name">
              <?php echo $product['name']; ?>
            </a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <div class="prod_option">
              <?php echo $option['value']; ?>
            </div>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
          </div>
          <div class="col-md-2 quant">x <?php echo $product['quantity']; ?></div>
          <div class="col-md-2 total"><?php echo $product['total']; ?></div>
          <div class="col-md-1">
            <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="remove_prod">
              <img src="/image/seuvi/remove.svg">
            </button>
          </div>
        </div>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <div class="row">
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </div>
        <?php } ?>
      </div>
    </li>
    <li>
      <div class="tots">
        <div class="row align-items-center">
          <div class="col-lg-4">
            <a class="continue">
              <?php echo $text_continue_shopping;?>
            </a>
          </div>
          <div class="col-lg-8">
            <div class="bbg">
            <div class="row align-items-center">
              <div class="col-lg-6">
                  <div class="text_total"><?php echo $text_total;?></div>
                  <div class="val_total"><?php echo $totals[1]['text']; ?></div>
              </div>
              <div class="col-lg-6">
                <a href="<?php echo $checkout; ?>" class="checkout_btn">
                  <?php echo $text_checkout; ?>
                </a>
              </div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function (){
    $('a.closemodal_cart,#minicart a.continue').click(function (){
      $('#minicart').modal('toggle');
    })
  })
</script>
