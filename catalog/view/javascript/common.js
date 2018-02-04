function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	} else { 			// Изменения для seo_url от Русской сборки OpenCart 2x
		var query = String(document.location.pathname).split('/');
		if (query[query.length - 1] == 'cart') value['route'] = 'checkout/cart';
		if (query[query.length - 1] == 'checkout') value['route'] = 'checkout/checkout';
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

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

$(document).ready(function() {
    //Для всех каруселей
    addArrow();





	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	$('#form-currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#form-currency input[name=\'code\']').val($(this).attr('name'));

		$('#form-currency').submit();
	});

	// Language
	$('#form-language .language-select').on('click', function(e) {
		e.preventDefault();

		$('#form-language input[name=\'code\']').val($(this).attr('name'));

		$('#form-language').submit();
	});



	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 10) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		$('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');
		$('#grid-view').removeClass('active');
		$('#list-view').addClass('active');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		var cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		$('#list-view').removeClass('active');
		$('#grid-view').addClass('active');

		localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
		$('#list-view').addClass('active');
	} else {
		$('#grid-view').trigger('click');
		$('#grid-view').addClass('active');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});


    //For header
    var slideout = new Slideout({
        'panel': document.getElementById('panel'),
        'menu': document.getElementById('menu'),
        'padding': 180,
        'tolerance': 70,
        'touch': false
    });
    // Toggle button
    document.querySelector('#menu-mini').addEventListener('click', function () {
        slideout.toggle();
    });















});







$(document).ready(function() {
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






//Моя фуекция
function mobileDetect() {
    var mobile_detect = false;
    if($('.hidden-lg').is(':visible')) {
        mobile_detect = true; //Для компьютерной версии
    }
    return mobile_detect;
}




/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});


