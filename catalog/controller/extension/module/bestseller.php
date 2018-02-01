<?php
class ControllerExtensionModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/bestseller');

        $this->load->model('catalog/product');
       // $results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
        $data = array();
        $data['filter_category_id'] = '68';
        $results = $this->model_catalog_product->getProducts($data);
        $data['best_products'] = $this->getProducts($results);

        return $this->load->view('extension/module/bestseller', $data);

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
