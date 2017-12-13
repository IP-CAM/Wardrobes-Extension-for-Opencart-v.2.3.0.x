<?php
class ControllerInformationCalculator extends Controller {
	public function index() {
		$this->load->language('information/calculator');

		$this->load->model('catalog/calculator');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['calculator_id'])) {
			$calculator_id = (int)$this->request->get['calculator_id'];
		} else {
			$calculator_id = 0;
		}

		$calculator_info = $this->model_catalog_calculator->getInformation($calculator_id);

		if ($calculator_info) {
			$this->document->setTitle($calculator_info['meta_title']);
			$this->document->setDescription($calculator_info['meta_description']);
			$this->document->setKeywords($calculator_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $calculator_info['title'],
				'href' => $this->url->link('information/calculator', 'calculator_id=' .  $calculator_id)
			);

			$data['heading_title'] = $calculator_info['title'];

			$data['button_continue'] = $this->language->get('button_continue');

			$data['description'] = html_entity_decode($calculator_info['description'], ENT_QUOTES, 'UTF-8');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/calculator', $data));
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/calculator', 'calculator_id=' . $calculator_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function agree() {
		$this->load->model('catalog/calculator');

		if (isset($this->request->get['calculator_id'])) {
			$calculator_id = (int)$this->request->get['calculator_id'];
		} else {
			$calculator_id = 0;
		}

		$output = '';

		$calculator_info = $this->model_catalog_calculator->getInformation($calculator_id);

		if ($calculator_info) {
			$output .= html_entity_decode($calculator_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}