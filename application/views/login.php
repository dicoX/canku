<?php if(!defined('BASEPATH')) exit('No direct script access allowed');?>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>興利製麵家-倉儲式雲購銷系統 v2.0</title>
        <meta name="globalsign-domain-verification" content="wnLJy1jTEsQbKd3ZepUI9lK4R1lnQif9O4mKSlu1rX">
        <meta name="viewport" content="width=device-width,initial-scale=0.4; maximum-scale=3.0;minimum-scale:0.5;user-scalable=yes;">
        <link href="<?php echo base_url()?>statics/login/Css/common.css" rel="stylesheet">
        <link href="<?php echo base_url()?>statics/login/Css/global.css" rel="stylesheet">
        <link rel="shortcut icon" href="<?php echo base_url()?>statics/login/Images/bitbug_favicon.ico" type="image/x-icon">
        <script src="<?php echo base_url()?>statics/login/Css/jquery-1.7.1.js"></script>
        <script src="<?php echo base_url()?>statics/login/Css/common.js"></script>
        <script src="<?php echo base_url()?>statics/login/Css/minicheck.js"></script>
    </head>    
<body id="body">
    <div class="connext">
   <form method="post" action="<?php echo site_url('login');?>" name="main_login">
        <div class="LoginBox">
            <div class="LoginLog"><b>『興利製麵家』倉儲系統</b></div>
            <div class="Loginc">
                <div class="loginInputc">
                    <input type="text" class="logininput"  name="username" placeholder="賬戶名">
                    
                </div>
                <div class="loginInputc">
                    <input type="password" class="logininput" name="userpwd"  placeholder="密   鑰">
                </div>
            </div>
            <div style="color:red; font-size:20px; margin-top:12px; line-height:20px; display:none;" id="loginerror"></div>
            <!--
            <div >
             &nbsp;&nbsp; 验证码: <input name="code" type="text" class="text mid" id="code" />
				<img align="absbottom" src="<?php echo site_url('login/code');?>"  onclick=this.src="<?php echo site_url('login/code');?>?"+Math.random() style="cursor: pointer;" title="点击刷新验证码"/>
            </div>
        -->
            <div class="LoginBtn"><input type="Submit" name="Submit" class="loginBtn"  onClick="Login()" value=""></div>
           
        </div>
    </form>
</div>


</body></html>