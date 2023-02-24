<?php if(!empty($top_products)) { ?>
<div class="top_prods">
    <h3><?php echo $heading_title;?><br></h3>
    <div class="row hd">
        <div class="col-lg-6 col-8">
            <?php echo $text_name;?>
        </div>
        <div class="col-lg-4 offset-lg-2 col-4">
            <?php echo $text_price;?>
        </div>
    </div>
    <?php foreach($top_products as $prod){ ?>
    <div class="row">
        <div class="col-lg-6 col-8">
            <a href="<?php echo $prod['href']; ?>">
                <?php echo $prod['name']; ?>
            </a>
        </div>
        <div class="col-lg-4 offset-lg-2 col-4 price">
            <?php echo $prod['price']; ?>
        </div>
    </div>
    <?php }?>
</div>

<?php } ?>