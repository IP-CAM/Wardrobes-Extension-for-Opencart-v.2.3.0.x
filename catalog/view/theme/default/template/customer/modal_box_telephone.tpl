<?php foreach($data as $key => $field) { ?>
	<?php if($key == 'two_modal') { ?>
		<?php continue; ?>
	<?php } ?>
	<?php if($key == 'telephone') { ?>
		<?php continue; ?>
	<?php } ?>
	<input type="hidden" name="<?php echo $key ?>" data-modal="99" value="<?php echo $field ?>" />
<?php } ?>
<input type="hidden" name="two_modal" data-modal="99" value="0" />
<div class="modal-window-body">
		<p class="top-text font-type-verdana text-center">Напишите свой номер телефона, и мы свяжемся с вами</p>
		<div class="field">
			<input type="text" name="telephone" placeholder="Введите свой номер телефона..." data-modal="99" class="input-fild-telephone form-control">
			<span class="note">примерное время ожидания 2 минуты</span>
			<div class="error-box">
				<span class="error" hidden="hidden">Пожалуйста, введите телефон</span>
			</div>
		</div>
	<div class="button">
		<input type="button" style="" id="telephone_button" data-modal="99"   class="button-style-4" value="Отправить"/>
	</div>
	<div id="close"></div>
</div>


<script type="text/javascript">


var height_box = 0;
	$(document).ready(function () {
		var window_modal_height = 0;
		if($(window).width() < 480) {
			 window_modal_height = 225;
		} else {
			if($(window).width() <1200) {
				window_modal_height = 220;
			}
		}


		$('#telephone_button').click(function () {
			var text = $(".modal_window_box [name='telephone']").val();
			if (text == '') {
				$('.modal_window_box .error').show();
				if(window_modal_height != 0) {
					$('.popup').css('height', (window_modal_height + 15) +'px');
				}
				return false;
			} else {
				//alert('модальное окно не нужно');
				if(window_modal_height != 0) {
					$('.popup').css('height', window_modal_height);
				}
				$('.modal_window_box .error').hide();
				ajaxClientCall(99,2,0);
			}
		});

	});
</script>