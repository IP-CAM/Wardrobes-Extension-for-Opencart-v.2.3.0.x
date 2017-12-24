<?php
class ControllerReviewReviewSettings extends Controller {
	private $error = array();
	private $success = '';

	public function index() {
		$this->load->language('review/review_settings');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('review/review_settings');

		$this->getForm();
	}


	protected function getForm() {
       // $this->document->addScript('admin/view/javascript/summernote/summernote.js');
       // $this->document->addScript('admin/view/javascript/summernote/opencart.js');
       // $this->document->addStyle('admin/view/javascript/summernote/summernote.css');

		$data['heading_title'] = $this->language->get('heading_title');



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
		$data['action'] = $this->url->link('review/review_settings/edit', 'token=' . $this->session->data['token'], true);


        //$data['token'] = $this->session->data['token'];
        $data['error_warning'] = null;
        $data['error_keyword'] = null;
        $data['success'] = $this->success;


        $review_info = $this->model_review_review_settings->getReview(0);


        $data['title'] = $review_info['title'];
        $data['meta_title'] = $review_info['meta_title'];
        $data['meta_description'] = $review_info['meta_description'];
        $data['meta_keyword'] = $review_info['meta_keyword'];
        $data['keyword'] = $review_info['keyword'];
        $data['description'] = $review_info['description'];
        $data['status'] = $review_info['status'];


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('review/review_settings', $data));
	}


    public function edit()
    {

        $this->load->model('review/review_settings');

        $this->load->language('review/review_settings');

        $this->model_review_review_settings->editReview('0', $this->request->post);

        $this->success = $this->language->get('success_update');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->getForm();

        //$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
    }


}