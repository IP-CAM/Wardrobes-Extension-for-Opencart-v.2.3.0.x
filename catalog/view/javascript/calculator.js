$(document).ready(function () {


    var check_root_cat_id = 0; //if root category not select
    var check_sub_cat_id = 0; //if sub category not select
    var check_product_id = 0; //if sub category not select


    $('.box_root_item').click(function () {
        ajaxRenderRoot($(this));
    });
    $('.box_root_item input').change(function () {
        ajaxRenderRoot($(this));
    });


    $(document).on('click', '.dynamic_category', function () {
        $('.dynamic_category').find('img').addClass('no-active');
        $('.dynamic_category').find('p').addClass('no-active');
        var this_sub_category = $(this);
        var id = this_sub_category.find('input:checkbox').val();
        if(check_sub_cat_id != id) {
            ajaxOpenCategory(id, 'products');
            $('.dynamic_category').find('input').prop('checked', false);
            this_sub_category.find("input").prop('checked', true);
            this_sub_category.find('img').removeClass('no-active');
            this_sub_category.find('p').removeClass('no-active');

        } else {
            var product_box = $('#product_box');
            product_box.empty();
        }
    });

    function ajaxRenderRoot(this_root_item) {
        var id = this_root_item.find('input').val();
        $(".box_root_item").find('p').addClass('no-active');
        //alert('id=' + id + '&check_root_id=' + check_root_cat_id);

        if(check_root_cat_id != id) {
            //	alert('dfg');
            $('.box_root').find('input').prop('checked', false);
            this_root_item.find("input").prop('checked', true);
            this_root_item.find('p').removeClass('no-active');
            ajaxOpenCategory(id, 'categories'); //Show sub categories
        } else {
            $('.box_root').find('input').prop('checked', false);
            hideSubCategories(); // Hide sub categories and products
            check_root_cat_id = 0;
        }

    }

    function hideSubCategories() {
        var type_sub_box = $('#sub_box');
        type_sub_box.empty();
        var type_product_box = $('#product_box');
        type_product_box.empty();
    }

    function ajaxRenderCategories(data) {
        hideSubCategories();
        var type_sub_box = $('#sub_box');
        var html = '';

        $.each(data, function (index, value) {
            html += '<div class="col-sm-3 dynamic_category">';
            html += '<div class="box sub_box_item">';
            html += '<input type="checkbox" name="category_sub" value="' + value['category_id'] + '" >';
            html += '<img src="' + value['image'] + '"';
            html += 'title="' + value["name"] + '"';
            html += 'alt="' + value["name"] + '"';
            html += 'class="img-responsive center-block no-active"/>';
            html += '<p>' + value["name"] + '</p>';
            html += '</div>';
            html += '</div>';
        });

        type_sub_box.append(html);
    }

    function ajaxRenderProducts(data) {

        var type_product_box = $('#product_box');
        type_product_box.empty();
        var html = '<div id="carousel" class="carousel-control">';
        $.each(data, function (index, value) {

            html += '<div class="product_item box">';
            html += '<input type="checkbox" name="products" value="' + value['product_id'] + '" >';
            html += '<img src="' + value['image'] + '"';
            html += 'title="' + value["name"] + '"';
            html += 'alt="' + value["name"] + '"';
            html += 'class="img-responsive center-block"/>';
            html += '<p>' + value["name"] + " Модель:" + value["model"] + '</p>';
            html += '</div>';

        });
        html += '</div>';
        type_product_box.append(html);
        $("#carousel").owlCarousel({
            navigation: true,
            pagination:  false,
            navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
        });
    }

    function ajaxOpenCategory(id, type) {
        //alert('id=' + id + '&type=' + type);
        $.ajax({
            url: 'index.php?route=calculator/calculator/ajaxOpen',
            dataType: 'json',
            data: 'id=' + id + '&type=' + type,
            type: 'post',
            beforeSend: function () {
            },
            success: function (json) {

                var type = json['type'];
                if (type.localeCompare("categories") == 0) {
                    ajaxRenderCategories(json['data']);
                    check_root_cat_id = id;
                }
                if (type.localeCompare("products") == 0) {
                    ajaxRenderProducts(json['data']);
                    check_sub_cat_id = id;
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                //alert('error');
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }


    $(document).on('click', '.product_item', function () {
        $('.product_item').find('img').addClass('no-active');
        $('.product_item').find('p').addClass('no-active');
        var this_product = $(this);
        var id = this_product.find('input:checkbox').val();
        if(check_product_id != id) {
            $('.product_item').find('input').prop('checked', false);
            this_product.find("input").prop('checked', true);
            this_product.find('img').removeClass('no-active');
            this_product.find('p').removeClass('no-active');
            alert(id);
        } else {
            var product_box = $('#product_box');
            product_box.empty();

        }
    });
});


