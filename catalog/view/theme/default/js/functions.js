$(document).ready(function (){
    $('.topmenu li.parent>a').click(function (e){
        e.preventDefault();
        $(this).toggleClass('active');
        $(this).next('ul.sub-menu').slideToggle();
    })
    $('.f_cat .product-layout').mouseenter(function () {
        $(this).closest('.owl-carousel').css('z-index','9');
    });

    $('.f_cat .product-layout').mouseleave(function () {
        $(this).closest('.owl-carousel').css('z-index','1');
    }
    ).mouseleave();

    $('.product-layout .radgroup input').change(function (){
        let curprod = $(this).closest('.product-layout');
        let price = $(this).data('price-special');
        let old_price = $(this).data('option-price');
        if(price!==''){
            curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
        }else{
            curprod.find('.price').html(old_price);
        }
    });
    $('.prod_main .radgroup input').change(function (){
        let curprod = $(this).closest('.prod_main');
        let price = $(this).data('price-special');
        let old_price = $(this).data('option-price');
        if(price!==''){
            curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
        }else{
            curprod.find('.price').html(old_price);
        }
    });
    if($('.prod_main .radgroup input:checked').length>0){
        let item = $('.prod_main .radgroup input:checked');
        let curprod = item.closest('.prod_main');
        let price = item.data('price-special');
        let old_price = item.data('option-price');
        if(price!==''){
            curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
        }else{
            curprod.find('.price').html(old_price);
        }
    }

    $('.product-layout').each(function (){
        if($(this).find('.radgroup input:checked').length>0){
            let curprod = $(this);
            let price = $(this).find('.radgroup input:checked').data('price-special');
            let old_price = $(this).find('.radgroup input:checked').data('option-price');
            if(price!==''){
                curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
            }else{
                curprod.find('.price').html(old_price);
            }
        }
    });

    $('a.filter').click(function (){
        $('aside#column-left').addClass('vis');
    })

    $('a.close_filter').click(function (){
        $('aside#column-left').removeClass('vis');
    });

    $('.top_info .phone .drop').click(function(){
        $('.top_info .phone .minidrop').slideToggle();
    })

})