<?php
class ControllerCalculatorCalculator extends Controller {
	public function index() {
		$this->load->language('calculator/calculator');

		$this->load->model('calculator/calculator');
        $this->load->model('catalog/category');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        //of table Calculator_description
		$calculator_info = $this->model_calculator_calculator->getCalculator(0);
        $this->document->addScript('catalog/view/javascript/calculator.js');
        $this->document->addScript('catalog/view/javascript/modal_window.js');

        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

         $this->document->addStyle('catalog/view/javascript/jquery/slider-ui/jquery-ui.min.css');
         $this->document->addScript('catalog/view/javascript/jquery/slider-ui/jquery-ui.min.js');


        $this->load->language('common/header');
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $calculator_info['title'],
            'href' => $this->url->link('calculator/calculator')
        );


        $this->document->setTitle($calculator_info['meta_title']);
        $this->document->setDescription($calculator_info['meta_description']);
        $this->document->setKeywords($calculator_info['meta_keyword']);




        $this->getContent($data, $calculator_info);


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

        $this->response->setOutput($this->load->view('calculator/calculator', $data));

	}

    private function getContent(&$data, $calculator_info)
    {
        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $data['base'] = $server;


        $categories_root = $this->model_catalog_category->getCategories(0);


        //sort begin
        $key_cat = array();
        foreach($categories_root as $key=>$category_root){
            $key_cat[] = $category_root['category_id'];
        }
        asort($key_cat);
        $cat_root = array();
        foreach($key_cat as $key=>$category_id) {
            foreach($categories_root as $key=>$category_root) {
                if($category_root['category_id'] == $category_id) {
                    if($category_root['category_id'] == 70) { //Kostil
                        continue;
                    }
                    $cat_root[] = $category_root;
                }
            }
        }
        $categories_root = $cat_root;

        //sort end



        $this->normalizationImageLink($categories_root, $server);
        $data['description'] = html_entity_decode($calculator_info['description'], ENT_QUOTES, 'UTF-8');
        $data['categories_root'] = $categories_root;
        $data['link_calculator'] = $this->url->link('calculator/calculator');
    }

    /**
     * POST['id'] and POST['type']
     */
    public function ajaxOpen(){
        $this->load->language('calculator/calculator');

        $this->load->model('catalog/category');
        $this->load->model('calculator/calculator');

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }


        $json = array();
        $id = $this->request->post['id'];
        $type= $this->request->post['type'];

        $product_count = $this->model_calculator_calculator->getProductEmptyFormCategories($id);
        if($product_count > 0 && $id != 59) {
            $products = $this->model_calculator_calculator->getProductFormCategories($id);
            $this->normalizationImageLink($products, $server);
            $json['data'] = $products;
            $json['type'] = 'products';
        } else {
            $categories = $this->model_catalog_category->getCategories($id);
            if(count($categories) == 0) {
                $json['data'] = null;
                $json['type'] = 'no_edit';
            } else {
                $this->normalizationImageLink($categories, $server);
                $this->normalizationName($categories);
                $json['data'] = $categories;
                $json['type'] = 'categories';
            }

        }

        if($type == 'root') {
            $json['root'] = '1';
        } else {
            $json['root'] = '0';
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    private function normalizationImageLink(&$containers, $server)
    {
        foreach($containers as $key => $container) {
            $containers[$key]['image'] = $server . '/image/'. $container['image'];

        }
    }

    private function normalizationName(&$categories){
        foreach($categories as $key=>$category){
            $name = $category['name'];
            $name = trim($name);
            $position = strpos($name,' ');
            if($position != 0 && $category['parent_id'] != 0) {
                $name = substr($name, 0, $position);
            }
            $categories[$key]['name'] = $name;
        }
    }
}