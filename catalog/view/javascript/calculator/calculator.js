$(document).ready(function () {    //Вызов модального окна    $("[name='calculation_button'], [name='banner']").click(function () {        var price = 'price=' + $("[name='price']:visible").text();        ajaxClientCall(1, 0, 1, price);        if(mobileDetect()) {            ajaxClientCall(2, 1, 1, price);        } else {            ajaxClientCall(1, 1, 1, price);        }        //alert('1,0,1');    });    $("[name='dispatch-button']:visible").click(function (event) {        var text = $("[name='telephone']:visible").val();        var price = 'price=' + $("[name='price']:visible").text();        if (text == '') {            if($(window).width() < 480) {                $('.calculator_dispatch').css('top', '60%');            }            $('.calculator_dispatch .error').show();            return false;        } else {            $('.calculator_dispatch .error').hide();            if($(window).width() < 480) {                $('.calculator_dispatch').css('top', '75%');            }            if(mobileDetect()) {                ajaxClientCall(2, 2, 0, price);            } else {                ajaxClientCall(1, 2, 0, price);            }        }    });});