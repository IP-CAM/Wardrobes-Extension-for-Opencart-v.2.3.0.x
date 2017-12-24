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
<div class="text"><span>Введите свой номер телефона, и Наш оператор свяжется с вами, для уточнения данных заказа</span></div>
<div class="field"><input type="text" name="telephone" data-modal="2" class="form-control"></div>
<span class="error" hidden="hidden">Пожалуйста, введите телефон</span>
<div class="button"><input type="button" id="telephone_button" data-modal="2"   class="btn btn-lg btn_calculator" value="Отправить"/></div>



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
				ajaxClientCall();
			}
		});

	});
</script>