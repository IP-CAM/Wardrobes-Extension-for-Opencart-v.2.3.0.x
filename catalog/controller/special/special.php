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

        $this->document->addStyle('catalog/view/javascript/special/special.css');

        //for mobile version
        if (isset($this->request->server['HTTP_REFERER'])) {
            $referer_mobile = $this->request->server['HTTP_REFERER'];
        } else {
            $referer_mobile = $this->url->link('common/home');
        }
        $data['referer_mobile'] = $referer_mobile;



        $this->document->setTitle($special_info['meta_title']);
        $this->document->setDescription($special_info['meta_description']);
        $this->document->setKeywords($special_info['meta_keyword']);

        $data['button_more_info_cart'] = $this->language->get('button_more_info_cart');

        $data['description'] = html_entity_decode($special_info['description'], ENT_QUOTES, 'UTF-8');

       // $this->addProductDiscountOrBestsellers($special_info, $data, 'discounts');
       // $this->addProductDiscountOrBestsellers($special_info, $data, 'bestsellers');


        $products_id = $this->model_catalog_product->getProductsIdSale(); //Продукты для распродажи
        foreach($products_id as $product_id) {
            $data['sale_products'][] = $this->load->controller('product/product_item', $product_id);
        }
        $products_id = $this->model_catalog_product->getProductsIdBestseller(); //Продукты - хиты продаж
        foreach($products_id as $product_id) {
            $data['best_products'][] = $this->load->controller('product/product_item', $product_id);
        }


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


   /* private function addProductDiscountOrBestsellers($special_info, &$data, $type = 'discounts')
    {
        if (!empty($special_info['limit_' . $type])) {
            $products_array_id = json_decode($special_info['product_' . $type], true);
            $pr_a_id = $products_array_id['product'];
            $products = array_slice($pr_a_id, 0, (int)$special_info['limit_' . $type]);

            foreach ($products as $product_id) {
                $result = $this->model_catalog_product->getProduct($product_id);

                $data_pr = array(
                    'product_id'  => $result['product_id'],
                    'image'       => $result['image'],
                    'name'        => $result['name'],
                    'price'       => $result['price'],
                    'special'     => $result['special'],
                    'button_text'     => 'Подробнее'
                );
                $data['product_' . $type][] = $this->load->controller('product/product_item', $data_pr);
            }
        }
    }*/



}