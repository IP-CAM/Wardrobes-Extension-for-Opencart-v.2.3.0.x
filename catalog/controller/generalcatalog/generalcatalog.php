<?php
class ControllerGeneralcatalogGeneralcatalog extends Controller {
	public function index() {

		$this->load->model('generalcatalog/generalcatalog');
        $this->load->model('catalog/category');

        $contacts_info = $this->model_generalcatalog_generalcatalog->getGeneralcatalog(0);
        $this->load->language('common/header');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        $data['breadcrumbs'][] = array(
            'text' => $contacts_info['title'],
            'href' => $this->url->link('generalcatalog/generalcatalog')
        );

        //of table Calculator_description


        $this->document->setTitle($contacts_info['meta_title']);
        $this->document->setDescription($contacts_info['meta_description']);
        $this->document->setKeywords($contacts_info['meta_keyword']);


        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $radius = array();
        $radius['path_image'] = $server . 'image/catalog/generalcatalog/radius.jpg';
        $radius['name'] = 'Радиусные';
        $radius['href'] = $this->url->link('product/category', 'path=64_64');
        $data['radius'] = $radius;

        $standard = array();
        $standard['path_image'] = $server . 'image/catalog/generalcatalog/standard.jpg';
        $standard['name'] = 'Стандартные';
        $standard['href'] = $this->url->link('product/category', 'path=67_67');
        $data['standard'] = $standard;

        $built_in = array();
        $built_in['path_image'] = $server . 'image/catalog/generalcatalog/built_in.jpg';
        $built_in['name'] = 'Встроенные';
        $built_in['href'] = $this->url->link('product/category', 'path=60_60');
        $data['built_in'] = $built_in;

        $corner = array();
        $corner['path_image'] = $server . 'image/catalog/generalcatalog/corner.jpg';
        $corner['name'] = 'Угловые';
        $corner['href'] = $this->url->link('product/category', 'path=66_66');
        $data['corner'] = $corner;

        $our_work = array();
        $our_work['path_image'] = $server . 'image/catalog/generalcatalog/our_work.jpg';
        $our_work['name'] = 'Наши работы';
        $our_work['href'] = $this->url->link('product/category', 'path=70_70');
        $data['our_work'] = $our_work;

        $hallway = array();
        $hallway['path_image'] = $server . 'image/catalog/generalcatalog/hallway.jpg';
        $hallway['name'] = 'Прихожие';
        $hallway['href'] = $this->url->link('product/category', 'path=69_69');
        $data['hallway'] = $hallway;

        $dressing_room = array();
        $dressing_room['path_image'] = $server . 'image/catalog/generalcatalog/dressing_room.jpg';
        $dressing_room['name'] = 'Гардеробные';
        $dressing_room['href'] = $this->url->link('product/category', 'path=68_68');
        $data['dressing_room'] = $dressing_room;


        $data['description'] = html_entity_decode($contacts_info['description'], ENT_QUOTES, 'UTF-8');

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

        $this->response->setOutput($this->load->view('generalcatalog/generalcatalog', $data));

	}
}