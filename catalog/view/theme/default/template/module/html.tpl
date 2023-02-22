<div class="html_module">
  <!--<?php if($heading_title) { ?>
    <h2><?php echo $heading_title; ?></h2>
  <?php } ?>-->
  <div class="container">
    <div class="html">
      <?php echo $html; ?>
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
  <script type="text/javascript">
    $(document).ready(function(){
      $('a.close_html').click(function(){
        $(this).closest('.html_module').find('.html>*').hide();
        $(this).hide();
        $('a.open_html').css('display','inline-flex');
      })
      $('a.open_html').click(function(){
        $(this).closest('.html_module').find('.html>*').show();
        $(this).hide();
        $('a.close_html').css('display','inline-flex');
      })
    })
  </script>
</div>
