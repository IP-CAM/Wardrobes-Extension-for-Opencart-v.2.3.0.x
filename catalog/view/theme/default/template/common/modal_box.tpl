<?php if($type == 0 || $type == 1) { ?>
<div class="text"><span>Введите свой номер телефона, и Наш оператор свяжется с вами, для уточнения данных заказа</span></div>
<input type="text" name="input_width" id="input_width" value="" class="form-control">
<input type="button" id="telephone_button"  class="btn btn-lg btn_calculator" value="Заказать"/>
<?php } else { ?>
<div class="text"><span>Спасибо за заявку, наши операторы свяжутся с вами, для уточнения заказа в течение нескольких минут</span></div>
<?php } ?>