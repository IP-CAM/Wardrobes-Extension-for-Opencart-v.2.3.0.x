<?php
class ControllerCatalogCalculator extends Controller {
	private $error = array();
	private $success = '';

	public function index() {
		$this->load->language('catalog/calculator');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/calculator');

		$this->getForm();
	}


	protected function getForm() {
        $this->document->addScript('admin/view/javascript/summernote/summernote.js');
        $this->document->addScript('admin/view/javascript/summernote/opencart.js');
        $this->document->addStyle('admin/view/javascript/summernote/summernote.css');

		$data['heading_title'] = $this->language->get('heading_title');


		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_bottom'] = $this->language->get('entry_bottom');
        $data['entry_description'] = $this->language->get('entry_description');
		$data['entry_status'] = $this->language->get('entry_status');


		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_bottom'] = $this->language->get('help_bottom');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');


		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);
		$data['action'] = $this->url->link('catalog/calculator/edit', 'token=' . $this->session->data['token'], true);


        //$data['token'] = $this->session->data['token'];
        $data['error_warning'] = null;
        $data['error_keyword'] = null;
        $data['success'] = $this->success;


        $calculator_info = $this->model_catalog_calculator->getCalculator(1);



		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();


        $data['language_id'] = $calculator_info['language_id'];
        $data['title'] = $calculator_info['title'];
        $data['meta_title'] = $calculator_info['meta_title'];
        $data['meta_description'] = $calculator_info['meta_description'];
        $data['meta_keyword'] = $calculator_info['meta_keyword'];
        $data['keyword'] = $calculator_info['keyword'];
        $data['description'] = $calculator_info['description'];
        $data['status'] = $calculator_info['status'];


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/calculator', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/calculator')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['calculator_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (utf8_strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['calculator_id']) && $url_alias_info['query'] != 'calculator_id=' . $this->request->get['calculator_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['calculator_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}


    public function edit()
    {

        $this->load->model('catalog/calculator');

        $this->load->language('catalog/calculator');

        $this->model_catalog_calculator->editCalculator('1', $this->request->post);

        $this->success = $this->language->get('success_update');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->getForm();

        //$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
    }


}