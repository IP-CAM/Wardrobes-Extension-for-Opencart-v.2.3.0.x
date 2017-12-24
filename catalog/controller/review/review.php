<?php
class ControllerReviewReview extends Controller {
	public function index() {

		$this->load->model('review/review');
        $this->load->model('catalog/category');

        $review_info = $this->model_review_review->getReview(0);
        $this->load->language('common/header');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        $data['breadcrumbs'][] = array(
            'text' => $review_info['title'],
            'href' => $this->url->link('review/review')
        );

        //of table Calculator_description


        $this->document->setTitle($review_info['meta_title']);
        $this->document->setDescription($review_info['meta_description']);
        $this->document->setKeywords($review_info['meta_keyword']);



        $data['description'] = html_entity_decode($review_info['description'], ENT_QUOTES, 'UTF-8');

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $data['base'] = $server;


        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('review/review', $data));

	}
}