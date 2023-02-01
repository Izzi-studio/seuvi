<div class="brands">
    <div class="container">
        <h3><?php echo $heading_title; ?></h3>
        <div class="row no-gutters">
            <?php foreach($manufacturers as $brand){ ?>
                <div class="col-lg-20">
                    <a class="item" href="<?php echo $brand['href']; ?>">
                        <img src="<?php echo $brand['thumb']; ?>" title="<?php echo $brand['name']; ?>">
                    </a>
                </div>
            <?php } ?>
            <div class="col-lg-20">
                <a class="item" href="<?php echo $link_all; ?>">
                    <?php echo $manufacturers_count; ?> +<br />
                    <?php echo $text_brendov; ?>
                </a>
            </div>
        </div>
    </div>
</div>