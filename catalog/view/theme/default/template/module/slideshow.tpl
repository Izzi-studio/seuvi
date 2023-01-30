<div id="slideshow<?php echo $module; ?>" class="owl-carousel mainslider" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6 offset-lg-5">
          <div class="b_title">
            <?php if ($banner['title']) { ?>
              <?php echo $banner['title']; ?>
            <?php } ?>
          </div>
          <div class="b_desc">
            <?php if ($banner['description']) { ?>
              <?php echo $banner['description']; ?>
            <?php } ?>
          </div>
          <div class="b_but">
            <?php if ($banner['btn_text']) { ?>
              <a href="<?php echo $banner['link']; ?>"><?php echo $banner['btn_text']; ?></a>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php } ?>
</div>

<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 1,
	autoPlay: 3000,
	singleItem: true,
	nav: true,
    dots:false,
	navText: ['<img src="/image/seuvi/banner_left.svg">','<img src="/image/seuvi/banner_right.svg">']
});
</script>