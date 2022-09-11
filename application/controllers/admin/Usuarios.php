<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Usuarios extends CI_Controller
{
	/* METODO CONSTRUTOR */
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		/* PROTEGER PAGINA */
		if (!$this->session->userdata('logado')) {
			redirect(base_url('admin/login'));
		}
		/* CHAMA MODEL USUARIOS */
		$this->load->library('table');
		$this->load->model('usuarios_model', 'modelusuarios');
		$dados['usuarios'] = $this->modelusuarios->listar_autores();

		// Dados a serem enviado para o Cabeçalho
		$dados['titulo'] = 'Painel de controle';
		$dados['subtitulo'] = 'Usuarios';

		/* CARREGA OS TEMPLATES HTML */
		$this->load->view('backend/template/html-header', $dados);
		$this->load->view('backend/template/template');
		$this->load->view('backend/usuarios');
		$this->load->view('backend/template/html-footer');
	}

	/* ADICIONA NOVA CATEGORIA  VALIDANDO OS DADOS DO FORMULARIO */
	public function inserir()
	{
		if (!$this->session->userdata('logado')) {
			redirect(base_url('admin/login'));
		}
		$this->load->model('usuarios_model', 'modelusuarios');
		/* VALIDACAO DO FORMULARIO */
		$this->load->library('form_validation');
		$this->form_validation->set_rules(
			'txt-nome',
			'Nome do Usuario',
			'required|min_length[3]'
		);
		$this->form_validation->set_rules(
			'txt-email',
			'Email',
			'required|valid_email'
		);
		$this->form_validation->set_rules(
			'txt-historico',
			'Historico',
			'required|min_length[20]'
		);
		$this->form_validation->set_rules(
			'txt-user',
			'User',
			'required|min_length[3]|is_unique[usuario.user]'
		);
		$this->form_validation->set_rules(
			'txt-senha',
			'Senha',
			'required|min_length[3]'
		);
		$this->form_validation->set_rules(
			'txt-confir-senha',
			'Confirmar Senha',
			'required|matches[txt-senha]'
		);
		if ($this->form_validation->run() == FALSE) {
			$this->index();
		} else {
			$nome = $this->input->post('txt-nome');
			$email = $this->input->post('txt-email');
			$historico = $this->input->post('txt-historico');
			$user = $this->input->post('txt-user');
			$senha = $this->input->post('txt-senha');
			if ($this->modelusuarios->adicionar($nome, $email, $historico, $user, $senha)) {
				redirect(base_url('admin/usuarios'));
			} else {
				echo 'Houve um erro no sistema que impede a adicão de nova categoria';
			}
		}
	}
	public function excluir($id)
	{
		if (!$this->session->userdata('logado')) {
			redirect(base_url('admin/login'));
		}
		$this->load->model('usuarios_model', 'modelusuarios');

		if ($this->modelusuarios->excluir($id)) {
			redirect(base_url('admin/usuarios'));
		} else {
			echo 'Houve um erro no sistema que impede a inclusão do usuário.';
		}
	}
	public function alterar($id)
	{
		if (!$this->session->userdata('logado')) {
			redirect(base_url('admin/login'));
		}
		$this->load->model('usuarios_model', 'modelusuarios');
		/* ENVIA DADOS LISTADOS DAS CATEGORIAS PARA A VIEW */
		$dados['usuarios'] = $this->modelusuarios->listar_usuario($id);
		// Dados a serem enviado para o Cabeçalho
		$dados['titulo'] = 'Painel de Controle';
		$dados['subtitulo'] = 'Usuarios';

		$this->load->view('backend/template/html-header', $dados);
		$this->load->view('backend/template/template');
		$this->load->view('backend/alterar-usuario');
		$this->load->view('backend/template/html-footer');
	}
	public function salvar_alteracoes($idCrip,$userCom){
	{
		if (!$this->session->userdata('logado')) {
			redirect(base_url('admin/login'));
		}
		$this->load->model('usuarios_model', 'modelusuarios');

		$this->load->library('form_validation');
		$this->form_validation->set_rules('txt-nome','Nome do Usuário', 'required|min_length[3]');
		$this->form_validation->set_rules('txt-email','Email', 'required|valid_email');
		$this->form_validation->set_rules('txt-historico','Histórico', 'required|min_length[20]');
		 
		// recuperamos o que esta no campo usuário
		$user= $this->input->post('txt-user');
		 
		// verificamos se ele é diferente do que veio inicialmente do banco e que foi passado
		// como parâmetro na URL.
		// Caso seja diferente ele irá verificar se é único e caso seja igual ele não fara nada
		 if($userCom != $user){
			 $this->form_validation->set_rules('txt-user','User', 'required|min_length[3]|is_unique[usuario.user]');
		 }
		 $senha= $this->input->post('txt-senha');
if($senha != ""){
 $this->form_validation->set_rules('txt-senha','Senha', 'required|min_length[3]');
 $this->form_validation->set_rules('txt-confir-senha','Confirmar Senha', 'required|matches[txt-senha]');
}
		if ($this->form_validation->run() == FALSE) {
			$this->alterar($idCrip);
		} else {
			$nome = $this->input->post('txt-nome');
			$email = $this->input->post('txt-email');
			$historico = $this->input->post('txt-historico');
			$user = $this->input->post('txt-user');
			$senha = $this->input->post('txt-senha');
			$id = $this->input->post('txt-id');
			if ($this->modelusuarios->alterar($nome, $email, $historico, $user, $senha, $id)) {
				redirect(base_url('admin/usuarios'));
			} else {
				echo 'Houve um erro no sistema que impede a adicão de nova categoria.';
			}
		}
	}
}
	public function nova_foto()
	{
		if (!$this->session->userdata('logado')) {
			redirect(base_url('admin/login'));
		}
		$this->load->model('usuarios_model', 'modelusuarios');
		$id = $this->input->post('id');
		$config['upload_path'] = './assets/frontend/img/usuarios';
		$config['allowed_types'] = 'jpg';
		$config['file_name'] = $id . ".jpg";
		$config['overwrite'] = TRUE;
		$this->load->library('upload', $config);

		if (!$this->upload->do_upload()) {
			echo $this->upload->display_errors();
		} else {
			$config2['source_image'] = './assets/frontend/img/usuarios/' . $id . '.jpg';
			$config2['create_thumb'] = FALSE;
			$config2['width'] = 200;
			$config2['height'] = 200;
			$this->load->library('image_lib', $config2);
			if ($this->image_lib->resize()) {
				if ($this->modelusuarios->alterar_img($id)) {
					redirect(base_url('admin/usuarios/alterar/' . $id));
				} else {
					echo 'Houve um erro no sistema!';
				}
			} else {
				echo $this->image_lib->display_errors();
			}
		}
	}

	public function pag_login()
	{
		// Dados a serem enviado para o Cabeçalho
		$dados['titulo'] = 'Painel de controle';
		$dados['subtitulo'] = 'Entrar no sistema';

		$this->load->view('backend/template/html-header', $dados);
		$this->load->view('backend/login');
		$this->load->view('backend/template/html-footer');
	}
	public function login()
	{
		/* validaçao de campos */

		$this->load->library('form_validation');
		$this->form_validation->set_rules(
			'txt-user',
			'Usuario',
			'required|min_length[3]'
		);
		$this->load->library('form_validation');
		$this->form_validation->set_rules(
			'txt-senha',
			'Senha',
			'required|min_length[3]'
		);
		if ($this->form_validation->run() == FALSE) {
			$this->pag_login();
		} else {
			/* compara usuario e senha com o banco de dados */

			$usuario = $this->input->post('txt-user');
			$senha = $this->input->post('txt-senha');
			$this->db->where('user', $usuario);     // Retirei o md5($usuario) *** Deu certo ****
			$this->db->where('senha', md5($senha));
			$userlogado = $this->db->get('usuario')->result();

			/* se usuario e senha incorretos no DB ele trata*/
			if (count($userlogado) == 1) {
				$dadosSessao['userlogado'] = $userlogado[0];
				$dadosSessao['logado'] = TRUE;

				/* envia os dados para a sessao */
				$this->session->set_userdata($dadosSessao);
				/* redireciona para pagina admin */
				redirect(base_url('admin'));
			} else {
				$dadosSessao['userlogado'] = NULL;
				$dadosSessao['logado'] = FALSE;

				/* envia os dados para a sessao */
				$this->session->set_userdata($dadosSessao);

				/* redireciona para pagina login */
				redirect(base_url('admin/login'));
			}
		}
	}
	public function logout()
	{
		$dadosSessao['userlogado'] = NULL;
		$dadosSessao['logado'] = FALSE;

		/* envia os dados para a sessao */
		$this->session->set_userdata($dadosSessao);

		/* redireciona para pagina login */
		redirect(base_url('admin/login'));
	}
}
