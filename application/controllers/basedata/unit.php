<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Unit extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->common_model->checkpurview();
    }

    //单位列表
    public function index()
    {
        $unittypeid = intval($this->input->get_post('unitTypeId', TRUE));
        $where = $unittypeid > 0 ? ' and unittypeid=' . $unittypeid . '' : '';
        $v = '';
        $data['status'] = 200;
        $data['msg'] = 'success';
        $list = $this->mysql_model->get_results(UNIT, '(isDelete=0) ' . $where . ' order by id desc');
        foreach ($list as $arr => $row) {
            $v[$arr]['default'] = $row['default'] == 1 ? true : false;
            $v[$arr]['guid'] = $row['guid'];
            $v[$arr]['id'] = intval($row['id']);
            $v[$arr]['name'] = $row['name'];
            $v[$arr]['rate'] = intval($row['rate']);
            $v[$arr]['isDelete'] = intval($row['isDelete']);
            $v[$arr]['unitTypeId'] = intval($row['unitTypeId']);
        }
        $data['data']['items'] = is_array($v) ? $v : '';
        $data['data']['totalsize'] = $this->mysql_model->get_count(UNIT, '(isDelete=0) ' . $where . '');
        die(json_encode($data));
    }

    //新增
    public function add()
    {
        $this->common_model->checkpurview(78);
        $data = str_enhtml($this->input->post(NULL, TRUE));
        $rate = element('rate', $data);
        $this->db->trans_begin();
        if (count($data) > 0) {
            $data = $this->validform($data);
            $iid = $this->mysql_model->insert(UNIT, elements(array('name', 'default'), $data));
            // str_alert(-1, '2333', $sql);
			if(false != $rate){
				foreach ($rate as $item) {
					$this->mysql_model->insert(UNITPRICE, array(
                        'unitId' => $iid, 
                        'to_unitId' => $item["id"], 
                        'discount' => empty($item['rate']) ? 0 : floatval($item['rate'])
                    ));
                    $ra = empty($item['rate']) ? 0 : floatval(number_format(1/$item['rate'], 3));
                    $this->mysql_model->insert(UNITPRICE, array(
                        'unitId' => $item["id"], 
                        'to_unitId' => $iid, 
                        'discount' => $ra
                    ));
				}
			}
            
            if ($this->db->trans_status() !== FALSE) {
                $this->db->trans_commit();
                $data['id'] = $iid;
                $this->common_model->logs('新增单位:' . $data['name']);
                die('{"status":200,"msg":"success","data":{"default":false,"guid":"","id":' . $iid . ',"isdelete":0,"name":"' . $data['name'] . '","rate":1,"unitTypeId":0}}');
                str_alert(200, 'success', $data);
            }else{
                $this->db->trans_rollback();
                str_alert(-1, '添加失败');
            }
        }
        str_alert(-1, '添加失败');
    }

    //修改
    public function update()
    {
        $this->common_model->checkpurview(79);
        $id = intval($this->input->post('id', TRUE));
        $data = str_enhtml($this->input->post(NULL, TRUE));
        $rate = element('rate', $data);
        if (count($data) > 0) {
            $this->db->trans_begin();
            $data = $this->validform($data);
            $sql = $this->mysql_model->update(UNIT, elements(array('name', 'default'), $data), '(id=' . $id . ')');
            foreach ($rate as $item) {
                
                $unit = $this->mysql_model->get_row(UNITPRICE, '(unitId=' . $id . ') and (to_unitId=' . $item['id'] .') ');
                $unit2 = $this->mysql_model->get_row(UNITPRICE, '(unitId=' . $item['id'] . ') and (to_unitId=' . $id .') ');
                $isu = 0;
                if (count($unit) > 0) {
                    if ($unit['discount'] != $item['rate'] ) {
                        $this->mysql_model->update(UNITPRICE, array(
                            'discount' => floatval($item['rate'])
                        ), '(unitId=' . $id . ') and to_unitId=' . $item['id']);
                        $isu = 1;
                    }
                } else {
                    $iid = $this->mysql_model->insert(UNITPRICE, array(
                        'unitId' => $id, 
                        'to_unitId' => $item['id'], 
                        'discount' => floatval($item['rate'])
                    ));
                    $isu = 1;
                }

				if($isu)
				{
                    $ra = floatval(number_format(1/$item['rate'], 3));
                    if (count($unit2) > 0) {
                        $this->mysql_model->update(UNITPRICE, array(
                            'discount' => $ra
                        ), '(unitId=' . $item['id'] . ') and to_unitId=' . $id);
                    } else {
                        $iid = $this->mysql_model->insert(UNITPRICE, array(
                            'unitId' => $item['id'], 
                            'to_unitId' => $id, 
                            'discount' => $ra
                        ));
                    }
				}
            }
            if ($sql) {
                // $data['id'] = $id;
                // $data['unitTypeId'] = isset($data['unitTypeId']) ? intval($data['unitTypeId']) : 0;
                // $data['rate'] = isset($data['rate']) ? intval($data['rate']) : 0;
                $this->mysql_model->update(GOODS, array('unitName' => $data['name']), '(baseUnitId=' . $id . ')');
            }

            if ($this->db->trans_status() !== FALSE) {
                $this->db->trans_commit();
                $this->common_model->logs('更新单位:' . $data['name']);
                str_alert(200, 'success', $data);
            } else {
                $this->db->trans_rollback();
                str_alert(-1, '更新失败2');
            }
        }
        str_alert(-1, '更新失败');
    }

    //删除
    public function delete()
    {
        $this->common_model->checkpurview(80);
        $id = intval($this->input->post('id', TRUE));
        $data = $this->mysql_model->get_row(UNIT, '(id=' . $id . ') and (isDelete=0)');
        if (count($data) > 0) {
            $info['isDelete'] = 1;
            $this->mysql_model->get_count(GOODS, '(unitId=' . $id . ')') > 0 && str_alert(-1, '该单位已经被使用，不允许删除');
            
            $sql = $this->mysql_model->update(UNIT, $info, '(id=' . $id . ')');
            $this->mysql_model->delete(UNITPRICE, "(unitId='".$id."' or to_unitId='".$id."')");
            if ($sql) {
                $this->common_model->logs('删除单位:ID=' . $id . ' 名称:' . $data['name']);
                str_alert(200, 'success', array('msg' => '成功删除', 'id' => '[' . $id . ']'));
            }
        }
        str_alert(-1, '删除失败');
    }

    //公共验证
    private function validform($data)
    {
        !isset($data['name']) || strlen($data['name']) < 1 && str_alert(-1, '单位名称不能为空');
        $data['default'] = isset($data['default']) && $data['default'] == 'true' ? 1 : 0;
        $where = isset($data['id']) ? ' and (id<>' . $data['id'] . ')' : '';
		$where .= ' and (isDelete = 0) ';
        $this->mysql_model->get_count(UNIT, '(name="' . $data['name'] . '")' . $where) && str_alert(-1, '单位名称重复', $where);
        if (isset($data['id'])) {
            // $this->mysql_model->get_count(GOODS, '(unitId=' . $data['id'] . ')') > 0 && str_alert(-1, '该单位已经被使用，不允许更改组');
        }
        return $data;
    }

    public function unitRate()
    {
        $id = intval($this->input->get('id', TRUE));
        $where = ' and id<>' . $id;
        $list = $this->mysql_model->get_results(UNIT, '(isDelete=0) ' . $where . ' order by id desc');
        $data = [];
        foreach ($list as $item) {
            $m['id'] = $item['id'];
            $m['name'] = $item['name'];
            
            $unit = $this->mysql_model->get_row(UNITPRICE, '(unitId=' . $id . ') and to_unitId=' . $item['id']);
            $m['discount'] = isset($unit) && !empty($unit) ? $unit['discount'] : 0;
            // str_alert(-1, '删除失败', $unit);
            $data[] = $m;
        }

        header('Content-type:text/json');
        die(json_encode(['status' => 200, 'data' => $data]));

    }


	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */