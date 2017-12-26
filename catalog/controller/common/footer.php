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

        $data['home'] = $this->url->link('common/home');

        $data['aboutcompany'] = $this->url->link('aboutcompany/aboutcompany');

		$data['calculator'] = $this->url->link('calculator/calculator');
        $data['generalcatalog'] = $this->url->link('generalcatalog/generalcatalog');
        $data['special'] = $this->url->link('special/special');
        $data['review'] = $this->url->link('review/review');

		$data['contacts'] = $this->url->link('contacts/contacts');

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

        $instagram_link = array();
        $instagram_link['path_image'] = $server . 'image/catalog/instagram.png';
        $instagram_link['href'] = '';
        $instagram_link['title'] = '';
        $instagram_link['alt'] = '';
        $data['instagram_link'] = $instagram_link;

        $vk_link = array();
        $vk_link['path_image'] = $server . 'image/catalog/vk.png';
        $vk_link['href'] = 'https://vk.com/centr_mebeli';
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
