<?php $this->load->view('header');?>

<script type="text/javascript">
var DOMAIN = document.domain;
var WDURL = "";
var SCHEME= "<?php echo sys_skin()?>";
try{
	document.domain = '<?php echo base_url()?>';
}catch(e){
}
//ctrl+F5 增加版本号来清空iframe的缓存的
$(document).keydown(function(event) {
	/* Act on the event */
	if(event.keyCode === 116 && event.ctrlKey){
		var defaultPage = Public.getDefaultPage();
		var href = defaultPage.location.href.split('?')[0] + '?';
		var params = Public.urlParam();
		params['version'] = Date.parse((new Date()));
		for(i in params){
			if(i && typeof i != 'function'){
				href += i + '=' + params[i] + '&';
			}
		}
		defaultPage.location.href = href;
		event.preventDefault();
	}
});
</script>

<link href="<?php echo base_url()?>statics/css/<?php echo sys_skin()?>/bills.css?ver=20150522" rel="stylesheet" type="text/css">
<style>
#barCodeInsert{margin-left: 10px;font-weight: 100;font-size: 12px;color: #fff;background-color: #B1B1B1;padding: 0 5px;border-radius: 2px;line-height: 19px;height: 20px;display: inline-block;}
#barCodeInsert.active{background-color: #23B317;}
</style>
</head>

<body>
<div class="wrapper">
  <span id="config" class="ui-icon ui-state-default ui-icon-config"></span>
  <div class="mod-toolbar-top mr0 cf dn" id="toolTop"></div>
  <div class="bills cf">
    <div class="con-header">
      <dl class="cf">
        <dd class="pct25">
          <label>客戶：</label>
          <span class="ui-combo-wrap" id="customer">
          <input type="text" name="" class="input-txt" autocomplete="off" value="" data-ref="date">
          <i class="ui-icon-ellipsis"></i></span></dd>
        <dd id="identifier" class="pct20 tc">
          <label>銷售人員：</label>
          <span class="ui-combo-wrap" id="sales">
              <input type="text" class="input-txt" autocomplete="off">
          <i class="trigger"></i></span>
        </dd>
        <dd class="pct20 tc">
          <label>單據日期：</label>
          <input type="text" id="date" class="ui-input ui-datepicker-input" value="2015-06-08">
        </dd>
        <dd id="identifier" class="pct20 tc">
          <label>單據編號：</label>
          <span id="number"><?php echo str_no('XS');?></span></dd>
        <!-- <dd id="classes" class="pct15 tr">
          <label class="radio">
            <input type="radio" name="classes" value="150601">
            销货</label>
          <label class="radio">
            <input type="radio" name="classes" value="150602">
            退货</label>
        </dd> -->
      </dl>
    </div>
    <div class="grid-wrap">
      <table id="grid" class="sale-grid  sale-autoload-grid">
      </table>
      <div id="page"></div>
    </div>
    <div class="con-footer cf">
      <div class="mb10">
        	<textarea type="text" id="note" class="ui-input ui-input-ph">暫無備註信息！</textarea>
      </div>
      <ul id="amountArea" class="cf">
        <li>
          <label>折扣率：</label>
          <input type="text" id="discountRate" class="ui-input" data-ref="deduction">%
        </li>
        <li>
          <label>優惠金額：</label>
          <input type="text" id="deduction" class="ui-input" data-ref="payment">
        </li>
        <li>
          <label>優惠後金額：</label>
          <input type="text" id="discount" class="ui-input ui-input-dis" data-ref="discountRate" disabled>
        </li>
        <li class="dn">
          <label>其他費用：</label>
          <input type="text" id="customerFree" class="ui-input" data-ref="customerFree">
        </li>
        <li>
          <label id="paymentTxt">是次實收：</label>
          <input type="text" id="payment" class="ui-input" data-ref="actpay">&emsp;
        </li>
        <li id="accountWrap" class="dn">
          <label>結算賬戶：</label>
          <span class="ui-combo-wrap" id="account" style="padding:0;">
          <input type="text" class="input-txt" autocomplete="off">
          <i class="trigger"></i></span><a id="accountInfo" class="ui-icon ui-icon-folder-open" style="display:none;"></a>
        </li>
        <li>
          <label>是次差額：</label>
          <input type="text" id="arrears" class="ui-input ui-input-dis" disabled>
        </li>
        <li class="dn">
          <label>累計差額：</label>
          <input type="text" id="totalArrears" class="ui-input ui-input-dis" disabled>
        </li>
        <li>
          <label>收款情况：</label>
          <select name="hadPay" id="hadPay" class='ui-input'>
            <option value='0'>未收款</option>
            <option value='1'>已收款</option>
          </select>
        </li>
      </ul>
      <ul class="c999 cf">
        <li>
          <label>制單員：</label>
          <span id="userName"></span>
        </li>
        <li>
          <label>制單：:</label>
          <span id="checkName"></span>
        </li>
        <li>
          <label>上次更新：</label>
          <span id="modifyTime"></span>
        </li>
      </ul>
    </div>
    <div class="cf" id="bottomField">
    	<div class="fr" id="toolBottom"></div>
    </div>
    <div id="mark"></div>
  </div>
  
  <div id="initCombo" class="dn">
    <input type="text" class="textbox goodsAuto" name="goods" autocomplete="off">
    <input type="text" class="textbox storageAuto" name="storage" autocomplete="off">
    <input type="text" class="textbox unitAuto" name="unit" autocomplete="off">
    <input type="text" class="textbox batchAuto" name="batch" autocomplete="off">
    <input type="text" class="textbox dateAuto" name="date" autocomplete="off">
    <input type="text" class="textbox priceAuto" name="price" autocomplete="off">
  </div>
  <div id="storageBox" class="shadow target_box dn">
  </div>
</div>
<script src="<?php echo base_url()?>statics/js/dist/sales.js?ver=20160617"></script>
</body>
</html>



