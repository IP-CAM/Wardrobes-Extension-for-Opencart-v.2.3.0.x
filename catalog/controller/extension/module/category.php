<?php
class ControllerExtensionModuleCategory extends Controller {
	public function index() {
		$this->load->language('extension/module/category');

		$data['heading_title'] = $this->language->get('heading_title');

        $this->document->addStyle('catalog/view/javascript/jquery/slider-ui/jquery-ui.min.css');
        $this->document->addScript('catalog/view/javascript/jquery/slider-ui/jquery-ui.min.js');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategoriesAll();
        $children_data = array();
		foreach ($categories as $category) {
            $children_data[$category['category_id']]['href'] = $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $category['category_id']);
        }
        $data['categories'] = $children_data;




		return $this->load->view('extension/module/category', $data);
	}


    public function ajaxFilterPrice()
    {
        $data= $this->request->post['products_json_id'];
        $data = htmlspecialchars_decode($data);
        $data = json_decode($data);
        $min = $this->request->post['min'];
        $max = $this->request->post['max'];
        $this->load->model('catalog/product');
        $approved_product_id = array();
        foreach($data as $product_id) {
            $product = $this->model_catalog_product->getProduct((int)$product_id);
            $price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
            if($price <= $max && $price >= $min) {
                $approved_product_id[] = $product_id;
            }

        }
        $json['approved_product_id'] = $approved_product_id;
        $s = json_encode($json);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }



    public function productFilterPrice()
    {
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('tool/image');

        $min = $this->request->post['min'];
        $max = $this->request->post['max'];
        $this->load->model('catalog/product');



        $category_id = $this->request->post['category_id'];

        $results = $this->model_catalog_category->getCategories($category_id);

        foreach ($results as $result) {
            $filter_data = array(
                'filter_category_id'  => $result['category_id'],
                'filter_sub_category' => true
            );

            $data['categories'][] = array(
                'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                'href' => $this->url->link('product/category', 'path=' . $result['category_id'] . '_' . $result['category_id'])
            );
        }

        $data['products'] = array();

        $filter = '';
        $sort = 'p.sort_order';
        $order = 'ASC';
        $page = 1;
        $limit = (int)100;

        $filter_data = array(
            'filter_category_id' => $category_id,
            'filter_filter'      => $filter,
            'sort'               => $sort,
            'order'              => $order,
            'start'              => ($page - 1) * $limit,
            'limit'              => $limit
        );


        $results = $this->model_catalog_product->getProducts($filter_data);

        foreach ($results as $result) {
            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $price = $this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'));
            } else {
                $price = false;
            }
            if($price < $min || $price >$max)
            {
                continue;
            }
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
            }



            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $special = false;
            }

            if ($this->config->get('config_tax')) {
                $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
            } else {
                $tax = false;
            }

            if ($this->config->get('config_review_status')) {
                $rating = (int)$result['rating'];
            } else {
                $rating = false;
            }

            $price = 'от ' . $this->formatMany($price, $this->session->data['currency']);
            $data['products'][] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                'price'       => $price,
                'special'     => $special,
                'tax'         => $tax,
                'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                'rating'      => $result['rating'],
                'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'])
            );
        }




        $html = $this->load->view('product/product_list_for_cat', $data);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput($html);
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

        $symbol_right =  " &#8381";
        $string .= $symbol_right;

        return $string;
    }
}