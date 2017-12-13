<?php
class ControllerCatalogCalculator extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/calculator');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/calculator');

		$this->getForm();
	}






	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['calculator_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_bottom'] = $this->language->get('entry_bottom');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');

		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_bottom'] = $this->language->get('help_bottom');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/calculator', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['calculator_id'])) {
			$data['action'] = $this->url->link('catalog/calculator/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/calculator/edit', 'token=' . $this->session->data['token'] . '&calculator_id=' . $this->request->get['calculator_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/calculator', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['calculator_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$calculator_info = $this->model_catalog_calculator->getInformation($this->request->get['calculator_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['calculator_description'])) {
			$data['calculator_description'] = $this->request->post['calculator_description'];
		} elseif (isset($this->request->get['calculator_id'])) {
			$data['calculator_description'] = $this->model_catalog_calculator->getInformationDescriptions($this->request->get['calculator_id']);
		} else {
			$data['calculator_description'] = array();
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['calculator_store'])) {
			$data['calculator_store'] = $this->request->post['calculator_store'];
		} elseif (isset($this->request->get['calculator_id'])) {
			$data['calculator_store'] = $this->model_catalog_calculator->getInformationStores($this->request->get['calculator_id']);
		} else {
			$data['calculator_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($calculator_info)) {
			$data['keyword'] = $calculator_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['bottom'])) {
			$data['bottom'] = $this->request->post['bottom'];
		} elseif (!empty($calculator_info)) {
			$data['bottom'] = $calculator_info['bottom'];
		} else {
			$data['bottom'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($calculator_info)) {
			$data['status'] = $calculator_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($calculator_info)) {
			$data['sort_order'] = $calculator_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['calculator_layout'])) {
			$data['calculator_layout'] = $this->request->post['calculator_layout'];
		} elseif (isset($this->request->get['calculator_id'])) {
			$data['calculator_layout'] = $this->model_catalog_calculator->getInformationLayouts($this->request->get['calculator_id']);
		} else {
			$data['calculator_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

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


}