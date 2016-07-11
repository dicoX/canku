<?php if(!defined('BASEPATH')) exit('No direct script access allowed');?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $transType==150601 ? '出貨單' :'銷售退貨單'?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style></style>
</head>
<body>
<?php for($t=1; $t<=$countpage; $t++){?>
		<table width="800" align="center">
			<tr height="30px">
<!--				<td align="center" style="font-family:'宋体'; font-size:18px; font-weight:normal;height:45px;"></td>-->
				<td>&nbsp;</td>
			</tr> 
	    <tr height="15px">
<!--				<td align="center" style="font-family:'宋体'; font-size:18px; font-weight:normal;"><?php echo $system['companyName']?></td>-->
				<td></td>
			</tr> 
			<tr height="15px">
<!--				<td align="center" style="font-family:'宋体'; font-size:18px; font-weight:normal;height:25px;"><?php echo $transType==150601 ? '出貨單' :'銷售退貨'?></td>-->
				<td></td>
			</tr>
		</table>	
		
		<table width="800" align="center">
			<tr height="15" align="left">
				<td width="625" style="font-family:'宋体';font-size:12px;height:20px;padding-left:35px;"><?php echo $contactNo.' '.$contactName?> </td>
				<td width="120" style="font-family:'宋体'; font-size:12px;height:20px;"><?php echo $billNo?></td>
			</tr>
			<tr height="15" align="left">
				<?php 
				if (strlen($contactMan)>0) {                               //获取首个联系人cky.20160515
				  $array = (array)json_decode($contactMan,true);
				  foreach ($array as $arr1=>$row1) {
					  if ($row1['linkFirst']==1) {
				?>				
				<td style="font-family:'宋体'; font-size:12px;height:20px;padding-left:35px;"><?php echo @$row1['address']?> </td>
				<?php } else {?>
				<td></td>
				<?php }}}?>
				<td style="font-family:'宋体'; font-size:12px;height:20px;"><?php echo $billDate?></td>
			</tr>
		</table>	
			
		<table width="900" border="0" cellpadding="2" cellspacing="1" align="center">   
			<tr>
			  <td width="10" height="40">&nbsp;</td>
				<td width="450">&nbsp;</td>
				<td width="60">&nbsp;</td>
				<td width="70">&nbsp;</td>
				<td width="110">&nbsp;</td>
			</tr>
			<?php 
		   $i = ($t-1)*$num + 1;
		   foreach($list as $arr=>$row) {
		      if ($row['i']>=(($t-1)*$num + 1) && $row['i'] <=$t*$num) {
		   ?>
				<tr>
				  <td width="10"  align="right"><?php echo $row['i']?>/</td>
					<td width="450"><?php echo $row['goods'];?></td>
					<td width="60" align="right"><?php echo str_money(abs($row['qty']),$system['qtyPlaces'])?></td>
					<td width="70" align="right"><?php echo abs($row['price'])?></td>
					<td width="110" align="right"><?php echo str_money(abs($row['amount']),2)?></td>
				</tr>
				<?php 
				    $s = $row['i'];
				    }
				    $i++;
				}
				?>
				
				<?php 
				//补全
				if ($t==$countpage) {
				   for ($m=$s+1;$m<=$t*$num;$m++) {
				?>
				<tr>
				  <td width="10">&nbsp;</td>
					<td width="450"></td>
					<td width="60"></td>
					<td width="70"></td>
					<td width="110"></td>
				</tr>
				<?php }}?>
				
				 <?php if ($t==$countpage) {?>
				 <tr style="height:20px">
				  <td width="10"></td>
					<td width="450"></td>
					<td width="60"></td>
					<td width="70"></td>
					<td width="110" align="right" style="font-family:'黑体'; font-size:14px;"><strong><?php echo str_money(abs($totalAmount),2)?></strong></td>
				</tr>
				<?php }?>
		</table>
		
<?php echo $t==$countpage?'':'<br><br><br>';}?>		
		 
</body>
</html>		