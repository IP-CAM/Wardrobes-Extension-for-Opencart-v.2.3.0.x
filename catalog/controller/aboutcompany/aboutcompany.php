<?php
class ControllerAboutcompanyAboutcompany extends Controller {
	public function index() {

		$this->load->model('aboutcompany/aboutcompany');
        $this->load->model('catalog/category');

        $aboutcompany_info = $this->model_aboutcompany_aboutcompany->getAboutcompany(0);
        $this->load->language('common/header');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        $data['breadcrumbs'][] = array(
            'text' => $aboutcompany_info['title'],
            'href' => $this->url->link('aboutcompany/aboutcompany')
        );

        //for mobile version
        if (isset($this->request->server['HTTP_REFERER'])) {
            $referer_mobile = $this->request->server['HTTP_REFERER'];
        } else {
            $referer_mobile = $this->url->link('common/home');
        }
        $data['referer_mobile'] = $referer_mobile;

        //of table Calculator_description


        $this->document->setTitle($aboutcompany_info['meta_title']);
        $this->document->setDescription($aboutcompany_info['meta_description']);
        $this->document->setKeywords($aboutcompany_info['meta_keyword']);



        $data['description'] = html_entity_decode($aboutcompany_info['description'], ENT_QUOTES, 'UTF-8');

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

        $this->response->setOutput($this->load->view('aboutcompany/aboutcompany', $data));

	}
}