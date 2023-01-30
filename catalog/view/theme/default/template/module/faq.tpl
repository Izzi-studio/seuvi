<?php echo $heading_title; ?><br>
<?php foreach($faqs as $faq){ ?>
    <?php echo $faq['title'] ?><br>
    <?php echo $faq['description'] ?><br>
<?php } ?>

