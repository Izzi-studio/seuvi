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
<?php } ?>

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
      <div class="col-lg-5">
        <div class="topmenu">
          <ul>
            <li>
              <a href="#">
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
              <a href="#">
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
      <div class="col-lg-2 text-center">
        <a href="<?php echo $home; ?>">
          <img src="/image/seuvi/logo.svg" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="logo" />
        </a>
      </div>
      <div class="col-lg-5 flexed">
        <div class="search">
          <?php echo $search; ?>
        </div>
        <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
            <?php echo $text_wishlist; ?>
        </a>
        <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
          <?php echo $text_shopping_cart; ?>
        </a>
      </div>
    </div>
  </div>
</div>


<!--
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>

    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown">

        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">

      <?php echo $text_svernut;?>
      <?php echo $text_razsvernut;?>

    </div>

  </div>
      <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
-->