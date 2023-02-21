<div class="mobonly_block mob_cats">
  <a href="<?php echo $link_manufacturers; ?>">
    <img src="/image/seuvi/mobcat1.svg">
    <?php echo $text_manufacturers;?>
  </a>

  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
    <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
    <a href="<?php echo $child['href']; ?>" class="active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } else { ?>
    <a href="<?php echo $child['href']; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>">
    <img src="<?php echo $category['image']; ?>">
    <?php echo $category['name']; ?>
  </a>
  <?php } ?>
  <?php } ?>
</div>
