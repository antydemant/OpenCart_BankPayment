<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      
      <table id="module" class="list">
      <p><?php echo $entry_account_details; ?></p>
          <thead>
            <tr>
             <td class="left"><?php echo $entry_account_name; ?></td>
              <td class="left"><?php echo $entry_account_number; ?></td>
              <td class="left"><?php echo $entry_account_bank_name; ?></td>
              <td class="left"><?php echo $entry_account_correspondent; ?></td>
              <td class="left"><?php echo $entry_account_taxpayer_id_number; ?></td>
              <td class="left"><?php echo $entry_account_swift; ?></td>
            </tr>
          </thead>
          <?php $bank_payment_row = 0; ?>
          <?php foreach ($bank_payments as $bank_payment) { ?>
          <tbody id="bank-payment-row<?php echo $bank_payment_row; ?>">
          <tr>
            <td class="left"><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_name]" value="<?php echo $bank_payment['account_name']; ?>" size="20" /></td>
            <td class="left"><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_number]" value="<?php echo $bank_payment['account_number']; ?>" size="20" /></td>
            <td class="left"><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_bank_name]" value="<?php echo $bank_payment['account_bank_name']; ?>" size="20" /></td>
            <td class="left"><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_correspondent]" value="<?php echo $bank_payment['account_correspondent']; ?>" size="20" /></td>
            <td class="left"><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_taxpayer_id_number]" value="<?php echo $bank_payment['account_taxpayer_id_number']; ?>" size="20" /></td>
            <td class="left"><input type="text" name="bank_payment[<?php echo $bank_payment_row; ?>][account_swift]" value="<?php echo $bank_payment['account_swift']; ?>" size="20" /></td>
            <td class="left"><a onclick="$('#bank-payment-row<?php echo $bank_payment_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            <td></td>
          </tr>
          </tbody>
          <?php $bank_payment_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="left"><a onclick="addAccount();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
        
        <table class="form">
          <?php foreach ($languages as $language) { ?>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_bank; ?></td>
            <td><textarea name="bank_payment_bank_<?php echo $language['language_id']; ?>" cols="80" rows="10"><?php echo isset(${'bank_payment_bank_' . $language['language_id']}) ? ${'bank_payment_bank_' . $language['language_id']} : ''; ?></textarea>
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
              <?php if (isset(${'error_bank_' . $language['language_id']})) { ?>
              <span class="error"><?php echo ${'error_bank_' . $language['language_id']}; ?></span>
              <?php } ?></td>
          </tr>
          <?php } ?>
          <tr>
            <td><?php echo $entry_total; ?></td>
            <td><input type="text" name="bank_payment_total" value="<?php echo $bank_payment_total; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_order_status; ?></td>
            <td><select name="bank_payment_order_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $bank_payment_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_geo_zone; ?></td>
            <td><select name="bank_payment_geo_zone_id">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $bank_payment_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="bank_payment_status">
                <?php if ($bank_payment_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="bank_payment_sort_order" value="<?php echo $bank_payment_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var bank_payment_row = <?php echo $bank_payment_row; ?>;

function addAccount() {	
	html  = '<tbody id="bank-payment-row' + bank_payment_row + '">';
	html += '  <tr>';
    html += '    <td class="left"><input type="text" name="bank_payment[' + bank_payment_row + '][account_name]" value="" size="20" /></td>';
    html += '    <td class="left"><input type="text" name="bank_payment[' + bank_payment_row + '][account_number]" value="" size="20" /></td>';
    html += '    <td class="left"><input type="text" name="bank_payment[' + bank_payment_row + '][account_bank_name]" value="" size="20" /></td>';
    html += '    <td class="left"><input type="text" name="bank_payment[' + bank_payment_row + '][account_correspondent]" value="" size="20" /></td>';
    html += '    <td class="left"><input type="text" name="bank_payment[' + bank_payment_row + '][account_taxpayer_id_number]" value="" size="20" /></td>';
    html += '    <td class="left"><input type="text" name="bank_payment[' + bank_payment_row + '][account_swift]" value="" size="20" /></td>';
	html += '    <td class="left"><a onclick="$(\'#bank-payment-row' + bank_payment_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	bank_payment_row++;
}
</script> 
<?php echo $footer; ?>