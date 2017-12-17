<?php
class ControllerCalculatorCalculator extends Controller {
	public function index() {
		$this->load->language('information/calculator');

		$this->load->model('calculator/calculator');
        $this->load->model('catalog/category');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        //of table Calculator_description
		$calculator_info = $this->model_calculator_calculator->getCalculator(1);
        $this->document->addScript('catalog/view/javascript/calculator.js');

        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

        $this->document->addStyle('catalog/view/javascript/jquery/slider/bootstrap-slider.css');
        $this->document->addScript('catalog/view/javascript/jquery/slider/bootstrap-slider.js');

        $this->document->setTitle($calculator_info['meta_title']);
        $this->document->setDescription($calculator_info['meta_description']);
        $this->document->setKeywords($calculator_info['meta_keyword']);


        $data['breadcrumbs'][] = array(
            'text' => $calculator_info['title'],
            'href' => $this->url->link('calculator/calculator')
        );

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
        $data['calculator_active_button'] = $server. 'catalog/view/theme/default/image/calculator_active_button.png';
        $data['calculator_dispatch_img'] = $server. 'catalog/view/theme/default/image/calculator_get_phone.png';

        $categories_root = $this->model_catalog_category->getCategories(0);
        $this->normalizationImageLink($categories_root, $server);
        $data['description'] = html_entity_decode($calculator_info['description'], ENT_QUOTES, 'UTF-8');
        $data['categories_root'] = $categories_root;
        $data['link_calculator'] = $this->url->link('calculator/calculator');
    }

    /**
     * POST['id'] and POST['type']
     */
    public function ajax(){
        $this->load->language('information/calculator');

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

        if($type == 'categories') {
            $categories = $this->model_catalog_category->getCategories($id);
            $this->normalizationImageLink($categories, $server);
            $json['data'] = $categories;
            $json['type'] = 'categories';
        }
        if($type == 'products') {
            $products = $this->model_calculator_calculator->getProductFormCategories($id);
            $this->normalizationImageLink($products, $server);
            $json['data'] = $products;
            $json['type'] = 'products';
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

    public function setClient()
    {
        $data = $this->request->post;

        /*customer_id	int(11) Автоматическое приращение
customer_group_id	int(11)
store_id	int(11) [0]
language_id	int(11)
firstname	varchar(32)
lastname	varchar(32)
email	varchar(96)
telephone	varchar(32)
fax	varchar(32)
password	varchar(40)
salt	varchar(9)
cart	text NULL
wishlist	text NULL
newsletter	tinyint(1) [0]
address_id	int(11) [0]
custom_field	text
ip	varchar(40)
status	tinyint(1)
approved	tinyint(1)
safe	tinyint(1)
token	text
code	varchar(40)
date_added*/


        $this->noralizeField($data, 'customer_group_id');

        $this->noralizeField($data, 'store_id');
        $this->noralizeField($data, 'language_id');
        $this->noralizeField($data, 'first_name');
        $this->noralizeField($data, 'last_name');
        $this->noralizeField($data, 'email');
        $this->noralizeField($data, 'telephone');
        $this->noralizeField($data, 'fax');
        $this->noralizeField($data, 'password');
        $this->noralizeField($data, 'salt');


        if(!isset($data['first_name'])) {
            $data['first_name'] = '';
        }
        if(!isset($data['phone'])) {
            $data['phone'] = '';
        }
        if(!isset($data['width'])) {
            $data['width'] = 0;
        }
        if(!isset($data['height'])) {
            $data['height'] = 0;
        }
        if(!isset($data['depth'])) {
            $data['depth'] = 0;
        }
        $data['ip'] = $_SERVER['REMOTE_ADDR'];
        $data['status']  = '1';


        $this->load->model('calculator/calculator');
        $products = $this->model_calculator_calculator->addCustomer($data);
        $this->response->redirect($this->url->link('information/information', 'information_id=7', true));


    }

    private function  noralizeField(&$data, $name_fild, $type = 'string') {
        if($type == 'string') {
            if(!isset($data[$name_fild])) {
                $data[$name_fild] = '';
            }
        }
        if($type == 'number') {
            if(!isset($data[$name_fild])) {
                $data[$name_fild] = '0';
            }
        }
    }
}