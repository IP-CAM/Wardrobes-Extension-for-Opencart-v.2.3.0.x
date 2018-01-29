<?php
class ControllerExtensionModuleVisitedproduct extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/visitedproduct');

		$data['heading_title'] = $this->language->get('heading_title');
        $data['button_more_info_cart'] = $this->language->get('button_more_info_cart');

        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel-2/owl.carousel.min.css');
        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel-2/owl.carousel.min.js');
        $this->document->addScript('catalog/view/javascript/visitedproduct.js');

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

                $data_pr = array(
                    'product_id'       => $result['product_id'],
                    'image'       => $result['image'],
                    'name'        => $result['name'],
                    'price'       => $result['price'],
                    'special'     => $result['special'],
                    'button_text'     => 'Подробнее'
                );
                $data['visitedproducts'][] = $this->load->controller('product/product_item', $data_pr);
			}
		}
		if (file_exists($this->config->get('config_template') . 'extension/module/visitedproduct')) {
			return $this->load->view($this->config->get('config_template') . 'extension/module/visitedproduct', $data);
		} else {
			return $this->load->view('extension/module/visitedproduct', $data);
		}
	}

    private function getProducts($results)
    {
        $data = array();
        foreach ($results as $result) {
            $data_pr = array(
                'product_id'       => $result['product_id'],
                'image'       => $result['image'],
                'name'        => $result['name'],
                'price'       => $result['price'],
                'special'     => $result['special'],
                'button_text'     => 'Подробнее'
            );
            $data[] = $this->load->controller('product/product_item', $data_pr);
        }
        return $data;
    }
}