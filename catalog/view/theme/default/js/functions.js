$(document).ready(function (){
    $('.topmenu li.parent>a').click(function (e){
        e.preventDefault();
        $(this).toggleClass('active');
        $(this).next('ul.sub-menu').slideToggle();
    })
})