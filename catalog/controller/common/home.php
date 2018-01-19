<?php
class ControllerCommonHome extends Controller {
	public function index() {


        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        $this->document->addScript('catalog/view/javascript/jquery/modal-window/modal-window.js');
        $this->document->addStyle('catalog/view/javascript/jquery/modal-window/modal-window.css');

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

        $box_images_ar = array(
            ['name_img'=>'standard', 'name'=>'Стандартные' , 'id' =>'67'],
            ['name_img'=>'built_in','name'=>'Встроенные' , 'id' =>'60'],
            ['name_img'=>'radius','name'=>'Радиусные' , 'id' =>'64'],
            ['name_img'=>'dressing_room', 'name'=>'Гардеробные' , 'id' =>'68'],
            ['name_img'=>'calculator','name'=>'Рассчет стоимости' , 'id' =>'-1']
        );
        $box_images_mobile = array();
        foreach($box_images_ar as $box_image_ar) {
            $box_image = array();
            $box_image['path_image'] = $server . 'image/catalog/home/banners/desktop/' . $box_image_ar['name_img']. '.jpg';
            $box_image['name'] = $box_image_ar['name'];
            $box_image['name_img'] = $box_image_ar['name_img'];
            if($box_image_ar['id'] != -1) {
                $box_image['href'] = $this->url->link('product/category', 'path=' . $box_image_ar['id'] . '_' . $box_image_ar['id']);
            } else {
                $box_image['href'] = $this->url->link('calculator/calculator');
            }
            $box_images_mobile[] = $box_image;
        }


        $box_images_html = array();
        foreach($box_images_mobile as $key => $box_image) {
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



        $comments = array(
            ['name' => 'Алёна Соболева', 'text' => 'Купила шкаф-купе в магазине «Центр Мебели» и не пожалела о том, что выбрала их. Цены ниже чем на других сайтах, качество, а также своевременная доставка. Сам шкаф большой и вместительный, всё работает. Выполнили мои пожелания и рекомендации. Вся семья довольна... посоветую всем своим подругам!'],
            ['name' => 'Иван Савельев', 'text' => 'Был потрясён большим количеством цветов и материалов. Позвонил. Меня консультировала менеджер Наташа, очень любезная девушка, которая подобрала дизайн дверей-купе и посчитала стоимость. Купил шкаф-купе - очень здорово. Настоящие профессионалы своего дела!'],
            ['name' => 'Арина Игнатьевна', 'text' => 'Долго искала где купить шкаф-купе. Хотела заказать шкаф нестандартного размера, поэтому специально решила купить у производителя. После консультации с менеджером внесли небольшие поправки в изначальном проекте. Сделали и доставили, вопреки сомнениям, быстро. Была приятно удивлена бесплатной доставкой и сборкой.']
        );



        $this->load->model('tool/image');

        $comments_norm = array();
        foreach($comments as $key => $comment) {
            //$file_path_image_old = $server .'image/catalog/home/home-review-' . ($key+1) . '.jpg';


            $comment_norm = array();
            $comment_norm['id'] = $key;
            $comment_norm['name'] = $comment['name'];
            $comment_norm['path_image'] = $this->model_tool_image->resize('catalog/home/home-review-' . ($key+1) . '.jpg', 150, 150);
            $comment_norm['href'] = '';
            $comment_norm['title'] = '';
            $comment_norm['alt'] = $comment['name'];
            $comment_norm['text'] = $comment['text'];
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


    /**
     * @param string $aInitialImageFilePath - строка, представляющая путь к обрезаемому изображению
     * @param string $aNewImageFilePath - строка, представляющая путь куда нахо сохранить выходное обрезанное изображение
     * @param int $aNewImageWidth - ширина выходного обрезанного изображения
     * @param int $aNewImageHeight - высота выходного обрезанного изображения
     */
    function cropImage($aInitialImageFilePath, $aNewImageFilePath, $aNewImageWidth, $aNewImageHeight) {
        if (($aNewImageWidth < 0) || ($aNewImageHeight < 0)) {
            return false;
        }

        // Массив с поддерживаемыми типами изображений
        $lAllowedExtensions = array(1 => "gif", 2 => "jpeg", 3 => "png");

        // Получаем размеры и тип изображения в виде числа
        list($lInitialImageWidth, $lInitialImageHeight, $lImageExtensionId) = getimagesize($aInitialImageFilePath);

        if (!array_key_exists($lImageExtensionId, $lAllowedExtensions)) {
            return false;
        }
        $lImageExtension = $lAllowedExtensions[$lImageExtensionId];

        // Получаем название функции, соответствующую типу, для создания изображения
        $func = 'imagecreatefrom' . $lImageExtension;
        // Создаём дескриптор исходного изображения
        $lInitialImageDescriptor = $func($aInitialImageFilePath);

        // Определяем отображаемую область
        $lCroppedImageWidth = 0;
        $lCroppedImageHeight = 0;
        $lInitialImageCroppingX = 0;
        $lInitialImageCroppingY = 0;
        if ($aNewImageWidth / $aNewImageHeight > $lInitialImageWidth / $lInitialImageHeight) {
            $lCroppedImageWidth = floor($lInitialImageWidth);
            $lCroppedImageHeight = floor($lInitialImageWidth * $aNewImageHeight / $aNewImageWidth);
            $lInitialImageCroppingY = floor(($lInitialImageHeight - $lCroppedImageHeight) / 2);
        } else {
            $lCroppedImageWidth = floor($lInitialImageHeight * $aNewImageWidth / $aNewImageHeight);
            $lCroppedImageHeight = floor($lInitialImageHeight);
            $lInitialImageCroppingX = floor(($lInitialImageWidth - $lCroppedImageWidth) / 2);
        }

        // Создаём дескриптор для выходного изображения
        $lNewImageDescriptor = imagecreatetruecolor($aNewImageWidth, $aNewImageHeight);
        imagecopyresampled($lNewImageDescriptor, $lInitialImageDescriptor, 0, 0, $lInitialImageCroppingX, $lInitialImageCroppingY, $aNewImageWidth, $aNewImageHeight, $lCroppedImageWidth, $lCroppedImageHeight);
        $func = 'image' . $lImageExtension;

        // сохраняем полученное изображение в указанный файл
        return $func($lNewImageDescriptor, $aNewImageFilePath);
    }
}
