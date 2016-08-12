<?php
class ControllerPaymentBankPayment extends Controller
{
    protected function index()
    {
        $this->language->load('payment/bank_payment');

        $this->data['text_account_details'] = $this->language->get('text_account_details');
        $this->data['text_account_name'] = $this->language->get('text_account_name');
        $this->data['text_account_number'] = $this->language->get('text_account_number');
        $this->data['text_account_bank_name'] = $this->language->get('text_account_bank_name');
        $this->data['text_account_correspondent'] = $this->language->get('text_account_correspondent');
        $this->data['text_account_taxpayer_id_number'] = $this->language->get('text_account_taxpayer_id_number');
        $this->data['text_account_swift'] = $this->language->get('text_account_swift');
        $this->data['text_instruction'] = $this->language->get('text_instruction');
        $this->data['text_description'] = $this->language->get('text_description');
        $this->data['text_payment'] = $this->language->get('text_payment');

        $this->data['button_confirm'] = $this->language->get('button_confirm');

        $this->data['bank'] = nl2br($this->config->get('bank_payment_bank_' . $this->
            config->get('config_language_id')));

        $this->data['bank_payments'] = $this->config->get('bank_payment');

        $this->data['continue'] = $this->url->link('checkout/success');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') .
            '/template/payment/bank_payment.tpl')) {
            $this->template = $this->config->get('config_template') .
                '/template/payment/bank_payment.tpl';
        } else {
            $this->template = 'default/template/payment/bank_payment.tpl';
        }

        $this->render();
    }

    public function confirm()
    {
        $this->language->load('payment/bank_payment');

        $this->load->model('checkout/order');

        $accounts = $this->config->get('bank_payment');

        foreach ($accounts as $account) {

            $comment .= $account['account_details'] . " | " . $account['account_name'] .
                " | " . $account['account_number'] . " | " . $account['account_bank_name'] .
                " | " . $account['account_correspondent'] . " | " . $account['account_taxpayer_id_number'] .
                " | " . $account['account_swift'] . "\n\n";
            ;
        }
        $comment = $this->language->get('text_instruction') . "\n\n";
        $comment .= $this->config->get('bank_payment_bank_' . $this->config->get('config_language_id')) .
            "\n\n";
        $comment .= $this->language->get('text_payment');

        $this->model_checkout_order->confirm($this->session->data['order_id'], $this->
            config->get('bank_payment_order_status_id'), $comment, true);
    }
}
?>