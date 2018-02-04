<?php
class ControllerExtensionModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/bestseller');

        $this->load->model('catalog/product');
       // $results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
        $data = array();
        $products_id = $this->model_catalog_product->getProductsIdBestseller();
        foreach($products_id as $product_id) {
            $data['best_products'][] = $this->load->controller('product/product_item', $product_id);
        }
        return $this->load->view('extension/module/bestseller', $data);

	}
}
