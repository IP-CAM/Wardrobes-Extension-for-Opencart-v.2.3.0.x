<?php
class ControllerExtensionModuleVisitedproduct extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/visitedproduct');

		$data['heading_title'] = $this->language->get('heading_title');
        $data['button_more_info_cart'] = $this->language->get('button_more_info_cart');

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
		
		$this->load->model('tool/image');
		
		if(isset($this->session->data['products_id']))
			$this->session->data['products_id'] = array_slice($this->session->data['products_id'], -$setting['limit']);
        if (isset($this->session->data['products_id'])) {
			foreach ($this->session->data['products_id'] as $result_id) {
				$result = $this->model_catalog_product->getProduct($result_id);

				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} 
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'));
                    $price = 'от ' . $this->formatMany($price, $this->session->data['currency']);
				} else {
					$price = false;
				}
				

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				if(utf8_strlen($result['name']) < 80){
					$sub_name = $result['name'];
				}else{
					$sub_name = utf8_substr($result['name'], 0, 80) . '..';
				}


				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $sub_name ,
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
		}
		if (file_exists($this->config->get('config_template') . 'extension/module/visitedproduct')) {
			return $this->load->view($this->config->get('config_template') . 'extension/module/visitedproduct', $data);
		} else {
			return $this->load->view('extension/module/visitedproduct', $data);
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