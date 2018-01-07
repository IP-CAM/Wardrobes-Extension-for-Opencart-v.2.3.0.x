$(document).ready(function () {
    var standard_text = 'стандарт';
    var exclusive_text = 'эксклюзив';

    $('#exclusive-box').hide();
    $('#standard p').addClass('active-button');
    $('#cal_sub_price').text(exclusive_text + ' ' + $('#cal_sub_price').text());
    $('.calculator_dispatch .error').hide();




    $('#quest-calculation').mouseenter(function() {
        $('#message-calculation').show();
        $('#cal-calculation-box').append($('#message-calculation'));
    });
    $('#quest-calculation').mouseleave(function() {
        $('#message-calculation').hide();
    });





    $( "#slider-range" ).slider({
        min: 100,
        max: 400,
        range: 'min',
        slide: function( event, ui ) {

            var val = $('.ui-slider-handle').css('left');
            $('.number').css('left', val);
            //$('.number').css('top)

            $('.number').text(ui.value);
            $( "#input_width" ).val(ui.value);
            activeStandard();
        },
        change: function( event, ui ) {
            var val = $('.ui-slider-handle').css('left');
            $('.number').css('left', val);
        },
        create: function(event, ui) {
            $('.ui-slider-handle.ui-corner-all.ui-state-default').before('<div class="number"></div>');
            $('.number').text('100');
        }
    });



    $('#standard').click(function () {
        //$(this).append($('#calculator_active_img'));
        $('#exclusive-box').hide();
        $('#standard-box').show();
        $('#standard p').addClass('active-button');
        $('#exclusive p').removeClass('active-button');
        var text = $('#cal_sub_price').text();
        text = text.replace(standard_text, exclusive_text);
        $('#cal_sub_price').text(text);
        $("[name='type']").val(0);


        $('#input_height').val('240');
        $('#input_depth').val('60');

        activeStandard()
    });
    $('#exclusive').click(function () {
        $('#exclusive-box').show();
        $('#standard-box').hide();
        $('#exclusive p').addClass('active-button');
        $('#standard p').removeClass('active-button');
        var text = $('#cal_sub_price').text();
        text = text.replace(exclusive_text, standard_text);
        $('#cal_sub_price').text(text);
        $("[name='type']").val(1);
        activeExclusive();
    });



    $('#calculation_button, #banner').click(function () {
        if($('#standard-box').is(':visible')) {
            var price = 'price='+$('#cal_top_price').text();
            ajaxClientCall(1,0,1, price);
            //alert('1,0,1');
        }
        if($('#exclusive-box').is(':visible')) {
            var price = 'price='+$('#cal_top_price').text();
            ajaxClientCall(1,1,1, price);
            //alert('1,1,1');
        }
        $("[name='two_modal']").val(1);

    });
    $('#dispatch_button').click(function (event) {
        var text = $("[name='telephone']").val();
        if (text == '') {
            $('.calculator_dispatch .error').show();
            return false;
        } else {
            $('.calculator_dispatch .error').hide();
            ajaxClientCall(1,2,0);
        }
    });


    var input_size = $('#input_width, #input_height, #input_depth');
    input_size.keypress(function() {
        activeExclusive();
    });
    input_size.change(function() {
        activeExclusive();
    });
    input_size.keydown(function() {
        activeExclusive();
    });
    input_size.keyup(function() {
        activeExclusive();
    });


    function activeExclusive() {
        $( "#cal_top_price" ).text(calcExclusive() + ' рублей');
        $('#cal_sub_price').text(standard_text + ' ' + calcStandard($('.number').text()) + ' рублей');
    }
    function activeStandard() {
        $( "#cal_top_price" ).text(Math.round(calcStandard($('.number').text())) + ' рублей' );
        $('#cal_sub_price').text(exclusive_text + ' ' + calcExclusive() + ' рублей');
    }

    function calcStandard(value) {
        var price = 0;
        if(value < 111) {
            var value_norm = value - 100;
            if(value_norm < 0) { value_norm = 0}
            price = 8400 + (value_norm *  505);
        } else {
            var value_norm = value - 110;
            price = 13450 + (value_norm *  143.8);
        }
        return Math.round(price);
    }

    function calcExclusive() {
        var width = $('#input_width').val();
        var height = $('#input_height').val();
        var depth = $('#input_depth').val();
        if(width != "" && height != "" && depth != "") {
            var height_rep_1 = 100;
            var height_rep_2 = 150;
            var height_rep_3 = 273;
            var height_sum = 0;
            if(height<height_rep_1) {
                height_sum = 10000;
            } else if(height<height_rep_2) {
                height_sum = 12200;
            } else  {
                height_sum = 15100;
            }

            var width_sum = (height_sum*width)/100;
            var depth_sum= 0;
            var reper_depth = 61;
            if(depth <reper_depth) {
                depth_sum = 0;
            } else {
                depth_sum = (depth - reper_depth) * 1100;
            }
            var sum = width_sum + depth_sum;
            if(height > height_rep_3) {
                sum = sum*1.30;
            }
            return Math.round(sum);

        }
        return -1;
    }
});