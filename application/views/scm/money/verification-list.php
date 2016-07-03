







<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit|ie-stand|ie-comp">
<title>在线进销存</title>

<link href="http://images.youshang.com/saas/scm/vip2_gd_beta/css/common.css?ver=2016042801" rel="stylesheet" type="text/css">

<link href="http://images.youshang.com/saas/scm/vip2_gd_beta/css/blue/ui.min.css?ver=2016042801" rel="stylesheet">
<script src="http://images.youshang.com/saas/scm/vip2_gd_beta/js/common/libs/jquery/jquery-1.10.2.min.js"></script>
<script src="http://images.youshang.com/saas/scm/vip2_gd_beta/js/common/libs/json3.min.js"></script>
<script src="/js/common/common.js?ver=2016042801"></script>
<script src="http://images.youshang.com/saas/scm/vip2_gd_beta/js/common/grid.js?ver=2016042801"></script>
<script src="http://images.youshang.com/saas/scm/vip2_gd_beta/js/common/plugins.js?ver=2016042801"></script>
<script src="http://images.youshang.com/saas/scm/vip2_gd_beta/js/common/plugins/jquery.dialog.js?self=true&ver=2016042801"></script>

<script type="text/javascript">
var DOMAIN = document.domain;
var WDURL = "";
var SCHEME= "blue";
try{
	document.domain = 'youshang.com';
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

<style>
#matchCon { width: 280px; }
</style>
</head>

<body>
<div class="wrapper">
  <div class="mod-search cf">
    <div class="fl">
      <ul class="ul-inline">
        <li>
          <input type="text" id="matchCon" class="ui-input ui-input-ph" value="请输入单据号或供应商或备注">
        </li>
        <li>
          <label>日期:</label>
          <input type="text" id="beginDate" value="" class="ui-input ui-datepicker-input">
          <i>-</i>
          <input type="text" id="endDate" value="" class="ui-input ui-datepicker-input">
        </li>
        <li><a class="ui-btn" id="search">查询</a></li>
      </ul>
    </div>
    <div class="fr">
      <a class="ui-btn ui-btn-sp mrb" id="add">新增</a> 
      <a class="ui-btn mrb" id="export">导出</a>
      <a href="#" class="ui-btn" id="btn-batchDel">删除</a>
    </div>
  </div>
  <div class="grid-wrap">
    <table id="grid">
    </table>
    <div id="page"></div>
  </div>
</div>
<script src="/js/dist/verificationList.js?ver=2016042801"></script>
</body>
</html>