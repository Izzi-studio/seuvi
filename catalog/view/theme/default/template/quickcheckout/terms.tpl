
<div class="confirm">
  <a id="button-payment-method" class="button active">
    <?php echo $button_confirm_order; ?>
  </a>
</div>
<div class="agreement"><?php if ($text_agree) { ?>
  <?php if ($agree) { ?>
  <input type="checkbox" id="agreement" name="agree" value="1" checked="checked" />
  <?php } else { ?>
  <input type="checkbox" id="agreement" name="agree" value="1" checked="checked" />
  <?php } ?>
  <label for="agreement">
    <?php echo $text_agree; ?>
  </label>
  <?php } ?></div>