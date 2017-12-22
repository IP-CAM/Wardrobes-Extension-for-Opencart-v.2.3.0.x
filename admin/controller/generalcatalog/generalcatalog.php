<?php
class ControllerGeneralcatalogGeneralcatalog extends Controller {
	private $error = array();
	private $success = '';

	public function index() {
		$this->load->language('generalcatalog/generalcatalog');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('generalcatalog/generalcatalog');

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
		$data['action'] = $this->url->link('generalcatalog/generalcatalog/edit', 'token=' . $this->session->data['token'], true);


        //$data['token'] = $this->session->data['token'];
        $data['error_warning'] = null;
        $data['error_keyword'] = null;
        $data['success'] = $this->success;


        $contacts_info = $this->model_generalcatalog_generalcatalog->getGeneralcatalog(0);



		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();


        $data['language_id'] = $contacts_info['language_id'];
        $data['title'] = $contacts_info['title'];
        $data['meta_title'] = $contacts_info['meta_title'];
        $data['meta_description'] = $contacts_info['meta_description'];
        $data['meta_keyword'] = $contacts_info['meta_keyword'];
        $data['keyword'] = $contacts_info['keyword'];
        $data['description'] = $contacts_info['description'];
        $data['status'] = $contacts_info['status'];


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('contacts/contacts', $data));
	}


    public function edit()
    {

        $this->load->model('generalcatalog/generalcatalog');

        $this->load->language('generalcatalog/generalcatalog');

        $this->model_generalcatalog_generalcatalog->editGeneralcatalog('0', $this->request->post);

        $this->success = $this->language->get('success_update');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->getForm();

        //$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
    }


}