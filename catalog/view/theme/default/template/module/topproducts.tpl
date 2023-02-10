<div class="top_prods">
    <h3><?php echo $heading_title;?><br></h3>
    <div class="row hd">
        <div class="col-lg-6">
            <?php echo $text_name;?>
        </div>
        <div class="col-lg-4 offset-lg-2">
            <?php echo $text_price;?>
        </div>
    </div>
    <?php foreach($top_products as $prod){ ?>
    <div class="row">
        <div class="col-lg-6">
            <a href="<?php echo $prod['href']; ?>">
                <?php echo $prod['name']; ?>
            </a>
        </div>
        <div class="col-lg-4 offset-lg-2 price">
            <?php echo $prod['price']; ?>
        </div>
    </div>
    <?php }?>
</div>