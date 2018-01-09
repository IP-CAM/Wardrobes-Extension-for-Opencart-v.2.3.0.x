<?php
class ControllerExtensionModuleHomeModule extends Controller {
	public function index($setting) {
        $this->document->addScript('catalog/view/javascript/modal_window.js');

        $data['link_calculator'] = $this->url->link('calculator/calculator');
        $data['link_review'] = $this->url->link('review/review');
        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $tile_banner_standard = array();
        $tile_banner_standard['path_image'] = $server . 'image/catalog/banners/home-standard.jpg';
        $tile_banner_standard['href'] = $this->url->link('product/category', 'path=67_67');
        $tile_banner_standard['title'] = 'Стандартные';
        $tile_banner_standard['alt'] = 'Стандартные';
        $data['tile_banner_standard'] = $tile_banner_standard;

        $tile_banner_radius = array();
        $tile_banner_radius['path_image'] = $server . 'image/catalog/banners/home-radius.jpg';
        $tile_banner_radius['href'] = $this->url->link('product/category', 'path=64_64');
        $tile_banner_radius['title'] = 'Радиусные';
        $tile_banner_radius['alt'] = 'Радиусные';
        $data['tile_banner_radius'] = $tile_banner_radius;

        $tile_banner_calculator = array();
        $tile_banner_calculator['path_image'] = $server . 'image/catalog/banners/home-calculator.jpg';
        $tile_banner_calculator['href'] = $this->url->link('calculator/calculator');
        $tile_banner_calculator['title'] = 'Шкафы-купе на заказ';
        $tile_banner_calculator['alt'] = 'Шкафы-купе на заказ';
        $data['tile_banner_calculator'] = $tile_banner_calculator;

        $tile_banner_built_in = array();
        $tile_banner_built_in['path_image'] = $server . 'image/catalog/banners/home-built-in.jpg';
        $tile_banner_built_in['href'] = $this->url->link('product/category', 'path=60_60');
        $tile_banner_built_in['title'] = 'Встроенные';
        $tile_banner_built_in['alt'] = 'Встроенные';
        $data['tile_banner_built_in'] = $tile_banner_built_in;

        $tile_banner_dressing_rooms = array();
        $tile_banner_dressing_rooms['path_image'] = $server . 'image/catalog/banners/home-dressing-rooms.jpg';
        $tile_banner_dressing_rooms['href'] = $this->url->link('product/category', 'path=68_68');
        $tile_banner_dressing_rooms['title'] = 'Гардеробные';
        $tile_banner_dressing_rooms['alt'] = 'Гардеробные';
        $data['tile_banner_dressing_rooms'] = $tile_banner_dressing_rooms;



        $comments = array();
        for($i = 1 ; $i < 4;  $i++) {
            $comment = array();
            $comment['id'] = $i;
            $comment['path_image'] = $server . 'image/catalog/home/home-review-' . $i . '.jpg';
            $comment['href'] = '';
            $comment['title'] = '';
            $comment['alt'] = '';
            $comments[] = $comment;
        }
        $data['comments'] = $comments;

        return $this->load->view('extension/module/home_module', $data);
	}
}