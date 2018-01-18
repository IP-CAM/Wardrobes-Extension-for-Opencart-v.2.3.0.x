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

function productFilterPrice() {
    $.ajax({
        url: 'index.php?route=extension/module/category/productFilterPrice',
        dataType: 'html',
        data: 'products_json_id=' + $('[name="products_json_id"]').val() + '&min=' + $('[name="category-input-min"]').val() + '&max=' + $('[name="category-input-max"]').val() + '&category_id=' + $('[name="category_id"]').val(),
        type: 'post',
        beforeSend: function () {
        },
        success: function (html) {
            //alert($.isArray(json));
            $('.product-box').empty();
            $('.product-box').append(html)
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

$(document).ready(function() {
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

    // For Home                 (Page Validation telephone)
    if ($('#home').length > 0) {
        $("[name='service_button']").click(function (event) {
            var error = 0;
            if ($("[name='name']:visible").val() == '') {
                $("[name='name']").parent().find('.error').show();
                error = 1;
            } else {
                $("[name='name']").parent().find('.error').hide();
            }
            if ($("[name='telephone']:visible").val() == '') {
                $("[name='telephone']").parent().find('.error').show();
                error = 1;
            } else {
                $("[name='telephone']").parent().find('.error').hide();
            }
            if (!error) {
                if (mobileDetect()) {
                    ajaxClientCall(2, 4, 1);
                } else {
                    ajaxClientCall(1, 4, 1);
                }

            }
        });
    }



    //For category
    if($('#category').length > 0) {
          $("#slider-category").slider({
        range: true,
        min: 0,
        max: 200000,
        values: [0, 200000],
        slide: function (event, ui) {
            $('[name="category-input-min"]').val(ui.values[0]);
            $('[name="category-input-max"]').val(ui.values[1]);
            productFilterPrice();
        },
        change: function() {
            productFilterPrice();
        }
    });
    $('[name="category-input-min"], [name="category-input-max"]').on('input',function () {
        updateSlider();
    });
    function updateSlider() {
        var price_min  = $('[name="category-input-min"]').val();
        var price_max = $('[name="category-input-max"]').val();
        //alert(price_max);
        $("#slider-category").slider('values', 0, price_min);
        $("#slider-category").slider('values', 1, price_max);
        //alert($('[name="products_json_id"]').val());
        $('.pagination').hide();
    }
    $('[name="category-input-min"], [name="category-input-max"]').keypress(function(e) {
        if (e.keyCode < 48 || e.keyCode > 57) {
            return false;
        }
    });
    }








});


//FOR PRODUCT BEGIN

    $(document).ready(function() {
        if($('#product').length > 0) {
            sizeCharacteristic();
            sizeName();

            $('.nav-tabs .button').on('click', function () {
                $('.nav-tabs .button p').removeClass('active-button');
                $(this).find('p').addClass('active-button');

                var id = $(this).data('tab');
                $('.check-info>div').hide();
                $('.check-info').find('#' + id).show();
            });

            $('#characteristic .any').mouseenter(function () {
                $('#message-characteristic').show();
                $(this).before($('#message-characteristic'));
            });
            $('#characteristic .any').mouseleave(function () {
                $('#message-characteristic').hide();
            });


            $("[name='active']").click(function (event) {
                var root = $(this).parent();
                var text = root.find("[name='telephone']").val();
                if (text == '') {
                    $('.error').show();
                    return false;
                } else {
                    $('.phone-box .error').hide();
                    $('.error').hide();
                    ajaxClientCall($(this).data('modal'), 3, 0);
                }
            });

            $('.thumbnails').magnificPopup({
                type: 'image',
                delegate: 'a',
                gallery: {
                    enabled: true
                }
            });

            $(window).resize(function () {
                sizeCharacteristic();
                sizeName()
            });


            function sizeName() {
                var root_object = $('.back');
                var text_object = root_object.find('p');

                var width = root_object.width();

                var back_button = root_object.find('a');
                //alert('width + ' + width + 'p_left' + p_left + 'p_right' +p_right + 'text_object.width() ' + text_object.width());
                for (var i = 0; i < 25; i++) {
                    if (width - back_button.width() - 5 < text_object.width()) {
                        var size_old = text_object.css('font-size');
                        text_object.css('font-size', (parseInt(size_old) - 1) + 'px');
                    } else {
                        break;
                    }
                }
            }

            function sizeCharacteristic() {

                if ($(window).width() > 480) { //Если размер совсем маленький, делаем все в столбик
                    var root = $('#size-box-mobile');
                    var width_mobile = root.find('#width-mobile');
                    var height_mobile = root.find('#height-mobile');
                    var depth_mobile = root.find('#depth-mobile');
                    for (var i = 0; i < 25; i++) {
                        var width_div_size = width_mobile.width();
                        var height_div_size = height_mobile.width();
                        var depth_div_size = depth_mobile.width();
                        //padding
                        var width_p = parseInt(width_mobile.css('padding-left'));
                        var height_p = parseInt(height_mobile.css('padding-left'));
                        var depth_p = parseInt(depth_mobile.css('padding-left'));

                        if (width_div_size + height_div_size + depth_div_size + width_p + height_p + depth_p + 5 > root.width()) {
                            updateSize(width_mobile);
                            updateSize(height_mobile);
                            updateSize(depth_mobile);
                        } else {
                            break;
                        }
                    }
                }
            }

            function updateSize(width_mobile) {
                updateSizeItem(width_mobile, 'p.name');
                updateSizeItem(width_mobile, 'a');
                updateSizeItem(width_mobile, 'p.size');
            }

            function updateSizeItem(width_mobile, value) {
                var text = '.' + width_mobile.attr('class') + ' ' + value;
                if ($(text).length > 0) {
                    var size_old = width_mobile.find(value).css('font-size');
                    width_mobile.find(value).css('font-size', (parseInt(size_old) - 1) + 'px');
                }
            }
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


