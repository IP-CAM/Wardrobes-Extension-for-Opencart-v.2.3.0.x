<?php
class ControllerAboutcompanyAboutcompany extends Controller {
	private $error = array();
	private $success = '';

	public function index() {
		$this->load->language('aboutcompany/aboutcompany');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('aboutcompany/aboutcompany');

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
		$data['action'] = $this->url->link('aboutcompany/aboutcompany/edit', 'token=' . $this->session->data['token'], true);


        //$data['token'] = $this->session->data['token'];
        $data['error_warning'] = null;
        $data['error_keyword'] = null;
        $data['success'] = $this->success;


        $aboutcompany_info = $this->model_aboutcompany_aboutcompany->getAboutcompany(1);



		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();


        $data['language_id'] = $aboutcompany_info['language_id'];
        $data['title'] = $aboutcompany_info['title'];
        $data['meta_title'] = $aboutcompany_info['meta_title'];
        $data['meta_description'] = $aboutcompany_info['meta_description'];
        $data['meta_keyword'] = $aboutcompany_info['meta_keyword'];
        $data['keyword'] = $aboutcompany_info['keyword'];
        $data['description'] = $aboutcompany_info['description'];
        $data['status'] = $aboutcompany_info['status'];


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('aboutcompany/aboutcompany', $data));
	}

    public function edit()
    {

        $this->load->model('aboutcompany/aboutcompany');

        $this->load->language('aboutcompany/aboutcompany');

        $this->model_aboutcompany_aboutcompany->editAboutcompany('0', $this->request->post);

        $this->success = $this->language->get('success_update');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->getForm();

        //$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
    }


}