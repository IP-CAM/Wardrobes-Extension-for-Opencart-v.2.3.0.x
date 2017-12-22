<?php
class ControllerExtensionModuleCategory extends Controller {
	public function index() {
		$this->load->language('extension/module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategoriesAll();
        $children_data = array();
		foreach ($categories as $category) {
            $children_data[$category['category_id']]['href'] = $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $category['category_id']);
        }
        $data['categories'] = $children_data;




		return $this->load->view('extension/module/category', $data);
	}
}