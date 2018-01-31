<?php
class ControllerCommonHome extends Controller {
	public function index() {

        $this->load->model('tool/image');
        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        $this->document->addScript('catalog/view/javascript/jquery/modal-window/modal-window.js');
        $this->document->addStyle('catalog/view/javascript/jquery/modal-window/modal-window.css');

        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel-2/owl.carousel.min.js');
        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel-2/owl.carousel.min.css');

        $this->document->addStyle('catalog/view/javascript/home/home.css');
        $this->document->addScript('catalog/view/javascript/home/home.js');

        if (isset($this->request->get['route'])) {
            $this->document->addLink($this->config->get('config_url'), 'canonical');
        }


        $data['link_calculator'] = $this->url->link('calculator/calculator');
        $data['link_review'] = $this->url->link('review/review');


        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $data['generalcatalog'] = $this->url->link('generalcatalog/generalcatalog');
        $data['special'] = $this->url->link('special/special');

        $box_images_ar = array(
            ['name_img'=>'standard', 'name'=>'Стандартные' , 'id' =>'67'],
            ['name_img'=>'built_in','name'=>'Встроенные' , 'id' =>'60'],
            ['name_img'=>'radius','name'=>'Радиусные' , 'id' =>'64'],
            ['name_img'=>'dressing_room', 'name'=>'Гардеробные' , 'id' =>'68'],
            ['name_img'=>'calculator','name'=>'Рассчет стоимости' , 'id' =>'-1']
        );
        $box_images = array();
        foreach($box_images_ar as $box_image_ar) {
            $box_image = array();
            $box_image['path_image'] = $server . 'image/catalog/home/banners/desktop/' . $box_image_ar['name_img']. '.jpg';

            $box_image['name'] = $box_image_ar['name'];
            $box_image['name_img'] = $box_image_ar['name_img'];
            if($box_image_ar['id'] != -1) {
                $box_image['href'] = $this->url->link('product/category', 'path=' . $box_image_ar['id'] . '_' . $box_image_ar['id']);
                $box_image['path_image_mobile'] = $this->model_tool_image->resize('catalog/home/banners/desktop/' . $box_image_ar['name_img']. '.jpg', 218, 108);
                $box_image['text_check'] = true;
            } else {
                $box_image['path_image_mobile'] = $this->model_tool_image->resize('catalog/home/banners/desktop/' . $box_image_ar['name_img']. '.jpg', 218, 220);
                $box_image['href'] = $this->url->link('calculator/calculator');
                $box_image['text_check'] = false;
            }
            $box_images[] = $box_image;
        }

        $data['box_images_html'] = $this->getHtmlBoxImage($box_images, false);
        $data['box_images_html_mobile'] = $this->getHtmlBoxImage($box_images, true);





        //mobile version
        if (isset($this->request->server['HTTP_REFERER'])) {
            $referer_mobile = $this->request->server['HTTP_REFERER'];
        } else {
            $referer_mobile = $this->url->link('common/home');
        }
        $data['referer_mobile'] = $referer_mobile;

        $comments = array(
            ['name' => 'Алёна Соболева', 'reference' => '', 'text' => 'Купила шкаф-купе в магазине «Центр Мебели» и не пожалела о том, что выбрала их. Цены ниже чем на других сайтах, качество, а также своевременная доставка. Сам шкаф большой и вместительный, всё работает. Выполнили мои пожелания и рекомендации. Вся семья довольна... посоветую всем своим подругам!'],
            ['name' => 'Иван Савельев', 'reference' => 'vk', 'text' => 'Был потрясён большим количеством цветов и материалов. Позвонил. Меня консультировала менеджер Наташа, очень любезная девушка, которая подобрала дизайн дверей-купе и посчитала стоимость. Купил шкаф-купе - очень здорово. Настоящие профессионалы своего дела!'],
            ['name' => 'Арина Игнатьевна', 'reference' => 'instagram','text' => 'Долго искала где купить шкаф-купе. Хотела заказать шкаф нестандартного размера, поэтому специально решила купить у производителя. После консультации с менеджером внесли небольшие поправки в изначальном проекте. Сделали и доставили, вопреки сомнениям, быстро. Была приятно удивлена бесплатной доставкой и сборкой.']
        );


        $comments_norm = array();
        foreach($comments as $key => $comment) {
            $comment_norm = array();
            $comment_norm['id'] = $key;
            $comment_norm['name'] = $comment['name'];
            $comment_norm['path_image'] = $this->model_tool_image->resize('catalog/home/home-review-' . ($key+1) . '.jpg', 150, 150);
            $comment_norm['href'] = '';
            $comment_norm['title'] = '';
            $comment_norm['alt'] = $comment['name'];
            $comment_norm['text'] = $comment['text'];


            switch ($comment['reference']) {
                case 'vk':
                    $comment_norm['reference'] = array();
                    $comment_norm['reference']['image_path'] = $server . 'image/catalog/home/reference/vk.png';
                    $comment_norm['reference']['link'] = 'https://vk.com/topic-93494790_32179816';
                    $comment_norm['reference']['name'] = 'Ссылка на соц. сети';
                    break;
                case 'instagram':
                    $comment_norm['reference'] = array();
                    $comment_norm['reference']['image_path'] = $server . 'image/catalog/home/reference/instagram.png';
                    $comment_norm['reference']['link'] = 'https://www.instagram.com/centr_mebeli_spb';
                    $comment_norm['reference']['name'] = 'Ссылка на соц. сети';
                    break;
                case '':
                    $comment_norm['reference'] = null;
                    break;
            }


            $comments_norm[] = $comment_norm;
        }
        $data['comments'] = $comments_norm;


        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}

    /*
     * $box_images - массив с данными для построения html
     * return - готовый html кусок для вставки в шаблон
     */
    private function getHtmlBoxImage($box_images, $mobile=false) {
        $box_images_html = array();
        foreach($box_images as $key => $box_image) {
            $path_image = '';
            if($mobile) {
                $path_image = $box_image['path_image_mobile'];
            } else {
                $path_image = $box_image['path_image'];
            }
            $html_block = '';
            $html_block .= '<a class="reference" href="' . $box_image['href'] . '">';
            $html_block .= '<div class="box" id="box-' . ((int)$key + 1) . '">';
            $html_block .= '<div class="image-box">';
            $html_block .= '<img src="' . $path_image . '"';
            $html_block .= 'title="' . $box_image['name'] . ' "';
            $html_block .= 'alt="' . $box_image['name'] . '"';
            $html_block .= 'class="img-responsive center-block"/>';
            $html_block .= '</div>';
            if($box_image['text_check']) {
                $html_block .= '<div class="name-box name-box text-center">';
                $html_block .= '<p class="font-type-georgia">' . $box_image['name'] . '</p>';
                $html_block .= '</div>';
            }
            $html_block .= '</div>';
            $html_block .= '</a>';
            $box_images_html[$box_image['name_img']] = $html_block;
        }
        return $box_images_html;
    }
}
