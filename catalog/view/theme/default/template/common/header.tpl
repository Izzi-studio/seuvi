<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Open+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?><link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen">

  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  <script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
  <script src="catalog/view/theme/default/js/functions.js" type="text/javascript"></script>
</head>
<body class="<?php echo $class; ?>">
<div id="topnav">
  <div id="topban">
    <div class="container-fluid">
      <?php echo $text_header_osennie_skidki;?>
    </div>
  </div>
  <div class="top_info">
    <div class="container-fluid">
      <div class="row justify-content-between align-items-center">
        <div class="col-lg-4 flexed">
          <div class="addr">
            <?php echo $text_header_city;?>
          </div>
          <div class="phone">
            <a href="tel:<?php echo $telephone; ?>">
              <?php echo $telephone; ?>
            </a>
            <span class="drop">
              <img src="/image/seuvi/phone_drop.svg">
            </span>
            <div class="minidrop">
              <span><?php echo $text_header_grafik_raboty;?></span><br />
              <?php echo $time;?> <?php echo $text_header_bez_vyhodnyh;?>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="text-center top_delivery">
            <?php echo $text_header_besplatnaya_dostavka;?>
          </div>
        </div>
        <div class="col-lg-4 endpull">
          <div class="lang">
            <?php echo $language; ?>
          </div>
          <div class="top_user">
            <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>">
              <?php echo $text_account; ?>
            </a>
            <!--<ul class="dropdown-menu dropdown-menu-right">
              <?php if ($logged) { ?>
              <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
              <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
              <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
              <?php } else { ?>
              <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
              <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
              <?php } ?>
            </ul>-->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="main_header">
  <div class="container-fluid">
    <div class="row align-items-center justify-content-between">
      <div class="col-lg-5 col-4">
        <div class="mobonly flexed start">
          <div class="burger mobonly">
            <img src="/image/seuvi/burger.svg">
          </div>
          <div class="my_acc mobonly">
            <a href="<?php echo $account; ?>">
              <img src="/image/seuvi/acc.svg">
            </a>
          </div>
        </div>
        <div class="topmenu">
          <ul>
            <li>
              <a href="<?php echo $newest_link;?>">
                <?php echo $text_menu_new;?>
              </a>
            </li>
            <li>
              <a href="<?php echo $special_link;?>">
                <?php echo $text_menu_sale;?>
              </a>
            </li>
            <li>
              <a href="<?php echo $blog_link;?>">
                <?php echo $text_blog; ?>
              </a>
            </li>
            <li>
              <a href="<?php echo $review_link;?>">
                <?php echo $text_menu_otzivi;?>
              </a>
            </li>
            <li class="parent">
              <a href="#">
                <?php echo $text_menu_klientam;?>
              </a>
              <ul class="sub-menu">
                <?php foreach($informations as $information){ ?>
                        <li>
                          <a href="<?php echo $information['href'] ?>">
                            <?php echo $information['title']; ?>
                          </a>
                        </li>
                <?php } ?>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-lg-2 col-4 text-center">
        <a href="<?php echo $home; ?>">
          <img src="/image/seuvi/logo.svg" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="logo" />
        </a>
      </div>
      <div class="col-lg-5 col-4 flexed">
        <div class="search">
          <?php echo $search; ?>
        </div>
        <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
            <?php echo $wishlist_count; ?>
        </a>
        <?php echo $cart; ?>
      </div>
    </div>
  </div>
</div>
<div class="topcats">
  <div class="container-fluid">
  <ul class="mainmenu">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['children']) { ?>
    <li class="mega_parent">
      <a href="<?php echo $category['href']; ?>">
        <?php echo $category['name']; ?>
      </a>
      <div class="mega_level">
          <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
          <ul class="first_level">
            <?php foreach ($children as $child) { ?>
            <li>
              <a href="<?php echo $child['href']; ?>">
                <?php echo $child['name']; ?>
              </a>
              <?php if($child['children']){ ?>
                <ul class="second_level">
                  <?php foreach($child['children'] as $ch){ ?>
                   <li><a href="<?php echo $ch['href'];?>"><?php echo $ch['name'];?></a></li>
                  <?php }?>
                </ul>
              <?php }?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
      </div>
    </li>
  <?php } else { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
  <?php } ?>
  <?php } ?>
  </ul>
  </div>
</div>
<div class="mobmenu mobonly_block">
  <ul>
    <li class="goback">
      <a>Назад</a>
    </li>
    <li class="parent">
      <a href="#">
        Каталог
      </a>
      <ul class="sub-menu">
        <li class="goback_s">
          <a>Назад</a>
        </li>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="parent">
          <a href="<?php echo $category['href']; ?>">
            <?php echo $category['name']; ?>
          </a>
          <img src="/image/seuvi/mobmenu.svg" class="go_child">
            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
            <ul class="first_level">
              <li class="goback_s">
                <a>Назад</a>
              </li>
              <?php foreach ($children as $child) { ?>
              <li <?php if($child['children']){ ?>class="parent"<?php }?>>
                <a href="<?php echo $child['href']; ?>">
                  <?php echo $child['name']; ?>
                </a>
                <?php if($child['children']){ ?>
                <img src="/image/seuvi/mobmenu.svg" class="go_child">
                <ul class="second_level">
                  <li class="goback_s">
                    <a>Назад</a>
                  </li>
                  <?php foreach($child['children'] as $ch){ ?>
                  <li><a href="<?php echo $ch['href'];?>"><?php echo $ch['name'];?></a></li>
                  <?php }?>
                </ul>
                <?php }?>
              </li>
              <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </li>
    <li>
      <a href="<?php echo $newest_link;?>">
        <?php echo $text_menu_new;?>
      </a>
    </li>
    <li>
      <a href="<?php echo $special_link;?>">
        <?php echo $text_menu_sale;?>
      </a>
    </li>
    <li>
      <a href="<?php echo $blog_link;?>">
        <?php echo $text_blog; ?>
      </a>
    </li>
    <li>
      <a href="<?php echo $review_link;?>">
        <?php echo $text_menu_otzivi;?>
      </a>
    </li>
    <li class="parent">
      <a href="#">
        <?php echo $text_menu_klientam;?>
      </a>
      <ul class="sub-menu">
        <li class="goback_s">
          <a>Назад</a>
        </li>
        <?php foreach($informations as $information){ ?>
        <li>
          <a href="<?php echo $information['href'] ?>">
            <?php echo $information['title']; ?>
          </a>
        </li>
        <?php } ?>
      </ul>
    </li>
  </ul>
</div>

<script type="text/javascript">
  $(document).ready(function (){
    $('.burger').click(function (){
      $('.mobmenu').toggleClass('vis');
    });
    $('.mobmenu>ul>li.parent>a').click(function(e){
      e.preventDefault();
      $(this).next('ul').addClass('vis');
    });
    $('.mobmenu li.goback_s>a').click(function (){
      $(this).closest('ul').removeClass('vis');
    })
    $('.mobmenu>ul>li.goback>a').click(function (){
      $('.mobmenu').removeClass('vis');
    });
    $('.mobmenu li.parent .go_child').click(function (){
      $(this).next('ul').addClass('vis');
    })
  })
</script>