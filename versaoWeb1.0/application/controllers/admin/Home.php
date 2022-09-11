<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct(){
        parent::__construct();
		if(!$this->session->userdata('logado')){
			redirect(base_url('admin/login'));
		}
    }
    
	public function index()
	{
		// Dados a serem enviado para o Cabeçalho
		$dados['titulo'] = 'Painel de controle';
		$dados['subtitulo'] = 'Home';
		


		$this->load->view('backend/template/html-header', $dados);
		$this->load->view('backend/template/template');
		$this->load->view('backend/home');

		$this->load->view('backend/template/html-footer');
	}
  
}
