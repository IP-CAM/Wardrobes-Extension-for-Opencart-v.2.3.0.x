<?php
class ControllerCalculatorCalculatorClients extends Controller {
	private $error = array();
	private $success = '';

	public function index() {
		$this->load->language('calculator/calculator');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('calculator/calculator');

        $this->getList();
	}


    /**
     * Visible List form
     *
     */
    public function getList()
    {
        //LINKS BEGIN
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

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('calculator/calculator_clients', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $data['sort_client_id'] = $this->url->link('calculator/calculator_clients',
            'token=' . $this->session->data['token'] . '&sort=cc.client_id' . $url, 'SSL');
        $data['sort_name'] = $this->url->link('calculator/calculator_clients',
            'token=' . $this->session->data['token'] . '&sort=cc.name' . $url, 'SSL');
        $data['delete'] = $this->url->link('calculator/calculator_clients/delete',
            'token=' . $this->session->data['token'] . $url, 'SSL');

        $data['client_heading_title'] = $this->language->get('heading_title');
        $data['heading_title_sub'] = $this->language->get('heading_title_sub');

        $data['column_client_id_label'] = $this->language->get('column_client_id_label');
        $data['column_name_label'] = $this->language->get('column_name_label');
        $data['column_email_label'] = $this->language->get('column_email_label');
        $data['column_telephone_label'] = $this->language->get('column_telephone_label');
        $data['column_type_label'] = $this->language->get('column_type_label');
        $data['column_width_label'] = $this->language->get('column_width_label');
        $data['column_height_label'] = $this->language->get('column_height_label');
        $data['column_depth_label'] = $this->language->get('column_depth_label');
        $data['column_ip_label'] = $this->language->get('column_ip_label');
        $data['column_status_label'] = $this->language->get('column_status_label');
        $data['column_action_label'] = $this->language->get('column_action_label');

        $data['button_delete_label'] = $this->language->get('button_delete_label');

        $data['text_no_results_label'] = $this->language->get('text_no_results_label');

        $data['column_link_page_label'] = $this->language->get('column_link_page_label');
        $data['column_receiver_of_product_label'] = $this->language->get('column_receiver_of_product_label');
        $data['column_price_label'] = $this->language->get('column_price_label');
        $data['column_action_label'] = $this->language->get('column_action_label');
        $data['text_no_results_label'] = $this->language->get('text_no_results_label');
        $data['button_link_form_label'] = $this->language->get('button_link_form_label');
        $data['button_insert_label'] = $this->language->get('button_insert_label');



        //TABLE PARAMETER BEGIN
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'сс.client_id';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }
        $data['sort'] = $sort;
        $data['order'] = $order;
        $list_parameters = array(
            'sort' => $sort,
            'order' => $order,
        );
        $results = $this->model_calculator_calculator->getCalculatorClients($list_parameters);
        $server_host = 'http://' . $_SERVER['HTTP_HOST'] . '/';
        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('button_edit'),
                'href' => $this->url->link('calculator/calculator_clients/update',
                    'token=' . $this->session->data['token'] . '&client_id=' . $result['client_id'] . $url, 'SSL')
            );


            $data['clients'][] = array(
                'client_id' => $result['client_id'],
                'name' => $result['name'],
                'type' => $result['type'],
                'telephone' => $result['telephone'],
                'width' => $result['width'],
                'height' => $result['height'],
                'depth' => $result['depth'],
                'email' => $result['email'],
                'ip' => $result['ip'],
                'status' => $result['status'],
                'action' => $action
            );
        }
        //TABLE PARAMETER END

        //language


        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('calculator/client_list', $data));
    }


    /**
     * Delete page payment (page list)
     *
     */
    public function delete()
    {
        $this->load->language('calculator/calculator');

        $this->load->model('calculator/calculator');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $client_id) {
                $this->model_calculator_calculator->deleteClient($client_id); //Delete strong BD
            }

            $this->session->data['success'] = $this->language->get('client_delete_label'); //Messange

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

            $this->response->redirect($this->url->link('calculator/calculator_clients', 'token=' . $this->session->data['token'] . $url,
                'SSL'));
        }
        $this->index();

    }




    /**
    * Validate delete user (client)
    *
    * @return bool
    * @author  Bobs
    */
    private function validateDelete()
    {
       /* if (!$this->user->hasPermission('modify', 'calculator/calculator_clients')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        if (!$this->error) {
            return true;
        } else {
            return false;
        }*/
        return true;
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