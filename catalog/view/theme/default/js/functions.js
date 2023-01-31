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
})