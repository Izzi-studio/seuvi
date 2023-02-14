<div id="login">
<div class="row">
  <div class="col-sm-6">
	  <input placeholder="<?php echo $entry_email; ?>" type="text" name="email" value="" class="form-control" id="input-login-email" />
  </div>
  
  <div class="col-sm-6">
	  <input placeholder="<?php echo $entry_password; ?>" type="password" name="password" value="" class="form-control" />
  </div>
  </div>
  <div class="text-right">
  <input type="button" value="<?php echo $button_login; ?>" id="button-login" class="btn btn-primary" />
  </div>
  
</div>

<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-login').click();
	}
});
//--></script>   