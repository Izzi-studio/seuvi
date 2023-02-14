<div class="f_cats">
        <div class="owl-carousel items">
            <?php foreach($categories as $cat){ ?>
                <div class="item">
                    <a href="<?php echo $cat['href']?>">
                        <div class="thumb">
                            <img src="<?php echo $cat['thumb']?>">
                        </div>
                        <div class="name">
                            <?php echo $cat['name']?>
                        </div>
                    </a>
                </div>
            <?php }?>
        </div>
</div>

<script type="text/javascript">
$('.f_cats .items').owlCarousel({
    autoPlay: 3000,
    singleItem: true,
    nav: true,
    dots:false,
    navText: ['<img src="/image/seuvi/left.svg">','<img src="/image/seuvi/right.svg">'],
    responsive : {
        0 : {
            items:2
        },
        992 : {
            items:3
        },
        1300 : {
            items:5
        }
    }
});
</script>