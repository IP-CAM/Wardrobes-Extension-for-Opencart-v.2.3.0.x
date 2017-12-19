<?php
class ControllerCustomerCustomer extends Controller {



    public function ajaxAddCustomer()
    {

        $data = $this->request->post;

        $html = array();
        if($data['telephone_isset'] == 0) {
            $data_norm = array();
            $data_norm['data'] = $data;
            $html = $this->load->view('common/modal_box_telephone', $data_norm);
        } else {
            $this->noralizeField($data, 'name');
            $this->noralizeField($data, 'email');
            $this->noralizeField($data, 'telephone');
            $data['ip'] = $_SERVER['REMOTE_ADDR'];
            $data['status']  = '1';

            $this->noralizeField($data, 'product_id');
            $this->noralizeField($data, 'type');
            $this->noralizeField($data, 'width');
            $this->noralizeField($data, 'height');
            $this->noralizeField($data, 'depth');

            $this->load->model('customer/customer');
            $products = $this->model_customer_customer->addCustomer($data);
            $html = $this->load->view('common/modal_box', $data);
        }
        $json = array();
        $json['html'] = $html;
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));


    }


    private function  noralizeField(&$data, $name_field, $type = 'string') {
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