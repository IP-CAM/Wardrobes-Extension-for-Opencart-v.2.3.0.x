<?php
class ControllerExtensionModuleHomeModule extends Controller {
	public function index($setting) {
        $this->document->addScript('catalog/view/javascript/modal_window.js');
        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $tile_banner_standard = array();
        $tile_banner_standard['path_image'] = $server . 'image/catalog/banners/standard.png';
        $tile_banner_standard['href'] = '';
        $tile_banner_standard['title'] = '';
        $tile_banner_standard['alt'] = '';
        $data['tile_banner_standard'] = $tile_banner_standard;

        $tile_banner_radius = array();
        $tile_banner_radius['path_image'] = $server . 'image/catalog/banners/radius.png';
        $tile_banner_radius['href'] = '';
        $tile_banner_radius['title'] = '';
        $tile_banner_radius['alt'] = '';
        $data['tile_banner_radius'] = $tile_banner_radius;

        $tile_banner_calculator = array();
        $tile_banner_calculator['path_image'] = $server . 'image/catalog/banners/calculator.png';
        $tile_banner_calculator['href'] = '';
        $tile_banner_calculator['title'] = '';
        $tile_banner_calculator['alt'] = '';
        $data['tile_banner_calculator'] = $tile_banner_calculator;

        $tile_banner_built_in = array();
        $tile_banner_built_in['path_image'] = $server . 'image/catalog/banners/built-in.png';
        $tile_banner_built_in['href'] = '';
        $tile_banner_built_in['title'] = '';
        $tile_banner_built_in['alt'] = '';
        $data['tile_banner_built_in'] = $tile_banner_built_in;

        $tile_banner_dressing_rooms = array();
        $tile_banner_dressing_rooms['path_image'] = $server . 'image/catalog/banners/dressing_rooms.png';
        $tile_banner_dressing_rooms['href'] = '';
        $tile_banner_dressing_rooms['title'] = '';
        $tile_banner_dressing_rooms['alt'] = '';
        $data['tile_banner_dressing_rooms'] = $tile_banner_dressing_rooms;



        $comments = array();
        for($i = 0 ; $i < 3;  $i++) {
            $comment = array();
            $comment['id'] = $i;
            $comment['path_image'] = $server . 'image/catalog/comments/comments_photo_' . $i . '.png';
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