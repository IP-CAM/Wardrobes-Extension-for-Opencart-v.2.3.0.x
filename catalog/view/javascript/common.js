

function addArrow() { //Для всех каруселей
    $('.owl-carousel ').append('<div class="transformation owl-arrow owl-next"></div>');
    $('.owl-carousel ').append('<div class=" owl-arrow owl-prev"></div>');
    $(".owl-next").on('click', function(){
        var parent = $(this).parent();
        parent = parent.parent();
        parent.find('.owl-carousel').trigger('next.owl.carousel');
    });
    $(".owl-prev").on('click', function(){
        var parent = $(this).parent();
        parent = parent.parent();
        parent.find('.owl-carousel').trigger('prev.owl.carousel');
    });
}
//Моя фуекция
function mobileDetect() {
    var mobile_detect = false;
    if($('.hidden-lg').is(':visible')) {
        mobile_detect = true; //Для компьютерной версии
    }
    return mobile_detect;
}
$(document).ready(function() {
    //Для всех каруселей
    addArrow();


	/*$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 10) + 'px');
		}
        alert('sdfsfsd');
	});*/



	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});


    //For header для мобильной версии
    var slideout = new Slideout({
        'panel': document.getElementById('panel'),
        'menu': document.getElementById('menu'),
        'padding': 180,
        'tolerance': 70,
        'touch': false
    });
    // Toggle button
    var menu_mini_check = false;
    document.querySelector('#menu-mini').addEventListener('click', function () {
        slideout.toggle();
        var grad = 50;
        var time_max = 500;
        var time_min = 100;
        if(menu_mini_check) {

            $('#menu_animation_box>#d1').removeClass('top-animate');
            $('#menu_animation_box>#d3').removeClass('down-animate');
            $('#menu_animation_box>#d2').removeClass('middle-animate');
            //$('#menu_animation_box>#d2').show(time_min);
            //setTimeout($('#menu_animation_box>#d2').show(time_min),10000);
            //setTimeout(function() { $('#menu_animation_box>#d2').show(50) },300);

           /* $('#menu_animation_box>#d1').animateRotate(0, time_min);
            $("#menu_animation_box>#d1").animate({top: "0px"}, time_min);
            $("#menu_animation_box>#d1").animate({width: "20px"}, time_min);

            $('#menu_animation_box>#d3').animateRotate(0, time_min);
            $("#menu_animation_box>#d3").animate({top: "12px"}, time_min);
            $("#menu_animation_box>#d3").animate({width: "20px"}, time_min);*/

            menu_mini_check = false;
        } else {

            $('#menu_animation_box>#d1').addClass('top-animate');
            $('#menu_animation_box>#d3').addClass('down-animate');
           // $('#menu_animation_box>#d2').hide(50);
            $('#menu_animation_box>#d2').addClass('middle-animate');
            /*
            $('#menu_animation_box>#d1').animateRotate(-1 * grad, time_max);
            $("#menu_animation_box>#d1").animate({width: "16px", top: "0px"}, time_min);

            $('#menu_animation_box>#d3').animateRotate(grad, time_max);
            $("#menu_animation_box>#d3").animate({width: "16px", top: "12px"}, time_min); */
            menu_mini_check = true;
        }

    });

    $.fn.animateRotate = function(angle, duration, easing, complete) {
        return this.each(function() {
            var $elem = $(this);

            $({deg: 0}).animate({deg: angle}, {
                duration: duration,
                easing: easing,
                step: function(now) {
                    $elem.css({
                        "transform": "rotate(" + now + "deg)",
                        "transform-origin" : "50% 100%",
                        "transition-timing-function": "cubic-bezier(0.42, 0, 0.58, 1.0)"
                    });
                },
                complete: complete || $.noop
            });
        });
    };

    //Для всех каруселей
    $('body').on('mouseenter', '.owl-prev , .owl-next', function(){
            var parent = $(this).parent();

            parent.find('.owl-prev').addClass('owl-prev-active');
            parent.find('.owl-next').addClass('owl-next-active');
        }
    );
    $('body').on('mouseleave', '.owl-prev, .owl-next', function(){
            $('.owl-prev').removeClass('owl-prev-active');
            $('.owl-next').removeClass('owl-next-active');
        }
    );

    if(mobileDetect()) { //Обрезаем иконки на продуктах
        $(".product-icon.discount").each(function(index, element){
            var text_icon = $(element).text();
            text_icon = text_icon.substring(7);
            $(element).text(text_icon); // Скидка 15%
        });
        $(".product-icon.new").text('нов.'); //Новинка
    }
});








