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
        $tile_banner_standard['href'] = '';
        $tile_banner_standard['title'] = '';
        $tile_banner_standard['alt'] = '';
        $data['tile_banner_standard'] = $tile_banner_standard;

        $tile_banner_radius = array();
        $tile_banner_radius['path_image'] = $server . 'image/catalog/banners/home-radius.jpg';
        $tile_banner_radius['href'] = '';
        $tile_banner_radius['title'] = '';
        $tile_banner_radius['alt'] = '';
        $data['tile_banner_radius'] = $tile_banner_radius;

        $tile_banner_calculator = array();
        $tile_banner_calculator['path_image'] = $server . 'image/catalog/banners/home-calculator.jpg';
        $tile_banner_calculator['href'] = '';
        $tile_banner_calculator['title'] = '';
        $tile_banner_calculator['alt'] = '';
        $data['tile_banner_calculator'] = $tile_banner_calculator;

        $tile_banner_built_in = array();
        $tile_banner_built_in['path_image'] = $server . 'image/catalog/banners/home-built-in.jpg';
        $tile_banner_built_in['href'] = '';
        $tile_banner_built_in['title'] = '';
        $tile_banner_built_in['alt'] = '';
        $data['tile_banner_built_in'] = $tile_banner_built_in;

        $tile_banner_dressing_rooms = array();
        $tile_banner_dressing_rooms['path_image'] = $server . 'image/catalog/banners/home-dressing-rooms.jpg';
        $tile_banner_dressing_rooms['href'] = $this->url->link('review/review');
        $tile_banner_dressing_rooms['title'] = '';
        $tile_banner_dressing_rooms['alt'] = '';
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

        $service = array();
        $service['path_image'] = $server . 'image/catalog/service.png';
        $service['href'] = '';
        $service['title'] = '';
        $service['alt'] = '';
        $data['service'] = $service;

        return $this->load->view('extension/module/home_module', $data);
	}
}