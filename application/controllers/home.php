<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct(){
        parent::__construct();
		$this->common_model->checkpurview();
		$this->jxcsys = $this->session->userdata('jxcsys');
    }
	
	public function index(){
	    $data['uid']      = $this->jxcsys['uid'];
		$data['name']     = $this->jxcsys['name'];
		$data['lever']    = $this->jxcsys['lever'];
		$data['username'] = $this->jxcsys['username']; 
        $data['system']   = $this->common_model->get_option('system'); 
		$this->load->view('index',$data);
	}
	
	//右边内容
	public function main(){
		$this->load->view('main');
	}
	
	//修改个人信息
	public function set_password(){
		$data = str_enhtml($this->input->post(NULL,TRUE));
		if (is_array($data)&&count($data)>0) {
			$info['userpwd'] = md5($data['newPassword']);
			$info['mobile']  = $data['buyerMobile'];
			$info['name']    = $data['buyerName'];
			$this->mysql_model->get_count(ADMIN,'(uid<>'.$this->jxcsys['uid'].') and mobile='.$info['mobile'].'') >0 && str_alert(-1,'系統中已存在相同的手提電話號碼'); 
		    $sql = $this->mysql_model->update(ADMIN,$info,'(uid='.$this->jxcsys['uid'].')');
			if ($sql) {
				$this->common_model->logs('密鑰修改完成 UID：'.$this->jxcsys['uid'].' 實名已變更為：'.$info['name']);
				str_alert(200,'密鑰修改完成');
			}
			str_alert(-1,'設置單獨密鑰失敗，請稍後再試！');
		} else {
		    $data = $this->mysql_model->get_row(ADMIN,'(uid='.$this->jxcsys['uid'].')');    
		    $this->load->view('set_password',$data);
		}
	}
	
	//清理缓存
	public function clear(){
		if ($this->mysql_model->clean()) {
		    die('1');
		} else {
		    die('0');
		}
	}
	
	public function Services(){
//		die('jQuery110202928952066617039_1430920204305({"status":200,"msg":"success","data":[{"msgid":"20000000122"
//,"msglinkcolor":"d9254a","msglink":"","msgtitle":"售后热线服务时间临时调整通知（5.6-5.8）>>"},{"msgid":"20000000119"
//,"msglinkcolor":"d9254a","msglink":"index.html","msgtitle"
//:"推荐送ipad mini，购买就返利>>"},{"msgid":"20000000115","msglinkcolor":"d9254a","msglink":"","msgtitle":">>"},{"msgid":"20000000068","msglinkcolor":"d9254a","msglink":"","msgtitle":">
//>"}]})');
//		 
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */