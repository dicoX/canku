<?php $this->load->view('header');?>

<script type="text/javascript">
var DOMAIN = document.domain;
var WDURL = "";
var SCHEME= "<?php echo sys_skin()?>";
//try{
//	document.domain = 'youshang.com';
//}catch(e){
//}
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

<link href="<?php echo base_url()?>/statics/css/authority.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrapper authority-wrap">
  <div class="mod-inner">
       
      <div class="authority-ctn-wrap">
         
        <div class="register-wrap">
            <h3>新建授權管理員</h3>
            <form action="#" id="registerForm" class="register-form">
              <ul class="mod-form-rows">
                <li class="row-item">
                  <div class="label-wrap">
                    <label for="userName">賬戶名：</label>
                  </div>
                  <div class="ctn-wrap">
                    <input type="text" class="ui-input" id="userName" name="userName"/>
                    <p class="msg">賬戶名由4-20個英文字母或者數字組合（不支持中文，不區分大小寫字母）。賬戶一旦創建完成，此賬戶名將不可修改。</p>
                  </div>
                </li>
                <li class="row-item">
                  <div class="label-wrap">
                    <label for="password">密  鑰：</label>
                  </div>
                  <div class="ctn-wrap">
                    <input type="password" class="ui-input" id="password" name="password" style="ime-mode
:disabled;" onpaste="return false;"/>
                    <div class="pswStrength" id="pswStrength" style="display:none;">
                      <p>密碼強度</p>
                      <b></b>
                      <b></b>
                      <b></b>
                    </div>
                    <p class="msg">密碼由6-20個英文字母（區分大小寫）、數字或者特殊符號組合。</p>
                  </div>
                </li>
                <li class="row-item">
                  <div class="label-wrap">
                    <label for="pswConfirm">校驗密碼：</label>
                  </div>
                  <div class="ctn-wrap">
                    <input type="password" class="ui-input" id="pswConfirm" name="pswConfirm" style="ime-mode
:disabled;" onpaste="return false;"/>
                  </div>
                </li>
                <li class="row-item">
                  <div class="label-wrap">
                    <label for="realName">真實姓名：</label>
                  </div>
                  <div class="ctn-wrap">
                      <input type="text" class="ui-input" id="realName" name="realName"/>
                      <p class="msg">真實姓名用於單據及報表列印中顯示，請如實填寫。</p>
                  </div>
                </li>
                <li class="row-item">
                  <div class="label-wrap">
                    <label for="">聯絡電話：</label>
                  </div>
                  <div class="ctn-wrap">
                      <input type="text" class="ui-input" id="userMobile" name="userMobile"/>
                      <p class="msg">此電話號碼將作爲重置密鑰的憑證。</p>
                  </div>
                </li>
              </ul>
              <div class="btn-row">
                <a href="authority.jsp" class="ui-btn mrb">返回列表頁</a><a href="#" class="ui-btn ui-btn-sp" id="registerBtn">下一步</a>
              </div>
            </form>
        </div>
      <div>
  </div>
</div>
<script src="<?php echo base_url()?>/statics/js/dist/register.js?ver=20140430"></script>
</body>
</html>

 