<?php foreach($data as $key => $field) { ?>
	<?php if($key == 'two_modal') { ?>
		<?php continue; ?>
	<?php } ?>
	<?php if($key == 'telephone') { ?>
		<?php continue; ?>
	<?php } ?>
	<input type="hidden" name="<?php echo $key ?>" data-modal="2" value="<?php echo $field ?>" />
<?php } ?>
<input type="hidden" name="two_modal" data-modal="2" value="0" />
<div class="text" style="text-align: center; height: 162px;   padding-top: 62px;"><span class="font-size-24 font-type-verdana">Напишите свой номер телефона, и мы свяжемся с вами</span></div>
<div class="field">
	<input type="text" style="height: 44px; font-size: 17px; width: 357px;" name="telephone" placeholder="Введите свой номер телефона..." data-modal="2" class="input-fild-telephone form-control">
	<span style="font-size: 10px; display: block;">примерное время ожидания 2 минуты</span>
	<span class="error" style="" hidden="hidden">Пожалуйста, введите телефон</span>
</div>
<div class="button"><input type="button" style="width: 165px; height: 45px;" id="telephone_button" data-modal="2"   class="button-style-4" value="Отправить"/></div>
<div id="close"></div>


<script type="text/javascript">



	$(document).ready(function () {
		$('#telephone_button').click(function () {
			var text = $(".modal_window_box [name='telephone']").val();
			if (text == '') {
				$('.modal_window_box .error').show();
				return false;
			} else {
				//alert('модальное окно не нужно');
				$('.modal_window_box .error').hide();

				ajaxClientCall(2,2,0);
			}
		});

	});
</script>