<?php
class ControllerProductItem extends Controller {


    public function htmlProductItem($values)
    {
        $data = array();
        $this->validates('product_reference', $data, $values);
        $this->validates('image', $data, $values);
        $this->validates('name', $data, $values);
        $this->validates('special', $data, $values);
        $this->validates('button_text', $data, $values);

        if(isset($values['price'])) {
            $data['price'] = 'от ' . $this->formatMany($values['price'], $this->session->data['currency']);
        }

        return $this->load->view('product/product_item', $data);
    }

    private function validates($name, &$data, $values)
    {
        $data[$name] = $this->validate($values[$name]);
    }
    private function validate($value) {
        if(isset($value)) {
            return $value;
        } else {
            return "";
        }
    }

    private function formatMany($number, $currency)
    {
        $value = '';
        $format = true;
        $decimal_place = $this->currencies[$currency]['decimal_place'];

        if (!$value) {
            $value = $this->currencies[$currency]['value'];
        }

        $amount = $value ? (float)$number * $value : (float)$number;

        $amount = round($amount, (int)$decimal_place);

        if (!$format) {
            return $amount;
        }

        $string = '';
        $string .= number_format($amount, null, $this->language->get('decimal_point'), ' ');

        $symbol_right =  " &#8381;";
        $string .= $symbol_right;

        return $string;
    }
}