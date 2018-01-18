<?php
class ModelCustomerCustomer extends Model {

    public function addCustomer($data)
    {
        $sql = "INSERT  " . DB_PREFIX . "customer SET
            email = '" . $this->db->escape($data['email']) . "',
            name = '" . $this->db->escape($data['name']) . "',
            telephone = '" . $this->db->escape($data['telephone']) . "',
            ip = '" . $this->db->escape($data['ip']) . "',
            date_added = NOW()" . ",
            status =  1" ;
        $this->db->query($sql);
        $sql = "SELECT MAX(customer_id) AS max FROM " . DB_PREFIX . "customer";
        $query = $this->db->query($sql);
        $customer_id = $query->row['max'];
        $sql = "INSERT  " . DB_PREFIX . "customer_order SET
            customer_id = '" . (int)$customer_id . "',
            type = '" . (int)$data['type'] . "',
            product_id = '" . (int)$data['product_id'] . "',
            width = '" . (float)$data['width'] . "',
            height = '" . (float)$data['height'] . "',
            depth = '" . (float)$data['depth'] . "',
            price = '" . $this->db->escape($data['price']) . "'";
        $this->db->query($sql);




        $body_text ='';
        $body_text .= "Номер клиента: " . (int)$customer_id . ' ';
        $body_text .= "Телефон: " . $this->db->escape($data['telephone']) . ' ';
        $body_text .= "Страница захода: " . (int)$data['type'] . ' ';
        if($data['price'] != 0 && $data['price'] != '' ) {
            $body_text .= "Цена показанная клиету: " . (int)$data['price'] . ' ';
        }
        if($data['name'] != 0 && $data['name'] != '' ) {
            $body_text .= "Имя клиента: " . (int)$data['name'] . ' ';
        }
        if($data['product_id'] != 0 && $data['product_id'] != '' ) {
            $sql = "SELECT model FROM " . DB_PREFIX . "product WHERE product_id=" . (int)$data['product_id'];
            $query = $this->db->query($sql);
            $body_text .= "Продукт для клиента: " . $query->row['model'] . ' ';
        }


        $this->load->language('mail/forgotten');
        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($this->config->get('config_email'));
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode('Новый клиент', ENT_QUOTES, 'UTF-8'));
        $mail->setText(html_entity_decode($body_text), ENT_QUOTES, 'UTF-8');
        $mail->send();
    }
}
