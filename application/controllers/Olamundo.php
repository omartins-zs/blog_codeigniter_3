<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Olamundo extends CI_Controller {

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
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
        $dados['mensagem']= 'Ola mundo!';
		$this->load->view('olamundo', $dados);
	}
    public function teste()
    {
        $dados['mensagem']= 'Testando!';
		$this->load->view('olamundo', $dados);
    }
    public function testedb()
    {
        $dados['mensagem']= $this->db->get('postagens')-> result();
		echo "<pre>";
        print_r($dados);
        
    }
}
