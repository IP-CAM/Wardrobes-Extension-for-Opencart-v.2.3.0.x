$(document).ready(function() {    $("#slider-category").slider({        range: true,        min: 0,        max: 200000,        values: [0, 200000],        slide: function (event, ui) {            $('[name="input-min"]').val(ui.values[0]);            $('[name="input-max"]').val(ui.values[1]);            productFilterPrice();        },        change: function() {            productFilterPrice();        }    });    $('[name="input-min"], [name="input-max"]').on('input',function () {        updateSlider();    })    function updateSlider() {        var price_min  = $('[name="input-min"]').val();        var price_max = $('[name="input-max"]').val();        //alert(price_max);        $("#slider-category").slider('values', 0, price_min);        $("#slider-category").slider('values', 1, price_max);        //alert($('[name="products_json_id"]').val());        $('.pagination').hide();    }    $('[name="input-min"], [name="input-max"]').keypress(function(e) {        if (e.keyCode < 48 || e.keyCode > 57) {            return false;        }    });});function productFilterPrice() {    $.ajax({        url: 'index.php?route=extension/module/category/productFilterPrice',        dataType: 'html',        data: 'products_json_id=' + $('[name="products_json_id"]').val() + '&min=' + $('[name="input-min"]').val() + '&max=' + $('[name="input-max"]').val() + '&category_id=' + $('[name="category_id"]').val(),        type: 'post',        beforeSend: function () {        },        success: function (html) {            //alert($.isArray(json));            $('.product-box').empty();            $('.product-box').append(html)        },        error: function (xhr, ajaxOptions, thrownError) {            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);        }    });}