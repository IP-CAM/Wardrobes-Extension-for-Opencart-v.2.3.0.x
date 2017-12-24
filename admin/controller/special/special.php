<?php
class ControllerSpecialSpecial extends Controller {
	private $error = array();
	private $success = '';

	public function index() {
		$this->load->language('special/special');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('special/special');

		$this->getForm();
	}


	protected function getForm() {

        $this->load->model('catalog/product');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

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
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');

        $data['entry_product_discounts'] = $this->language->get('entry_product_discounts');
        $data['entry_limit_discounts'] = $this->language->get('entry_limit_discounts');
        $data['entry_status_discounts'] = $this->language->get('entry_status_discounts');

        $data['entry_product_bestsellers'] = $this->language->get('entry_product_bestsellers');
        $data['entry_limit_bestsellers'] = $this->language->get('entry_limit_bestsellers');
        $data['entry_status_bestsellers'] = $this->language->get('entry_status_bestsellers');


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
		$data['action'] = $this->url->link('special/special/edit', 'token=' . $this->session->data['token'], true);


        //$data['token'] = $this->session->data['token'];
        $data['error_warning'] = null;
        $data['error_keyword'] = null;
        $data['success'] = $this->success;


        $special_info = $this->model_special_special->getSpecial(0);


        $data['title'] = $special_info['title'];
        $data['meta_title'] = $special_info['meta_title'];
        $data['meta_description'] = $special_info['meta_description'];
        $data['meta_keyword'] = $special_info['meta_keyword'];
        $data['keyword'] = $special_info['keyword'];
        $data['description'] = $special_info['description'];
        $data['status'] = $special_info['status'];


        $data['limit_discounts'] = $special_info['limit_discounts'];
        $data['status_discounts'] = $special_info['status_discounts'];
        $product_discounts = $special_info['product_discounts'];
        $product_discounts = json_decode($product_discounts, true);
        foreach ($product_discounts['product'] as $product_discounts_id) {
            $product_info = $this->model_catalog_product->getProduct($product_discounts_id);
            if ($product_info) {
                $data['products_discounts'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name'       => $product_info['name']
                );
            }
        }


        $data['limit_bestsellers'] = $special_info['limit_bestsellers'];
        $data['status_bestsellers'] = $special_info['status_bestsellers'];
        $product_bestsellers = $special_info['product_bestsellers'];
        $product_bestsellers = json_decode($product_bestsellers, true);
        foreach ($product_bestsellers as $product_bestsellers_id) {
            $product_info = $this->model_catalog_product->getProduct($product_bestsellers_id);
            if ($product_info) {
                $data['product_bestsellers'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name'       => $product_info['name']
                );
            }
        }



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');



        //product







        if (isset($this->request->post['width'])) {
            $data['width'] = $this->request->post['width'];
        } elseif (!empty($module_info)) {
            $data['width'] = $module_info['width'];
        } else {
            $data['width'] = 218;
        }

        if (isset($this->request->post['height'])) {
            $data['height'] = $this->request->post['height'];
        } elseif (!empty($module_info)) {
            $data['height'] = $module_info['height'];
        } else {
            $data['height'] = 218;
        }



        //ERROR
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['width'])) {
            $data['error_width'] = $this->error['width'];
        } else {
            $data['error_width'] = '';
        }

        if (isset($this->error['height'])) {
            $data['error_height'] = $this->error['height'];
        } else {
            $data['error_height'] = '';
        }



		$this->response->setOutput($this->load->view('special/special', $data));
	}


    public function edit()
    {

        $this->load->model('special/special');

        $this->load->language('special/special');

        $this->model_special_special->editSpecial('0', $this->request->post);

        $this->success = $this->language->get('success_update');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->getForm();

        //$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
    }


    protected function validate() {

        if (!$this->request->post['width']) {
            $this->error['width'] = $this->language->get('error_width');
        }

        if (!$this->request->post['height']) {
            $this->error['height'] = $this->language->get('error_height');
        }

        return !$this->error;
    }


}