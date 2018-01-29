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

}