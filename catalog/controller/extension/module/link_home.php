<?php
class ControllerExtensionModuleLinkHome extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');



		$data['link'] = '';

		$data['module'] = $module++;

		return $this->load->view('extension/module/link_home', $data);
	}
}