<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Inventory extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->common_model->checkpurview();
        $this->load->library('lib_pinyin');
    }

    //商品列表
    public function index()
    {
        $v = array();
        $data['status'] = 200;
        $data['msg'] = 'success';
        $page = max(intval($this->input->get_post('page', TRUE)), 1);
        $rows = max(intval($this->input->get_post('rows', TRUE)), 100);
        $skey = str_enhtml($this->input->get_post('skey', TRUE));
        $categoryid = intval($this->input->get_post('assistId', TRUE));
        $barCode = intval($this->input->get_post('barCode', TRUE));
        $contactid = intval($this->input->get_post('contactId', TRUE));
        $where = '';
        $where .= $skey ? ' and (name like "%' . $skey . '%" or number like "%' . $skey . '%" or spec like "%' . $skey . '%")' : '';
        $where .= $barCode ? ' and barCode="' . $barCode . '"' : '';
        if ($categoryid > 0) {
            $cid = array_column($this->mysql_model->get_results(CATEGORY, '(1=1) and find_in_set(' . $categoryid . ',path)'), 'id');
            if (count($cid) > 0) {
                $cid = join(',', $cid);
                $where .= ' and categoryid in(' . $cid . ')';
            }
        }

        $offset = $rows * ($page - 1);
        $data['data']['page'] = $page;                                                             //当前页
        $data['data']['records'] = $this->data_model->get_goods($where, 3);   //总条数
        $data['data']['total'] = ceil($data['data']['records'] / $rows);                              //总分页数
        $list = $this->data_model->get_goods($where . ' order by id desc limit ' . $offset . ',' . $rows . '');
        foreach ($list as $arr => $row) {
            $v[$arr]['amount'] = (float)$row['iniamount'];
            $v[$arr]['barCode'] = $row['barCode'];
            $v[$arr]['categoryName'] = $row['categoryName'];
            $v[$arr]['currentQty'] = $row['totalqty'];                            //当前库存
            $v[$arr]['delete'] = intval($row['disable']) == 1 ? true : false;   //是否禁用
            $v[$arr]['discountRate'] = 0;
            $v[$arr]['id'] = intval($row['id']);
            $v[$arr]['isSerNum'] = intval($row['isSerNum']);
            $v[$arr]['josl'] = $row['josl'];
            $v[$arr]['name'] = $row['name'];
            $v[$arr]['number'] = $row['number'];
            $v[$arr]['pinYin'] = $row['pinYin'];
            $v[$arr]['locationId'] = intval($row['locationId']);
            $v[$arr]['locationName'] = $row['locationName'];
            $v[$arr]['locationNo'] = '';
            $v[$arr]['purPrice'] = $row['purPrice'];
            $v[$arr]['quantity'] = $row['iniqty'];
            if (!empty($contactid)) {
                $sql = 'select `price` from ' . CUSTOMERPRICE . ' where contact_id=' . $contactid . ' and goods_id=' . $row['id'] . ' limit 0,1';
                $price = $this->mysql_model->db->query($sql);
                $price = $price->row_array();
                $price = isset($price['price']) ? $price['price'] : '';
            }
            $v[$arr]['salePrice'] = empty($price) ? $row['salePrice'] : $price;
            $v[$arr]['skuClassId'] = $row['skuClassId'];
            $v[$arr]['spec'] = $row['spec'];
            $v[$arr]['unitCost'] = $row['iniunitCost'];
            $v[$arr]['unitId'] = intval($row['baseUnitId']);
            $v[$arr]['unitName'] = $row['unitName'];
        }
        $data['data']['rows'] = $v;
        die(json_encode($data));

    }

    //商品选择
    public function listBySelected()
    {
        $v = array();
        $contactid = intval($this->input->post('contactId', TRUE));
        $id = intval($this->input->post('ids', TRUE));
        $data['status'] = 200;
        $data['msg'] = 'success';
        $list = $this->mysql_model->get_results(GOODS, '(isDelete=0) and (disable=0) and id=' . $id . '');
        print_r($list);
        foreach ($list as $arr => $row) {
            $v[$arr]['amount'] = (float)$row['amount'];
            $v[$arr]['barCode'] = $row['barCode'];
            $v[$arr]['categoryName'] = $row['categoryName'];
            $v[$arr]['currentQty'] = 0;                                           //当前库存
            $v[$arr]['delete'] = intval($row['disable']) == 1 ? true : false;   //是否禁用
            $v[$arr]['discountRate'] = 0;
            $v[$arr]['id'] = intval($row['id']);
            $v[$arr]['isSerNum'] = intval($row['isSerNum']);
            $v[$arr]['josl'] = '';
            $v[$arr]['name'] = $row['name'];
            $v[$arr]['number'] = $row['number'];
            $v[$arr]['pinYin'] = $row['pinYin'];
            $v[$arr]['locationId'] = intval($row['locationId']);
            $v[$arr]['locationName'] = $row['locationName'];
            $v[$arr]['locationNo'] = '';
            $v[$arr]['purPrice'] = $row['purPrice'];
            $v[$arr]['quantity'] = $row['quantity'];
            $v[$arr]['salePrice'] = $row['salePrice'];
            $v[$arr]['skuClassId'] = $row['skuClassId'];
            $v[$arr]['spec'] = $row['spec'];
            $v[$arr]['unitCost'] = $row['unitCost'];
            $v[$arr]['unitId'] = intval($row['baseUnitId']);
            $v[$arr]['unitName'] = $row['unitName'];
        }
        $data['data']['result'] = $v;
        die(json_encode($data));
    }


    //获取信息
    public function query()
    {
        $id = intval($this->input->post('id', TRUE));
        str_alert(200, 'success', $this->get_goods_info($id));
    }


    //检测编号
    public function getNextNo()
    {
        $skey = str_enhtml($this->input->post('skey', TRUE));
        $this->mysql_model->get_count(GOODS, '(number="' . $skey . '")') > 0 && str_alert(-1, '此商品編碼已存在于系統中！');
        str_alert(200, 'success');
    }

    //检测条码
    public function checkBarCode()
    {
        $barCode = str_enhtml($this->input->post('barCode', TRUE));
        $this->mysql_model->get_count(GOODS, '(barCode="' . $barCode . '")') > 0 && str_alert(-1, '此商品條碼已存在于系統中！');
        str_alert(200, 'success');
    }

    //检测规格
    public function checkSpec()
    {
        $spec = str_enhtml($this->input->post('spec', TRUE));
        $this->mysql_model->get_count(ASSISTSKU, '(skuName="' . $spec . '")') > 0 && str_alert(-1, '此商品規格已存在于系統中！');
        str_alert(200, 'success');
    }

    //检测名称
    public function checkname()
    {
        $skey = str_enhtml($this->input->post('barCode', TRUE));
        echo '{"status":200,"msg":"success","data":{"number":""}}';
    }

    //获取图片信息
    public function getImagesById()
    {
        $v = array();
        $id = intval($this->input->post('id', TRUE));
        $list = $this->mysql_model->get_results(GOODS_IMG, '(invId=' . $id . ') and isDelete=0');
        foreach ($list as $arr => $row) {
            $v[$arr]['pid'] = $row['id'];
            $v[$arr]['status'] = 1;
            $v[$arr]['name'] = $row['name'];
            $v[$arr]['url'] = site_url() . '/basedata/inventory/getImage?action=getImage&pid=' . $row['id'];
            $v[$arr]['thumbnailUrl'] = site_url() . '/basedata/inventory/getImage?action=getImage&pid=' . $row['id'];
            $v[$arr]['deleteUrl'] = '';
            $v[$arr]['deleteType'] = '';
        }
        $data['status'] = 200;
        $data['msg'] = 'success';
        $data['files'] = $v;
        die(json_encode($data));
    }

    //上传图片信息
    public function uploadImages()
    {
        require_once './application/libraries/UploadHandler.php';
        $config = array(
            'script_url' => base_url() . 'inventory/uploadimages',
            'upload_dir' => dirname($_SERVER['SCRIPT_FILENAME']) . '/data/upfile/goods/',
            'upload_url' => base_url() . 'data/upfile/goods/',
            'delete_type' => '',
            'print_response' => false
        );
        $uploadHandler = new UploadHandler($config);
        $list = (array)json_decode(json_encode($uploadHandler->response['files'][0]), true);
        $newid = $this->mysql_model->insert(GOODS_IMG, $list);
        $files[0]['pid'] = intval($newid);
        $files[0]['status'] = 1;
        $files[0]['size'] = (float)$list['size'];
        $files[0]['name'] = $list['name'];
        $files[0]['url'] = site_url() . '/basedata/inventory/getImage?action=getImage&pid=' . $newid;
        $files[0]['thumbnailUrl'] = site_url() . '/basedata/inventory/getImage?action=getImage&pid=' . $newid;
        $files[0]['deleteUrl'] = '';
        $files[0]['deleteType'] = '';
        $data['status'] = 200;
        $data['msg'] = 'success';
        $data['files'] = $files;
        die(json_encode($data));
    }

    //保存上传图片信息
    public function addImagesToInv()
    {
        $data = $this->input->post('postData');
        if (strlen($data) > 0) {
            $v = $s = array();
            $data = (array)json_decode($data, true);
            $id = isset($data['id']) ? $data['id'] : 0;
            !isset($data['files']) || count($data['files']) < 1 && str_alert(-1, '請先加入圖片檔案！');
            foreach ($data['files'] as $arr => $row) {
                if ($row['status'] == 1) {
                    $v[$arr]['id'] = $row['pid'];
                    $v[$arr]['invId'] = $id;
                } else {
                    $s[$arr]['id'] = $row['pid'];
                    $s[$arr]['invId'] = $id;
                    $s[$arr]['isDelete'] = 1;
                }
            }
            $this->mysql_model->update(GOODS_IMG, array_values($v), 'id');
            $this->mysql_model->update(GOODS_IMG, array_values($s), 'id');
            str_alert(200, 'success');
        }
        str_alert(-1, '保存失败');
    }

    //获取图片信息
    public function getImage()
    {
        $id = intval($this->input->get_post('pid', TRUE));
        $data = $this->mysql_model->get_row(GOODS_IMG, '(id=' . $id . ')');
        if (count($data) > 0) {
            $url = './data/upfile/goods/' . $data['name'];
            $info = getimagesize($url);
            $imgdata = fread(fopen($url, 'rb'), filesize($url));
            header('content-type:' . $info['mime'] . '');
            echo $imgdata;
        }
    }

    //新增
    public function add()
    {
        $this->common_model->checkpurview(69);
        $data = $this->input->post(NULL, TRUE);
        if ($data) {
            $v = '';
            $data = $this->validform($data);
            $this->mysql_model->get_count(GOODS, '(number="' . $data['number'] . '") and isDelete = 0 ') > 0 && str_alert(-1, '商品編碼重複商品编号重复');
            $this->db->trans_begin();
            $info = array(
                'barCode', 'baseUnitId', 'unitName', 'categoryId', 'categoryName',
                'discountRate1', 'discountRate2', 'highQty', 'locationId',
                'locationName', 'lowQty', 'name', 'number', 'purPrice',
                'remark', 'salePrice', 'spec', 'vipPrice', 'wholesalePrice'
            );
            $info = elements($info, $data, '');
			$info['unitId'] = $info['baseUnitId'];
            $invId = $this->mysql_model->insert(GOODS, $info);
			$data['id'] = $this->db->insert_id();
			
			$unitId = $data['baseUnitId'];
            if (strlen($data['propertys']) > 0) {
                $list = (array)json_decode($data['propertys'], true);
                foreach ($list as $arr => $row) {
                    $v[$arr]['invId'] = $invId;
					$v[$arr]['unitId'] = $unitId;
                    $v[$arr]['locationId'] = isset($row['locationId']) ? $row['locationId'] : 0;
                    $v[$arr]['qty'] = isset($row['quantity']) ? $row['quantity'] : 0;
                    $v[$arr]['price'] = isset($row['unitCost']) ? $row['unitCost'] : 0;
                    $v[$arr]['amount'] = isset($row['amount']) ? $row['amount'] : 0;
                    $v[$arr]['skuId'] = isset($row['skuId']) ? $row['skuId'] : 0;
                    $v[$arr]['billDate'] = date('Y-m-d', time());
                    $v[$arr]['billNo'] = '期初數量';
                    $v[$arr]['billType'] = 'INI';
                    $v[$arr]['transTypeName'] = '期初數量';
                }
                $this->mysql_model->insert(INVOICE_INFO, $v);
				
            }
            if (!empty($data['customerPrice'])) {
                $s = array();
                foreach ($data['customerPrice'] as $v) {
                    $m['contact_id'] = $v['id'];
                    $m['goods_id'] = $invId;
                    $m['price'] = empty($v['price']) ? 0 : $v['price'];
                    $s[] = $m;
                }
                $this->mysql_model->insert(CUSTOMERPRICE, $s);
            }
            if ($this->db->trans_status() === FALSE) {
                $this->db->trans_rollback();
                str_alert(-1, '系統錯誤');
            } else {
				$data['propertys'] = (array)json_decode($data['propertys'], true);
                $this->db->trans_commit();
                $this->common_model->logs('新增商品:' . $data['name']);
                str_alert(200, 'success', $data);
            }
        }
        str_alert(-1, '添加失败');
    }

    //修改
    public function update()
    {
        $this->common_model->checkpurview(70);
        $data = $this->input->post(NULL, TRUE);
        if ($data) {
            $id = intval($data['id']);
            $data = $this->validform($data);
            $this->mysql_model->get_count(GOODS, '(id<>' . $id . ') and (number="' . $data['number'] . '")') > 0 && str_alert(-1, '商品编号重复');

            $this->db->trans_begin();
            $info = array(
                'barCode', 'baseUnitId', 'unitName', 'categoryId', 'categoryName',
                'discountRate1', 'discountRate2', 'highQty', 'locationId',
                'locationName', 'lowQty', 'name', 'number', 'purPrice',
                'remark', 'salePrice', 'spec', 'vipPrice', 'wholesalePrice'
            );
            $info = elements($info, $data, NULL);
            $this->mysql_model->update(GOODS, $info, '(id=' . $id . ')');
            if (strlen($data['propertys']) > 0) {
                $v = '';
                $list = (array)json_decode($data['propertys'], true);
                foreach ($list as $arr => $row) {
                    $v[$arr]['invId'] = $id;
                    $v[$arr]['locationId'] = isset($row['locationId']) ? $row['locationId'] : 0;
                    $v[$arr]['qty'] = isset($row['quantity']) ? $row['quantity'] : 0;
                    $v[$arr]['price'] = isset($row['unitCost']) ? $row['unitCost'] : 0;
                    $v[$arr]['amount'] = isset($row['amount']) ? $row['amount'] : 0;
                    $v[$arr]['skuId'] = isset($row['skuId']) ? $row['skuId'] : 0;
					$v[$arr]['unitId'] = $info['baseUnitId'];
                    $v[$arr]['billDate'] = date('Y-m-d', time()); 
                    $v[$arr]['billNo'] = '期初数量';
                    $v[$arr]['billType'] = 'INI';
                    $v[$arr]['transTypeName'] = '期初数量';
                }
                // str_alert(-1, '系統錯誤', $v);
                $this->mysql_model->delete(INVOICE_INFO, '(invId="' . $id . '") and billType="INI"');
                $iid = $this->mysql_model->insert(INVOICE_INFO, $v);
                // str_alert(-1, '系統錯誤'.$iid, $iid);
            }
            if (!empty($data['customerPrice'])) {
                foreach ($data['customerPrice'] as $v) {
                    $m['price'] = empty($v['price']) ? 0 : $v['price'];
					
                    $unit = $this->mysql_model->get_row(CUSTOMERPRICE, '(goods_id=' . $id . ') and contact_id=' . $v['id']);
					// str_alert(200, 'success', isset($unit['id']));
                    if (isset($unit['id']) && (!empty($unit['price'] || 0 == $unit['price']))) {
                        //$this->mysql_model->update(CUSTOMERPRICE, $m, '(goods_id=' . $id . ') and contact_id=' . $v['id']);
						$this->mysql_model->update(CUSTOMERPRICE, array('price' => $v['price']), '(goods_id=' . $id . ') and contact_id=' . $unit['contact_id']);
                    } else {
                        $m['contact_id'] = $v['id'];
                        $m['goods_id'] = $id;
                        $m['price'] = empty($v['price']) ? 0 : $v['price'];
                        $this->mysql_model->insert(CUSTOMERPRICE, $m);
                    }
                }

            }
            if ($this->db->trans_status() === FALSE) {
                $this->db->trans_rollback();
                str_alert(-1, '系統錯誤');
            } else {
                $this->db->trans_commit();
                $this->common_model->logs('修改商品:ID=' . $id . '名称:' . $data['name']);
                str_alert(200, 'success', $this->get_goods_info($id));
            }
        }
        str_alert(-1, '修改失败');
    }

    //删除
    public function delete()
    {
        $this->common_model->checkpurview(71);
        $id = str_enhtml($this->input->post('id', TRUE));
        $data = $this->mysql_model->get_results(GOODS, '(id in(' . $id . ')) and (isDelete=0)');
        if (count($data) > 0) {
            $info['isDelete'] = 1;
            $this->mysql_model->get_count(INVOICE_INFO, '(invId in(' . $id . '))') > 0 && str_alert(-1, '其中有商品发生业务不可删除');
            $sql = $this->mysql_model->update(GOODS, $info, '(id in(' . $id . '))');
            if ($sql) {
                $name = array_column($data, 'name');
                $this->common_model->logs('删除商品:ID=' . $id . ' 名称:' . join(',', $name));
                str_alert(200, 'success', array('msg' => '删除商品成功', 'id' => array($id) ));
            }
            str_alert(-1, '删除失败');
        }
    }

    //导出
    public function exporter()
    {
        $this->common_model->checkpurview(72);
        $name = 'goods_' . date('YmdHis') . '.xls';
        sys_csv($name);
        $this->common_model->logs('导出商品:' . $name);
        $skey = str_enhtml($this->input->get_post('skey', TRUE));
        $categoryid = intval($this->input->get_post('assistId', TRUE));
        $barCode = intval($this->input->get_post('barCode', TRUE));
        $where .= $skey ? ' and (name like "%' . $skey . '%" or number like "%' . $skey . '%" or spec like "%' . $skey . '%")' : '';

        $where .= $barCode ? ' and barCode="' . $barCode . '"' : '';
        if ($categoryid > 0) {
            $cid = array_column($this->mysql_model->get_results(CATEGORY, '(1=1) and find_in_set(' . $categoryid . ',path)'), 'id');
            if (count($cid) > 0) {
                $cid = join(',', $cid);
                $where .= ' and categoryid in(' . $cid . ')';
            }
        }
        $data['ini'] = $this->data_model->get_invoice_info('and billType="INI"');
        $data['list'] = $this->data_model->get_goods($where . ' order by id desc');
        $this->load->view('settings/goods-export', $data);

    }

    //状态
    public function disable()
    {
        $this->common_model->checkpurview(72);
        $disable = intval($this->input->post('disable', TRUE));
        $id = str_enhtml($this->input->post('invIds', TRUE));
        if (strlen($id) > 0) {
            $info['disable'] = $disable;
            $sql = $this->mysql_model->update(GOODS, $info, '(id in(' . $id . '))');
            if ($sql) {
                $this->common_model->logs('商品' . $disable == 1 ? '禁用' : '启用' . ':ID:' . $id . '');
                str_alert(200, 'success');
            }
        }
        str_alert(-1, '操作失败');
    }

    //库存预警
    public function listinventoryqtywarning()
    {
        $v = array();
        $data['status'] = 200;
        $data['msg'] = 'success';
        $page = max(intval($this->input->get_post('page', TRUE)), 1);
        $rows = max(intval($this->input->get_post('rows', TRUE)), 100);
        $where = '';
        $data['data']['total'] = 1;
		$vs1 = array();
		$vs2 = array();
		$ins = $this->data_model->get_inventory($where . ' GROUP BY invId, to_unitId HAVING qty>highQty or qty<lowQty', 2);
		
		foreach($ins as $arr => $row){
			if(!isset($row['baseUnitId']) || null == $row['baseUnitId'] ){
				continue;
			}
			$q = 0;
			if(!isset($vs1[$row['invId']])){ //判断已有属性
				$vs1[$row['invId']] = $row;
			}else{
				$q = floatval($vs1[$row['invId']]['qty']);
			}
			$qty = floatval($row['qty']);
			$buId = $row['baseUnitId'];
			$uId = $row['to_unitId'];
			$discount = $this->mysql_model->get_row(UNITPRICE, '(unitId=' . $buId . ') and to_unitId=' . $uId, 'discount');
			$discount = floatval($discount);
			if($discount != 0){  // 已经设置单位换算
				$dis = $qty * (1 / $discount);
				$q += $dis;
			}else{ // 还没设置单位换算 直接相加
				$q += $qty;
			}
			$vs1[$row['invId']]['qty'] = $q;
		}
		foreach($vs1 as $key=>$row){
			array_push($vs2, $row);
		}
		
        $data['data']['records'] = count($vs2);
		
        // $list = $this->data_model->get_inventory($where . ' GROUP BY invId, to_unitId HAVING qty>highQty or qty<lowQty');
        foreach ($vs2 as $arr => $row) {
            $qty1 = (float)$row['qty'] - (float)$row['highQty'];
            $qty2 = (float)$row['qty'] - (float)$row['lowQty'];
            $v[$arr]['highQty'] = (float)$row['highQty'];
            $v[$arr]['id'] = intval($row['invId']);
            $v[$arr]['lowQty'] = (float)$row['lowQty'];
            $v[$arr]['name'] = $row['invName'];
            $v[$arr]['number'] = $row['invNumber'];
            $v[$arr]['warning'] = $qty1 > 0 ? $qty1 : $qty2;
            $v[$arr]['qty'] = (float)$row['qty'];
            $v[$arr]['unitName'] = $row['unitName'];
            $v[$arr]['spec'] = $row['invSpec'];
        }
        $data['data']['rows'] = $v;
        die(json_encode($data));
    }
	
	public function get_last_invoice_info(){
        $contactId = $this->input->get_post('contact_id', TRUE);
        
        $where = ' 1 ';
        if($contactId) $where .= " and buId = '{$contactId}' ";
		
		$sql = "SELECT * FROM ".INVOICE." WHERE {$where} order by billDate desc, modifyTime desc limit 1";
        $list = $this->mysql_model->query(INVOICE, $sql, 2);
        $row = count($list) ? $list[0] : false;
        $list = array();
        if($row){
            $where = "a.billNo = '{$row['billNo']}'";
            
            $sql = "SELECT a.*, ABS(a.unitId) as unitId, b.name as mainUnit, 
                        c.id as locationId, c.name as locationName, 
                        d.name as goodsName, d.spec
                        FROM ".INVOICE_INFO." a
                        LEFT JOIN ".UNIT." b on b.id = ABS(a.unitId)
                        LEFT JOIN ".STORAGE." c on c.id = a.locationId
                        LEFT JOIN ".GOODS." d on d.id = a.invId
                        WHERE {$where}";
            $list = $this->mysql_model->query(INVOICE_INFO, $sql, 2);
        }
		$data['status'] = 200;
        $data['msg'] = 'success';
		$data['data'] = $list;
		echo json_encode($data);
		return;        
    }
    
	public function get_goods_prices(){
		$goodsIds = $this->input->get_post('goodsIds', TRUE);
		$contactId = $this->input->get_post('contact_id', TRUE);
		
        $where = ' 1 ';
        if($goodsIds) $where .= ' and a.goods_id in('.str_quote($goodsIds).') ';
        if($contactId) $where .= " and a.contact_id = '{$contactId}' ";
		
		$sql = "SELECT a.*, b.salePrice FROM ".CUSTOMERPRICE." a 
					LEFT JOIN ".GOODS." b on b.id = a.goods_id
					WHERE {$where}";
		$list = $this->mysql_model->query(CUSTOMERPRICE, $sql, 2);
		foreach($list as $k => $v){
			$list[$k]['price'] = ($list[$k]['price'] > 0) ? $list[$k]['price'] : $list[$k]['salePrice'];
			$list[$k]['price'] = sprintf("%.2f", $list[$k]['price']);
		}
		$data['status'] = 200;
        $data['msg'] = 'success';
		$data['data'] = $list;
		echo json_encode($data);
		return;
	}
	
	
    //通过ID 获取商品信息
    private function get_goods_info($id)
    {
        $data = $this->mysql_model->get_row(GOODS, '(id=' . $id . ') and (isDelete=0)');
        if (count($data) > 0) {
            $v = array();
            $data['id'] = intval($id);
            $data['count'] = 0;
            $data['unitTypeId'] = intval($data['unitTypeId']);
            $data['baseUnitId'] = intval($data['baseUnitId']);
            $data['categoryId'] = intval($data['categoryId']);
            $data['salePrice'] = (float)$data['salePrice'];
            $data['vipPrice'] = (float)$data['vipPrice'];
            $data['purPrice'] = (float)$data['purPrice'];
            $data['wholesalePrice'] = (float)$data['wholesalePrice'];
            $data['discountRate1'] = (float)$data['discountRate1'];
            $data['discountRate2'] = (float)$data['discountRate2'];
            $data['remark'] = $data['remark'];
            $data['locationId'] = intval($data['locationId']);
            $data['baseUnitId'] = intval($data['baseUnitId']);
            $data['unitTypeId'] = intval($data['unitTypeId']);
            $data['unitId'] = intval($data['unitId']);
            $data['highQty'] = (float)$data['highQty'];
            $data['lowQty'] = (float)$data['lowQty'];
            $data['property'] = $data['property'] ? $data['property'] : NULL;
            $data['quantity'] = (float)$data['quantity'];
            $data['isWarranty'] = (float)$data['isWarranty'];
            $data['advanceDay'] = (float)$data['advanceDay'];
            $data['unitCost'] = (float)$data['unitCost'];
            $data['isSerNum'] = (float)$data['isSerNum'];
            $data['amount'] = (float)$data['amount'];
            $data['quantity'] = (float)$data['quantity'];
            $data['unitCost'] = (float)$data['unitCost'];
            $data['delete'] = intval($data['disable']) == 1 ? true : false;   //是否禁用
            $propertys = $this->data_model->get_invoice_info('and (a.invId=' . $id . ') and a.billType="INI"');
            foreach ($propertys as $arr => $row) {
                $v[$arr]['id'] = intval($row['id']);
                $v[$arr]['locationId'] = intval($row['locationId']);
                $v[$arr]['inventoryId'] = intval($row['invId']);
                $v[$arr]['locationName'] = $row['locationName'];
                $v[$arr]['quantity'] = (float)$row['qty'];
                $v[$arr]['unitCost'] = (float)$row['price'];
                $v[$arr]['amount'] = (float)$row['amount'];
                $v[$arr]['skuId'] = intval($row['skuId']);
                $v[$arr]['skuName'] = '';
                $v[$arr]['date'] = $row['billDate'];
                $v[$arr]['tempId'] = 0;
                $v[$arr]['batch'] = '';
                $v[$arr]['invSerNumList'] = '';
            }
            $data['propertys'] = $v;
            $customerPrice = $this->mysql_model->get_results(CUSTOMERPRICE, '(goods_id = ' . $id . ')');
            foreach ($customerPrice as $item) {
                $c['id'] = $item['contact_id'];
                $c['price'] = $item['price'];
                $data['customerPrice'][] = $c;
            }
        }
        return $data;
    }


    //公共验证
    private function validform($data)
    {
        !isset($data['name']) || strlen($data['name']) < 1 && str_alert(-1, '商品名稱不能留空');
        !isset($data['number']) || strlen($data['number']) < 1 && str_alert(-1, '商品編碼不能及時');
        !isset($data['categoryId']) || strlen($data['categoryId']) < 1 && str_alert(-1, '商品類別不能留空。');
        !isset($data['baseUnitId']) || $data['baseUnitId'] == 0 && str_alert(-1, '計量單位不能留空。');
		!isset($data['locationId']) || $data['locationId'] == 0 && str_alert(-1, '倉庫不能留空');
        $data['purPrice'] = $data['purPrice'] ? $data['purPrice'] : 0;
        $data['salePrice'] = $data['salePrice'] ? $data['salePrice'] : 0;
        $data['vipPrice'] = $data['vipPrice'] ? $data['vipPrice'] : 0;
        $data['discountRate1'] = $data['discountRate1'] ? $data['discountRate1'] : 0;
        $data['discountRate2'] = $data['discountRate2'] ? $data['discountRate2'] : 0;
        $data['wholesalePrice'] = $data['wholesalePrice'] ? $data['wholesalePrice'] : 0;
        $data['unitName'] = $this->mysql_model->get_row(UNIT, '(id="' . $data['baseUnitId'] . '")', 'name');
        $data['categoryName'] = !empty($this->mysql_model->get_row(CATEGORY, '(id="' . $data['categoryId'] . '")', 'name')) ? $this->mysql_model->get_row(CATEGORY, '(id="' . $data['categoryId'] . '")', 'name') : '';
        $data['pinYin'] = $this->lib_pinyin->str2pinyin($data['name']);
        if (strlen($data['propertys']) > 0) {
            $list = (array)json_decode($data['propertys'], true);
            $storage = $this->mysql_model->get_results(STORAGE, '(disable=0)');
            $locationId = array_column($storage, 'id');
            $locationName = array_column($storage, 'name', 'id');
            foreach ($list as $arr => $row) {
                !in_array($row['locationId'], $locationId) && str_alert(-1, @$locationName[$row['locationId']] . '仓库不存在或不可用！');
            }
        }
        return $data;
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */