<?php if (!defined('BASEPATH')) exit('No direct script access allowed');?>
  		 
		<table width="1440px" class="list">
  			<tr><td class='H' align="center" colspan="7"><h3>現金銷售报表<h3></td></tr>
  			<tr><td colspan="7">日期：<?php echo $beginDate?>至<?php echo $endDate?></td></tr>
  		</table>
  		<table width="1440px" class="list" border="1">
  			<thead>
  				<tr>
				<th>日期</th>
  				<th>单据编号</th>
  				<th>收款状态</th>
  				<th>客户</th>
  				<th>业务类型</th>
  				<th>收入</th>
  				<th>销售员</th>
  				</tr>
  			</thead>
  			<tbody>
				 <?php 
				 foreach($list as $k => $row){
				 ?>
  			     <tr class="link">
				   <td><?php echo $row['billDate']?></td>
  			       <td><?php echo $row['billNo']?></td>
  			       <td><?php echo $row['hxStateTxt']?></td>
  			       <td><?php echo $row['buName']?></td>
  			       <td><?php echo $row['transTypeName']?></td>
  			       <td><?php echo $row['rpAmount']?></td>
                   <td><?php echo $row['userName']?></td>
                 </tr>
				 <?php 
				 }
				 ?>
  				<tr>
  				<td colspan="6" class="R B">合计：</td>
  				<td class="R B"><?php echo $total['rpAmount']?></td>
  				<td class="R B"></td>
  				</tr>
  			</tbody>
  		</table>
 