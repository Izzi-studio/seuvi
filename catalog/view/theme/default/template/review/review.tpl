<?php echo $header; ?>
<div class="container-fluid">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <h1><?php echo $heading_title; ?></h1>
    <div class="main_revs container">
        <?php foreach($reviews as $rev){ ?>
            <div class="item">
                <div class="author">
                    <img src="<?php echo $rev->profile_photo_url ;?>" class="ava">
                    <div class="name_rev">
                        <div class="name">
                            <?php echo $rev->author_name ;?>
                        </div>
                        <div class="rating">
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($rev->rating < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="desc">
                    <?php echo $rev->text; ?>
                </div>
            </div>
        <?php }?>
    </div>
</div>
<?php echo $footer; ?>