<?php echo $header; ?>
<div class="container-fluid">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php echo $content_top; ?>
  <h1 class="cat_title"><?php echo $heading_title; ?></h1>

  <!--Subcats-->
  <?php if ($categories) { ?>
  <div class="subcats">
          <ul>
            <?php $cat_count = 1; foreach ($categories as $category) { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php $cat_count++; } ?>
            <?php if($cat_count > 2){ ?>
            <li class="cat_count">
              <a class="open_subcats"><?php echo $text_allcats;?> <img src="/image/seuvi/allcats.svg"></a>
            </li>
            <script>
              $(document).ready(function(){
                $('a.open_subcats').click(function(){
                  $(this).hide();
                  $('.subcats ul li').css('display','inline-block');
                })
              })
              </script>
            <?php }?>
          </ul>
  </div>
  <?php } ?>
  <!--End subcats-->


  <div class="row cat_content">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

      <?php if ($products) { ?>
      <!--<p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>-->
      <div class="row">
        <!--<div class="col-md-4">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>-->
        <div class="col-12 mobflex">
            <a class="filter mobonly">
              <img src="/image/seuvi/filter.svg"> <?php echo $text_filter;?> (<span></span>)
            </a>
          <div class="mobnone checks">
            <div data-filter="flag_special">??????????</div>
            <div data-filter="flag_new">??????????????</div>
            <div data-filter="flag_bestseller">????????????????????</div>
          </div>
          <div id="input-sorting">
            <?php foreach ($sorts as $sorted) { ?>
            <?php if ($sorted['value'] == $sort . '-' . $order) { ?>
            <div class="inn"><?php echo $sorted['text']; ?></div>
            <?php } ?>
            <?php } ?>
              <ul class="minidrop">
                <?php foreach ($sorts as $sorting) { ?>
                <?php if ($sorting['value'] == $sort . '-' . $order) { ?>
                <li>
                  <a class="active" data-href="<?php echo $sorting['href']; ?>">
                    <?php echo $sorting['text']; ?>
                  </a>
                </li>
                <?php } else { ?>
                <li>
                  <a data-href="<?php echo $sorting['href']; ?>">
                    <?php echo $sorting['text']; ?>
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
              </ul>
          </div>
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sortp) { ?>
            <?php if ($sorts['value'] == $sortp . '-' . $order) { ?>
            <option value="<?php echo $sortp['href']; ?>" selected="selected"><?php echo $sortp['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sortp['href']; ?>"><?php echo $sortp['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <!--<div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>-->
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">

        </div>
        <?php } ?>
      </div>
      <div class="pagination_holder row">
        <div class="col-sm-6 text-left"><!-- <?php echo $pagination; ?> --></div>
        <div class="col-sm-6 text-right"><!-- <?php echo $results; ?> --></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
        <p><?php echo $text_empty; ?></p>
        <div class="buttons">
          <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
      <?php } ?>

    </div>
    </div>
  <div class="cat_bottom">
    <?php if ($description) { ?>
    <div class="cat_desc">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="desc_inn">
            <?php echo $description; ?>
          </div>
          <div class="c_but">
            <a class="open_html">
              <img src="/image/seuvi/plus.svg"><?php echo $text_open; ?>
            </a>
            <a class="close_html">
              <img src="/image/seuvi/minus.svg"><?php echo $text_close; ?>
            </a>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        $(document).ready(function(){
          $('a.close_html').click(function(){
            $(this).closest('.cat_desc').find('.desc_inn>*').hide();
            $(this).hide();
            $('a.open_html').css('display','inline-flex');
          })
          $('a.open_html').click(function(){
            $(this).closest('.cat_desc').find('.desc_inn>*').show();
            $(this).hide();
            $('a.close_html').css('display','inline-flex');
          })
        })
      </script>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $footer; ?>
