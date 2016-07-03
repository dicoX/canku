<?php if (!defined('BASEPATH')) exit('No direct script access allowed');?>
		<table class="table" width="1500"  border="1">
			<thead>
				<tr>
				    <th width="120" align="center"><span style="color:#FF0000">客戶編號</span></th>
					<th width="150" ><span style="color:#FF0000">客戶名稱</span></th>
					<th width="100" align="center">客戶類別</th>
					<th width="100" align="center">客戶等級</th>
					<th width="100" align="center">餘額日期</th>
					<th width="100" align="center">期初應收款</th>	
					<th width="100" align="center">期初預收款</th>	
					<th width="120" align="center">備註</th>
					<th width="120" align="center">聯絡人</th>	
					<th width="100" align="center">手機</th>	
					<th width="100" align="center">座機</th>	
					<th width="100" align="center">*QQ/MSN</th>	
					<th width="100" align="center">送貨地址</th>
					<th width="100" align="center">首要聯絡人</th>	
				</tr>
			</thead>
			<tbody>
			    <?php 
			    $i = 1;
			    foreach($list as $arr=>$row) { 
			    ?>
				<tr target="id">
					<td ><?php echo $row['number']?></td>
					<td ><?php echo $row['name']?></td>
					<td ><?php echo $row['cCategoryName']?></td>
					<td ><?php echo $row['cLevelName']?></td>
					<td ><?php echo $row['beginDate']?></td>
					<td ><?php echo $row['amount']?></td>
					<td ><?php echo $row['periodMoney']?></td>
					<td ><?php echo $row['remark']?></td>
					<?php 
					if (strlen($row['linkMans'])>0) {                               //获取首个联系人
					  $array = (array)json_decode($row['linkMans'],true);
					  foreach ($array as $arr1=>$row1) {
						  if ($row1['linkFirst']==1) {
					?>
					<td ><?php echo @$row1['linkName']?></td>
					<td ><?php echo @$row1['linkMobile']?></td>
					<td ><?php echo @$row1['linkPhone']?></td>
					<td ><?php echo @$row1['linkIm']?></td>
					<td ><?php echo @$row1['address']?></td>
					<td ><?php echo @$row1['linkFirst']==1 ? '是' : '否'?></td>
					<?php } else {?>
					<td ></td>
					<td ></td>
					<td ></td>
					<td ></td>
					<td ></td>
					<td ></td>
					<?php }}}?>
				</tr>
				<?php $i++;}?>
 
 </tbody>
</table>	
