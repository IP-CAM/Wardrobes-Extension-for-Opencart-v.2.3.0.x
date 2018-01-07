<?php
class ControllerSpecialSpecial extends Controller {
	public function index() {
        $this->load->language('product/category');
		$this->load->model('special/special');
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $special_info = $this->model_special_special->getSpecial(0);
        $this->load->language('common/header');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        $data['breadcrumbs'][] = array(
            'text' => $special_info['title'],
            'href' => $this->url->link('special/special')
        );




        $this->document->setTitle($special_info['meta_title']);
        $this->document->setDescription($special_info['meta_description']);
        $this->document->setKeywords($special_info['meta_keyword']);

        $data['button_more_info_cart'] = $this->language->get('button_more_info_cart');

        $data['description'] = html_entity_decode($special_info['description'], ENT_QUOTES, 'UTF-8');

        $this->addProductDiscountOrBestsellers($special_info, $data, 'discounts');
        $this->addProductDiscountOrBestsellers($special_info, $data, 'bestsellers');

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $data['base'] = $server;


        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');




        $this->response->setOutput($this->load->view('special/special', $data));

	}

    private function addProductDiscountOrBestsellers($special_info, &$data, $type = 'discounts')
    {
        if (!empty($special_info['limit_' . $type])) {
            $products_array_id = json_decode($special_info['product_' . $type], true);
            $pr_a_id = $products_array_id['product'];
            $products = array_slice($pr_a_id, 0, (int)$special_info['limit_' . $type]);

            foreach ($products as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {
                    if ($product_info['image']) {
                        $image = $this->model_tool_image->resize($product_info['image'], $special_info['width'], $special_info['height']);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $special_info['width'], $special_info['height']);
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $price = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
                        $price = 'от ' . $this->formatMany($price, $this->session->data['currency']);
                    } else {
                        $price = false;
                    }

                    if ((float)$product_info['special']) {
                        $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = $product_info['rating'];
                    } else {
                        $rating = false;
                    }

                    $data['products_' . $type][] = array(
                        'product_id'  => $product_info['product_id'],
                        'thumb'       => $image,
                        'name'        => $product_info['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                        'price'       => $price,
                        'special'     => $special,
                        'tax'         => $tax,
                        'rating'      => $rating,
                        'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                    );
                }
            }
        }
    }

    private function formatMany($number, $currency)
    {
        $value = '';
        $format = true;
        $decimal_place = $this->currencies[$currency]['decimal_place'];

        if (!$value) {
            $value = $this->currencies[$currency]['value'];
        }

        $amount = $value ? (float)$number * $value : (float)$number;

        $amount = round($amount, (int)$decimal_place);

        if (!$format) {
            return $amount;
        }

        $string = '';
        $string .= number_format($amount, null, $this->language->get('decimal_point'), ' ');

        $symbol_right =  " &#8381;";
        $string .= $symbol_right;

        return $string;
    }
}