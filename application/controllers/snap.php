<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Snap extends CI_Controller
{

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */


	public function __construct()
	{
		parent::__construct();
		$params = array('server_key' => 'SB-Mid-server-WAmDqh1KDbdt3P63c7HkqHjX', 'production' => false);
		$this->load->library('midtrans');
		$this->midtrans->config($params);
		$this->load->helper('url');
	}

	public function index()
	{
		$this->load->view('checkout_snap');
	}

	public function token()
	{
		$grossamount = $this->input->get('grossamount');
		$order = $this->model_invoice->get_id_invoice($this->input->get('order'));

		// Required
		$transaction_details = array(
			'order_id' => $order->order_id,
			'gross_amount' => $grossamount, // no decimal allowed for creditcard
		);

		$shipping_address = array(
			'first_name'    => $order->name,
			'address'       => $order->alamat,
			'city'          => $order->city,
			'postal_code'   => $order->kode_pos,
			'phone'         => $order->mobile_phone,
			'country_code'  => 'IDN'
		);

		// Optional
		$customer_details = array(
			'first_name'    	=> $order->name,
			'email'         	=> $order->email,
			'phone'         	=> $order->mobile_phone,
			'shipping_address'	=> $shipping_address
		);

		// Data yang akan dikirim untuk request redirect_url.
		$credit_card['secure'] = true;
		//ser save_card true to enable oneclick or 2click
		//$credit_card['save_card'] = true;

		$time = time();
		$custom_expiry = array(
			'start_time' => date("Y-m-d H:i:s O", $time),
			'unit' => 'minute',
			'duration'  => 2
		);

		$transaction_data = array(
			'transaction_details' => $transaction_details,
			'customer_details'   => $customer_details,
			'credit_card'        => $credit_card,
			'expiry'             => $custom_expiry
		);

		error_log(json_encode($transaction_data));
		$snapToken = $this->midtrans->getSnapToken($transaction_data);
		error_log($snapToken);
		echo $snapToken;
	}

	public function finish()
	{
		$result = json_decode($this->input->post('result_data'));
		echo 'RESULT <br><pre>';
		var_dump($result);
		echo '</pre>';
	}
}
