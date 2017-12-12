<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}


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

        $instagram_link = array();
        $instagram_link['path_image'] = $server . 'image/catalog/instagram.png';
        $instagram_link['href'] = '';
        $instagram_link['title'] = '';
        $instagram_link['alt'] = '';
        $data['instagram_link'] = $instagram_link;

        $vk_link = array();
        $vk_link['path_image'] = $server . 'image/catalog/vk.png';
        $vk_link['href'] = '';
        $vk_link['title'] = '';
        $vk_link['alt'] = '';
        $data['vk_link'] = $vk_link;

        $twitter_link = array();
        $twitter_link['path_image'] = $server . 'image/catalog/twitter.png';
        $twitter_link['href'] = '';
        $twitter_link['title'] = '';
        $twitter_link['alt'] = '';
        $data['twitter_link'] = $twitter_link;


        $data['base'] = $server;

        return $this->load->view('common/footer', $data);
	}
}
