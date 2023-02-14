<div class="consult">
    <div class="row no-gutters">
        <div class="col-lg-5 girl_bg"></div>
        <div class="col-lg-7">
            <img class="stamp" src="/image/seuvi/consult_stamp.svg" />
            <div class="row">
                <div class="col-lg-8">
                    <h3><?php echo $heading_title; ?></h3>
                </div>
            </div>
            <div class="desc">
                <?php echo $text_description; ?>
            </div>
            <form action="<?php echo $action; ?>" id="order_consult" method="post">
                <input required="required" type="text" name="phone" placeholder="<?php echo$text_your_phone; ?>" />
                <input type="submit" value="<?php echo $text_get_consultation; ?>" />
            </form>
        </div>
    </div>
</div>
<div id="consult_thanks" class="modal fade">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <?php echo $text_thanks;?>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#order_consult').on('submit',function(e){
        e.preventDefault();
        $.ajax({
            type:"POST",
            url:'/index.php?route=information/contact/orderConsultation',
            data:jQuery(this).serialize(),
            dataType:"html",
            beforeSend: function(){
                jQuery('#order_consult input[type="submit"]').attr('disabled','disabled');
            },
            success: function(data){
                jQuery('#order_consult input[type="submit"]').removeAttr('disabled');
                jQuery('#consult_thanks').modal('toggle');
            }
        })
    });
</script>