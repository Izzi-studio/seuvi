<div class="consult">
    <div class="row no-gutters">
        <div class="col-lg-5 girl_bg"></div>
        <div class="col-lg-7">
            <img class="stamp" src="/image/seuvi/consult_stamp.svg" />
            <h3><?php echo $heading_title; ?></h3>
            <div class="desc">
                <?php echo $text_description; ?>
            </div>
            <form action="<?php echo $action; ?>" method="post">
                <input type="text" name="phone" placeholder="<?php echo$text_your_phone; ?>" />
                <input type="submit" value="<?php echo $text_get_consultation; ?>">
            </form>
        </div>
    </div>
</div>
