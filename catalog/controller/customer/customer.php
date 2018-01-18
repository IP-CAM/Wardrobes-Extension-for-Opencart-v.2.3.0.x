<?php
class ControllerCustomerCustomer extends Controller {



    public function ajaxAddCustomer()
    {

        $data = $this->request->post;

        $html = array();
        if($data['two_modal'] == 1) {
            $data_norm = array();
            $data_norm['data'] = $data;
            $html = $this->load->view('customer/modal_box_telephone', $data_norm);
        } else {
            $this->normalizeField($data, 'name');
            $this->normalizeField($data, 'email');
            $this->normalizeField($data, 'telephone');
            $data['ip'] = $_SERVER['REMOTE_ADDR'];
            $data['status']  = '1';

            $this->normalizeField($data, 'product_id');
            $this->normalizeField($data, 'type');
            $this->normalizeField($data, 'width');
            $this->normalizeField($data, 'height');
            $this->normalizeField($data, 'depth');
            $this->normalizeField($data, 'price');

            $this->load->model('customer/customer');
            $this->model_customer_customer->addCustomer($data);
            $html = $this->load->view('customer/modal_box', $data);
        }
        $json = array();
        $json['html'] = $html;

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));


    }


    private function  normalizeField(&$data, $name_field, $type = 'string') {
        if($type == 'string') {
            if(!isset($data[$name_field]) || $data[$name_field] == 'undefined') {
                $data[$name_field] = '';
            }
        }
        if($type == 'number') {
            if(!isset($data[$name_field])) {
                $data[$name_field] = '0';
            }
        }
    }
}