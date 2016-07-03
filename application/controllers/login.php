<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct(){
        parent::__construct();
    }
	
	public function index(){
	    $data = str_enhtml($this->input->post(NULL,TRUE));
		if (is_array($data)&&count($data)>0) {
			//$this->session->userdata('code') != $data['code'] && alert('验证码错误'); 
			strlen($data['username']) < 1 && alert('賬戶不能為空'); 
			strlen($data['userpwd']) < 1  && alert('密鑰不能為空'); 
			$user = $this->mysql_model->get_row(ADMIN,'(username="'.$data['username'].'") or (mobile="'.$data['username'].'") ');
			if (count($user)>0) {
			    $user['status']!=1 && alert('此賬戶已被鎖定。'); 
				if ($user['userpwd'] == md5($data['userpwd'])) {
					if ($user['roleid']>0) {
						$lever = strlen($user['lever'])>0 ? explode(',',$user['lever']) : array();
					} else {	
					    $lever = '';	
				    }
					$data['jxcsys']['uid']      = $user['uid'];
					$data['jxcsys']['name']     = $user['name'];
					$data['jxcsys']['lever']    = $lever;
					$data['jxcsys']['username'] = $user['username'];
					$data['jxcsys']['login']    = 'jxc'; 
					$this->session->set_userdata($data);
					$this->common_model->logs('系統登入成功，賬戶名：'.$data['username']);
			        redirect(site_url('home/index'));
			   }		
			}
			alert('賬戶或者密鑰錯誤！');
		} else {
		    $this->load->view('login',$data);
		}
	}
	
	public function out(){
	    $this->session->sess_destroy();
		redirect(site_url('login'));
	}
	
	public function code(){
	    $this->load->library('lib_code');
		$this->lib_code->image();
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */