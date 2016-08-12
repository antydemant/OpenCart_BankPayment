<h2><?php echo $text_instruction; ?></h2>
<div class="content">
<table id="bank_payments" class="list">
      <p><?php echo $text_description; ?></p>
      <p><?php echo $text_account_details; ?></p>
          <thead>
            <tr>
             <td ><?php echo $text_account_name; ?></td>
              <td ><?php echo $text_account_number; ?></td>
              <td ><?php echo $text_account_bank_name; ?></td>
              <td ><?php echo $text_account_correspondent; ?></td>
              <td ><?php echo $text_account_taxpayer_id_number; ?></td>
              <td ><?php echo $text_account_swift; ?></td>
            </tr>
          </thead>
          <?php $bank_payment_row = 0; ?>
          <?php foreach ($bank_payments as $bank_payment) { ?>
          <tbody id="bank-payment-row<?php echo $bank_payment_row; ?>">
          <tr>
            <td ><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_name]" value="<?php echo $bank_payment['account_name']; ?>" size="20" readonly /></td>
            <td ><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_number]" value="<?php echo $bank_payment['account_number']; ?>" size="20" readonly /></td>
            <td ><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_bank_name]" value="<?php echo $bank_payment['account_bank_name']; ?>" size="20" readonly /></td>
            <td ><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_correspondent]" value="<?php echo $bank_payment['account_correspondent']; ?>" size="20" readonly /></td>
            <td ><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_taxpayer_id_number]" value="<?php echo $bank_payment['account_taxpayer_id_number']; ?>" size="20" readonly /></td>
            <td ><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_swift]" value="<?php echo $bank_payment['account_swift']; ?>" size="20" /></td>
          </tr>
          </tbody>
          <?php $bank_payment_row++; ?>
          <?php } ?>
        </table>
  
  <p><?php echo $bank; ?></p>
  <p><?php echo $text_payment; ?></p>
</div>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/bank_transfer/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script> 
