<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Contact extends CI_Controller {

    public function __construct(){
      parent::__construct();
			$this->common_model->checkpurview();
			$this->load->library('lib_pinyin');
    }
	
    //客户、供应商列表
	public function index(){
    $v = array();
    $data['status'] = 200;
		$data['msg']    = 'success'; 
		$type   = intval($this->input->get('type',TRUE))==10 ? 10 : -10;
		$skey   = str_enhtml($this->input->get_post('skey',TRUE));
		$page   = max(intval($this->input->get_post('page',TRUE)),1);
		$categoryid   = intval($this->input->get_post('categoryId',TRUE));
		$rows   = max(intval($this->input->get_post('rows',TRUE)),100);
		$where  = ' and type='.$type;
    $where .= $skey ? ' and (number like "%'.$skey.'%" or name like "%'.$skey.'%" or contact like "%'.$skey.'%" or linkMans like "%'.$skey.'%")' : '';
		$where .= $categoryid>0 ? ' and cCategory = '.$categoryid.'' : '';
		$offset = $rows * ($page-1);
		$data['data']['page']      = $page;                                                      
		$data['data']['records']   = $this->mysql_model->get_count(CONTACT,'(isDelete=0) '.$where.'');  
		$data['data']['total']     = ceil($data['data']['records']/$rows);                       
		$list = $this->mysql_model->get_results(CONTACT,'(isDelete=0) '.$where.' order by id desc limit '.$offset.','.$rows.'');   
		foreach ($list as $arr=>$row) {
		  $v[$arr]['id']           = intval($row['id']);
			$v[$arr]['RID']          = intval($row['id']);
			$v[$arr]['number']       = $row['number'];
			$v[$arr]['cCategory']    = intval($row['cCategory']);
			$v[$arr]['customerType'] = $row['cCategoryName'];
			$v[$arr]['pinYin']       = $row['pinYin'];
			$v[$arr]['name']         = $row['name'];
			$v[$arr]['type']         = $row['type'];
			$v[$arr]['delete']       = intval($row['disable'])==1 ? true : false;  
			$v[$arr]['cLevel']       = intval($row['cLevel']);
			$v[$arr]['amount']       = (float)$row['amount'];
			$v[$arr]['periodMoney']  = (float)$row['periodMoney'];
			$v[$arr]['difMoney']     = (float)$row['difMoney'];
			$v[$arr]['remark']       = $row['remark'];
			$v[$arr]['taxRate']      = (float)$row['taxRate'];
			$v[$arr]['links']        = '';
			if (strlen($row['linkMans'])>0) {                            
				$list = (array)json_decode($row['linkMans'],true);
				foreach ($list as $arr1=>$row1) {
					if ($row1['linkFirst']==1) {
						$v[$arr]['contacter']        = isset($row1['linkName']) ? $row1['linkName'] : ''; 
						$v[$arr]['mobile']           = isset($row1['linkMobile']) ? $row1['linkMobile'] : ''; 
						$v[$arr]['telephone']        = isset($row1['linkPhone']) ? $row1['linkPhone'] : ''; 
						$v[$arr]['linkIm']           = isset($row1['linkIm']) ? $row1['linkIm'] : ''; 
						$v[$arr]['firstLink']['first']   = isset($row1['linkFirst']) ? $row1['linkFirst'] : ''; 
						$v[$arr]['deliveryAddress']  = isset($row1['address']) ? $row1['address'] : '';
					}
				} 
		    }
		}
		$data['data']['rows']       = array_values($v);
		die(json_encode($data));
	}
	
	//校验客户编号 
	public function getNextNo(){
	     $type = intval($this->input->get('type',TRUE));
		 $skey = intval($this->input->post('skey',TRUE));
		 str_alert(200,'success',array('number'=>$skey)); 
	}
	
	
	//检测客户名称
	public function checkName(){
	    $id   = intval($this->input->post('id',TRUE));
		$name = str_enhtml($this->input->post('name',TRUE));
		$where = $id>0 ? 'and (id<>'.$id.')' :'';
	    $data = $this->mysql_model->get_row(CONTACT,'(name="'.$name.'") '.$where.' and isDelete=0'); 
		if (count($data)>0) {
		    str_alert(-1,'客戶名稱已經存在！'); 
		}
		str_alert(200,'success'); 
	}
	
 
	//获取信息
	public function query() {    
	    $id = intval($this->input->get_post('id',TRUE));
		$data = $this->mysql_model->get_row(CONTACT,'(id='.$id.') and isDelete=0');
		if (count($data)>0) {
		  $v = array();
			$info['id']           = $id;
			$info['number']       = $data['number'];
			$info['name']         = $data['name'];
			$info['beginDate']    = $data['beginDate'];
			$info['remark']       = $data['remark'];
			$info['cCategory']    = intval($data['cCategory']);
			$info['cLevel']       = intval($data['cLevel']);
			$info['amount']       = (float)$data['amount'];
			$info['periodMoney']  = (float)$data['periodMoney'];
			$info['taxRate']      = (float)$data['taxRate'];
			$info['difMoney']     = (float)$data['difMoney'];
			if (strlen($data['linkMans'])>0) {                            
				$list = (array)json_decode($data['linkMans'],true);
				foreach ($list as $arr=>$row) {
					$v[$arr]['contactId']       = $id;
					$v[$arr]['address']         = isset($row['address']) ? $row['address'] : '';
					$v[$arr]['first']           = isset($row['linkFirst']) && $row['linkFirst']==1 ? true : ''; 
					$v[$arr]['city']            = isset($row['city']) ? $row['city'] : '';
					$v[$arr]['county']          = isset($row['county']) ? $row['county'] : '';
					$v[$arr]['email']           = isset($row['email']) ? $row['email'] : '';
					$v[$arr]['im']              = isset($row['linkIm']) ? $row['linkIm'] : '';
					$v[$arr]['name']            = isset($row['linkName']) ? $row['linkName'] : '';
					$v[$arr]['province']        = isset($row['province']) ? $row['province'] : '';
					$v[$arr]['mobile']          = isset($row['linkMobile']) ? $row['linkMobile'] : ''; 
					$v[$arr]['phone']           = isset($row['linkPhone']) ? $row['linkPhone'] : '';
				} 
		    }
			$info['links']  = $v;
		    str_alert(200,'success',$info);
		}  
		str_alert(-1,'沒有數據');
	}
	
	//新增
	public function add(){
		$data = $this->input->post(NULL,TRUE);
		$data = $this->validform($data);
		switch ($data['type']) {
			case 10:
				$this->common_model->checkpurview(59);
				$success = '新增客戶：';	
				break;  
			case -10:
				$this->common_model->checkpurview(64);
				$success = '新增供應商：';	
				break;  			 
			default: 
				str_alert(-1,'參數錯誤');
		}	
		$data = elements(array(
					'name','number','amount','beginDate','cCategory',
					'cCategoryName','cLevel','cLevelName','linkMans'
					,'periodMoney','remark','type','taxRate')
					,$data);
		$sql = $this->mysql_model->insert(CONTACT,$data);
		if ($sql) {
			$data['id'] = $sql;
			$data['cCategory'] = intval($data['cCategory']);
			$data['linkMans']  = (array)json_decode($data['linkMans'],true);
			$this->common_model->logs($success.$data['name']);
			str_alert(200,'success',$data);
		}
		str_alert(-1,'添加失敗');
	}
	
	
	//修改
	public function update(){
		$data = $this->input->post(NULL,TRUE);
		$data = $this->validform($data);
		switch ($data['type']) {
			case 10:
				$this->common_model->checkpurview(60);
				$success = '編輯客戶：';	
				break;  
			case -10:
				$this->common_model->checkpurview(65);
				$success = '編輯供應商：';	
				break;  			 
			default: 
				str_alert(-1,'參數錯誤');
		}	
		$data = $this->validform($data);
		$info = elements(array(
					'name','number','amount','beginDate','cCategory',
					'cCategoryName','cLevel','cLevelName','linkMans'
					,'periodMoney','remark','type','taxRate')
					,$data);
		$sql = $this->mysql_model->update(CONTACT,$info,'(id='.$data['id'].')');
		if ($sql) {
			$data['cCategory']    = intval($data['cCategory']);
			$data['customerType'] = $data['cCategoryName'];
			$data['linkMans']     = (array)json_decode($data['linkMans'],true);
			$this->common_model->logs($success.$data['name']);
			str_alert(200,'success',$data);
		}
		str_alert(-1,'更新失敗');
	}
	
	//删除
	public function delete(){
	    $id   = str_enhtml($this->input->post('id',TRUE));
		$type = intval($this->input->get_post('type',TRUE))==10 ? 10 : -10;
		switch ($type) {
			case 10:
				$this->common_model->checkpurview(61);
				$success = '刪除客戶：';	
				break;  
			case -10:
				$this->common_model->checkpurview(66);
				$success = '刪除供應商：';	
				break;  			 
			default: 
				str_alert(-1,'參數錯誤');
		}	
		$data = $this->mysql_model->get_results(CONTACT,'(id in('.$id.'))'); 
		if (count($data) > 0) {
		    $info['isDelete'] = 1;
		    $this->mysql_model->get_count(INVOICE,'(buId in('.$id.'))')>0 && str_alert(-1,'不能刪除已經產生業務往來的客戶或者供應商資料！');
		    $sql = $this->mysql_model->update(CONTACT,$info,'(id in('.$id.'))');   
		    if ($sql) {
			    $name = array_column($data,'name'); 
				$this->common_model->logs($success.'ID='.$id.' 名稱:'.join(',',$name));
				die('{"status":200,"msg":"success","data":{"msg":"","id":['.$id.']}}');
			}
		}
		str_alert(-1,'客戶或者供應商不存在');
	}
	
	
	//状态
	public function disable(){
		$this->common_model->checkpurview();
		$disable = intval($this->input->post('disable',TRUE));
		$id = str_enhtml($this->input->post('contactIds',TRUE));
		if (strlen($id) > 0) { 
			$info['disable'] = $disable; 
			$sql = $this->mysql_model->update(CONTACT,$info,'(id in('.$id.'))');
		    if ($sql) {
				$this->common_model->logs('客戶'.$disable==1?'停用':'啓用'.':ID:'.$id.'');
				str_alert(200,'success');
			}
		}
		str_alert(-1,'操作失敗');
	}
	
	//公共验证
	private function validform($data) {
	    !isset($data['name']) || strlen($data['name']) < 1 && str_alert(-1,'名稱不能留空');
		!isset($data['number']) || strlen($data['number']) < 1 && str_alert(-1,'編號不能留空');
		!isset($data['cCategory']) || strlen($data['cCategory']) < 1 && str_alert(-1,'分類名稱不能留空');
		$data['cLevel']        = isset($data['cLevel']) ? (float)$data['cLevel'] :0;
		$data['taxRate']       = isset($data['taxRate']) ? (float)$data['taxRate'] :0;
		$data['amount']        = (float)$data['amount'];
		$data['periodMoney']   = (float)$data['periodMoney'];
		$data['type']          = intval($this->input->get_post('type',TRUE))==10 ? 10 : -10;
		$data['pinYin']        = $this->lib_pinyin->str2pinyin($data['name']);
		$data['contact']       = $data['number'].' '.$data['name'];
		$data['difMoney']      = (float)$data['amount'] - (float)$data['periodMoney'];
		$data['cCategoryName'] = $this->mysql_model->get_row(CATEGORY,'(id="'.$data['cCategory'].'")','name');
		if (isset($data['id'])) {
		    $data['id'] = intval($data['id']); 
			$this->mysql_model->get_count(CONTACT,'(id<>'.$data['id'].') and (type='.$data['type'].') and isDelete = 0 and (number="'.$data['number'].'")') > 0 && str_alert(-1,'編號重複');
		} else {
		    $this->mysql_model->get_count(CONTACT,'(type='.$data['type'].') and isDelete = 0 and (number="'.$data['number'].'")') > 0 && str_alert(-1,'編號重複');
		}
		return $data;
	}  
	
	 
   
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */