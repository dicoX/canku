<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

	public function index(){
	    $v = array();
	    $data['status'] = 200;
			$data['msg']    = 'success'; 
//		$page = max(intval($this->input->get_post('page',TRUE)),1);
//		$rows = max(intval($this->input->get_post('rows',TRUE)),100);
//		$sidx = str_enhtml($this->input->get_post('sidx',TRUE));
//		$sord = str_enhtml($this->input->get_post('sord',TRUE));
//		$transType = intval($this->input->get_post('transType',TRUE));
//		$hxState   = intval($this->input->get_post('hxState',TRUE));
//		$salesId   = intval($this->input->get_post('salesId',TRUE));
//		$matchCon  = str_enhtml($this->input->get_post('matchCon',TRUE));
//		$beginDate = str_enhtml($this->input->get_post('beginDate',TRUE));
//		$endDate   = str_enhtml($this->input->get_post('endDate',TRUE));
//		$order = $sidx ? $sidx.' '.$sord :' a.id desc';
//		$where = ' and a.billType="SALE"';
//		$where .= $transType>0  ? ' and a.transType='.$transType : ''; 
//		$where .= $salesId>0    ? ' and a.salesId='.$salesId : ''; 
//		$where .= $hxState>0    ? ' and a.hxStateCode='.$hxState : ''; 
//		$where .= $matchCon     ? ' and (b.name like "%'.$matchCon.'%" or description like "%'.$matchCon.'%" or billNo like "%'.$matchCon.'%")' : ''; 
//		$where .= $beginDate    ? ' and a.billDate>="'.$beginDate.'"' : ''; 
//		$where .= $endDate      ? ' and a.billDate<="'.$endDate.'"' : ''; 
//		$offset = $rows * ($page-1);
//		$data['data']['page']      = $page;
//		$data['data']['records']   = $this->data_model->get_invoice($where,3);               //总条数
//		$data['data']['total']     = ceil($data['data']['records']/$rows);                   //总分页数
//		$list = $this->data_model->get_invoice($where.' order by '.$order.' limit '.$offset.','.$rows.'');  
//		foreach ($list as $arr=>$row) {
//		    $v[$arr]['hxStateCode']  = intval($row['hxStateCode']);
//		    $v[$arr]['checkName']    = $row['checkName'];
//			$v[$arr]['checked']      = intval($row['checked']);
//			$v[$arr]['salesId']      = intval($row['salesId']);
//			$v[$arr]['salesName']    = $row['salesName'];
//			$v[$arr]['billDate']     = $row['billDate'];
//			$v[$arr]['billStatus']   = $row['billStatus'];
//			$v[$arr]['totalQty']     = (float)$row['totalQty'];
//			$v[$arr]['id']           = intval($row['id']);
//		    $v[$arr]['amount']       = (float)abs($row['amount']);
//			$v[$arr]['billStatusName']   = $row['billStatus']==0 ? '未出庫' : '全部出庫'; 
//			$v[$arr]['transType']    = intval($row['transType']); 
//			$v[$arr]['rpAmount']     = (float)abs($row['rpAmount']);
//			$v[$arr]['contactName']  = $row['contactName'];
//			$v[$arr]['description']  = $row['description'];
//			$v[$arr]['billNo']       = $row['billNo'];
//			$v[$arr]['totalAmount']  = (float)abs($row['totalAmount']);
//			$v[$arr]['userName']     = $row['userName'];
//			$v[$arr]['transTypeName']= $row['transTypeName'];
//		}
		$data['data']['rows']        = $v;
		die(json_encode($data));
	}