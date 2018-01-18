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
        $tile_banner_standard = array();
        $tile_banner_standard['path_image'] = $server . 'image/catalog/banners/home-standard.jpg';
        $tile_banner_standard['href'] = $this->url->link('product/category', 'path=67_67');
        $tile_banner_standard['title'] = 'Стандартные';
        $tile_banner_standard['alt'] = 'Стандартные';
        $data['tile_banner_standard'] = $tile_banner_standard;

        $tile_banner_radius = array();
        $tile_banner_radius['path_image'] = $server . 'image/catalog/banners/home-radius.jpg';
        $tile_banner_radius['href'] = $this->url->link('product/category', 'path=64_64');
        $tile_banner_radius['title'] = 'Радиусные';
        $tile_banner_radius['alt'] = 'Радиусные';
        $data['tile_banner_radius'] = $tile_banner_radius;

        $tile_banner_calculator = array();
        $tile_banner_calculator['path_image'] = $server . 'image/catalog/banners/home-calculator.jpg';
        $tile_banner_calculator['href'] = $this->url->link('calculator/calculator');
        $tile_banner_calculator['title'] = 'Шкафы-купе на заказ';
        $tile_banner_calculator['alt'] = 'Шкафы-купе на заказ';
        $data['tile_banner_calculator'] = $tile_banner_calculator;

        $tile_banner_built_in = array();
        $tile_banner_built_in['path_image'] = $server . 'image/catalog/banners/home-built-in.jpg';
        $tile_banner_built_in['href'] = $this->url->link('product/category', 'path=60_60');
        $tile_banner_built_in['title'] = 'Встроенные';
        $tile_banner_built_in['alt'] = 'Встроенные';
        $data['tile_banner_built_in'] = $tile_banner_built_in;

        $tile_banner_dressing_rooms = array();
        $tile_banner_dressing_rooms['path_image'] = $server . 'image/catalog/banners/home-dressing-rooms.jpg';
        $tile_banner_dressing_rooms['href'] = $this->url->link('product/category', 'path=68_68');
        $tile_banner_dressing_rooms['title'] = 'Гардеробные';
        $tile_banner_dressing_rooms['alt'] = 'Гардеробные';
        $data['tile_banner_dressing_rooms'] = $tile_banner_dressing_rooms;


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
