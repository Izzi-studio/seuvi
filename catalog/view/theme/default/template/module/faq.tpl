<div class="faqs">
    <h3><?php echo $heading_title; ?></h3>
    <?php foreach($faqs as $faq){ ?>
        <div class="item">
            <div class="question">
                <span>🌿</span>  <?php echo $faq['title'] ?>
                <img src="/image/seuvi/faq_drop.svg">
            </div>
            <div class="answer">
                <?php echo $faq['description'] ?><br>
            </div>
        </div>
    <?php } ?>
    <script type="text/javascript">
        $(document).ready(function (){
            $('.faqs .question').click(function(){
                $(this).parent().toggleClass('opened');
                $(this).next('.answer').slideToggle();
            })
        })
    </script>
</div>
