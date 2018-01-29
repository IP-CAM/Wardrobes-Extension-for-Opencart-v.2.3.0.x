<?php
class Formatmany {



    public function format($number, $currency, $currencies, $decimal_point)
    {
        $value = '';
        $format = true;
        $decimal_place = $currencies[$currency]['decimal_place'];

        if (!$value) {
            $value = $currencies[$currency]['value'];
        }

        $amount = $value ? (float)$number * $value : (float)$number;

        $amount = round($amount, (int)$decimal_place);

        if (!$format) {
            return $amount;
        }

        $string = '';
        $string .= number_format($amount, null, $decimal_point, ' ');

        $symbol_right =  " &#8381;";
        //$string .= $symbol_right;

        return $string;
    }
}
