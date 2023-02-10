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
        console.log(price,old_price);
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
        console.log(price,old_price);
        if(price!==''){
            curprod.find('.price').html('<span class="price-old">'+old_price+'</span><span class="price-new">'+price+'</span>');
        }else{
            curprod.find('.price').html(old_price);
        }
    });
})