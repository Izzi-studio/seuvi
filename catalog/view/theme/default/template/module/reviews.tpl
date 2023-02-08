<div class="prod_revs">
    <h3><?php echo $heading_title;?></h3>
    <div class="owl-carousel prod_revs_car">
        <?php foreach($reviews as $rev){ ?>
            <div class="item">
                <div class="rev">
                    <div class="flexed_info">
                        <div class="image">
                            <img src="<?php echo $rev['product_image']; ?>">
                        </div>
                        <div class="info">
                            <div class="author_date">
                                <div class="author">
                                    <?php echo $rev['author']; ?>
                                </div>
                                <div class="date">
                                    <?php echo $rev['date_added']; ?>
                                </div>
                            </div>
                            <div class="name">
                                <?php echo $rev['product_name']; ?>
                            </div>
                            <div class="price">
                                <?php echo $rev['product_price']; ?>
                            </div>
                            <?php if ($rev['rating']) { ?>
                            <div class="rating">
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                <?php if ($rev['rating'] < $i) { ?>
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
                        </div>
                    </div>
                    <div class="desc">
                        <?php echo $rev['text']; ?>
                    </div>
                </div>
            </div>
        <?php }?>
    </div>
    <script type="text/javascript">
        $('.prod_revs_car').owlCarousel({
            items: 3,
            autoPlay: 3000,
            nav: true,
            dots:false,
            navText: ['<img src="/image/seuvi/left.svg">','<img src="/image/seuvi/right.svg">']
        });
    </script>
</div>

