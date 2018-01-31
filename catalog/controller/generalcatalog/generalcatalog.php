<?php
class ControllerGeneralcatalogGeneralcatalog extends Controller {
	public function index() {

		$this->load->model('generalcatalog/generalcatalog');
        $this->load->model('catalog/category');

        $this->document->addStyle('catalog/view/javascript/generalcatalog/generalcatalog.css');

        $contacts_info = $this->model_generalcatalog_generalcatalog->getGeneralcatalog(0);
        $this->load->language('common/header');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        $data['breadcrumbs'][] = array(
            'text' => $contacts_info['title'],
            'href' => $this->url->link('generalcatalog/generalcatalog')
        );

        //of table Calculator_description


        $this->document->setTitle($contacts_info['meta_title']);
        $this->document->setDescription($contacts_info['meta_description']);
        $this->document->setKeywords($contacts_info['meta_keyword']);


        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $box_images_ar = array(
            ['name_img'=>'standard', 'name'=>'Стандартные' , 'id' =>'67'],
            ['name_img'=>'built_in','name'=>'Встроенные' , 'id' =>'60'],
            ['name_img'=>'corner','name'=>'Угловые' , 'id' =>'66'],
            ['name_img'=>'our_work','name'=>'Наши работы' , 'id' =>'70'],
            ['name_img'=>'radius','name'=>'Радиусные' , 'id' =>'64'],
            ['name_img'=>'hallway','name'=>'Прихожие' , 'id' =>'69'],
            ['name_img'=>'cabinet_cabinets','name'=>'Корпусные' , 'id' =>'72'],
            ['name_img'=>'door_coupe','name'=>'Двери-купе' , 'id' =>'73'],
            ['name_img'=>'dressing_room', 'name'=>'Гардеробные' , 'id' =>'68']
        );
        $box_images = array();
        foreach($box_images_ar as $box_image_ar) {
            $box_image = array();
            $box_image['path_image'] = $server . 'image/catalog/generalcatalog/desktop/' . $box_image_ar['name_img']. '.jpg';
            $box_image['name'] = $box_image_ar['name'];
            $box_image['name_img'] = $box_image_ar['name_img'];
            $box_image['href'] = $this->url->link('product/category', 'path=' . $box_image_ar['id'] . '_' . $box_image_ar['id']);
            $box_images[] = $box_image;
        }


        $box_images_html = array();
        foreach($box_images as $key => $box_image) {
            $html_block = '';
            $html_block .= '<a class="reference" href="' . $box_image['href'] . '">';
            $html_block .= '<div class="box" id="box-' . ((int)$key + 1) . '">';
            $html_block .= '<div class="image-box">';
            $html_block .= '<img src="' . $box_image['path_image'] . '"';
            $html_block .= 'title="' . $box_image['name'] . ' "';
            $html_block .= 'alt="' . $box_image['name'] . '"';
            $html_block .= 'class="img-responsive center-block"/>';
            $html_block .= '</div>';
            $html_block .= '<div class="name-box name-box text-center">';
            $html_block .= '<p class="font-type-georgia">' . $box_image['name'] . '</p>';
            $html_block .= '</div>';
            $html_block .= '</div>';
            $html_block .= '</a>';
            $box_images_html[$box_image['name_img']] = $html_block;
        }
        $data['box_images_html'] = $box_images_html;



        //mobile version
        if (isset($this->request->server['HTTP_REFERER'])) {
            $referer_mobile = $this->request->server['HTTP_REFERER'];
        } else {
            $referer_mobile = $this->url->link('common/home');
        }
        $data['referer_mobile'] = $referer_mobile;


        $box_images_mobile_ar = array(
            ['name_img'=>'standard', 'name'=>'Стандартные' , 'id' =>'67'],
            ['name_img'=>'built_in','name'=>'Встроенные' , 'id' =>'60'],
            ['name_img'=>'corner','name'=>'Угловые' , 'id' =>'66'],
            ['name_img'=>'our_work','name'=>'Наши работы' , 'id' =>'70'],
            ['name_img'=>'radius','name'=>'Радиусные' , 'id' =>'64'],
            ['name_img'=>'hallway','name'=>'Прихожие' , 'id' =>'69'],
            ['name_img'=>'dressing_room', 'name'=>'Гардеробные' , 'id' =>'68']
        );
        $box_images_mobile = array();
        foreach($box_images_mobile_ar as $box_image_mobile_ar) {
            $box_image = array();
            $box_image['path_image'] = $server . 'image/catalog/generalcatalog/mobile/' . $box_image_mobile_ar['name_img']. '.jpg';
            $box_image['name'] = $box_image_mobile_ar['name'];
            $box_image['name_img'] = $box_image_mobile_ar['name_img'];
            $box_image['href'] = $this->url->link('product/category', 'path=' . $box_image_mobile_ar['id'] . '_' . $box_image_mobile_ar['id']);
            $box_images_mobile[] = $box_image;
        }

        $box_images_mobile_html = array();
        foreach($box_images_mobile as $key => $box_image_mobile) {
            $html_block = '';
            $html_block .= '<a class="reference-mobile" href="' . $box_image_mobile['href'] . '">';
            $html_block .= '<div class="box-mobile" id="box-' . ((int)$key + 1) . '">';
            $html_block .= '<div class="image-box">';
            $html_block .= '<img src="' . $box_image_mobile['path_image'] . '"';
            $html_block .= 'title="' . $box_image_mobile['name'] . ' "';
            $html_block .= 'alt="' . $box_image_mobile['name'] . '"';
            $html_block .= 'class="img-responsive center-block"/>';
            $html_block .= '</div>';
            $html_block .= '<div class="name-box name-box-mobile text-center">';
            $html_block .= '<p class="font-type-georgia">' . $box_image_mobile['name'] . '</p>';
            $html_block .= '</div>';
            $html_block .= '</div>';
            $html_block .= '</a>';
            $box_images_mobile_html[$box_image_mobile['name_img']] = $html_block;
        }
        $data['box_images_mobile_html'] = $box_images_mobile_html;



        $data['description'] = html_entity_decode($contacts_info['description'], ENT_QUOTES, 'UTF-8');

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

        $this->response->setOutput($this->load->view('generalcatalog/generalcatalog', $data));

	}
}