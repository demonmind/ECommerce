<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register-GSU ECommerce</title>
<style type="text/css">
.loginWrapper { width: 240px; position: absolute; left: 50%; top: 50%; margin: -124px 0 0 -120px; text-align: center; -moz-perspective: 800px; -webkit-perspective: 800px; perspective: 800px; }

/* Login hover buttons */

.logleft, .logright, .logback { background: url(http://i.imgur.com/lcRwahc.png) no-repeat; height: 37px; width: 37px; position: absolute; top: 36px; display: block; opacity: 0; filter: alpha(opacity=0); }
.logleft { left: 0px; background-position: 0 0; } 
.logright { right: 0px; background-position: -38px 0; } 
.logback { left: 0; background-position: -76px 0; }
.logleft:hover { background-position: 0 -39px; } 
.logright:hover { background-position: -38px -39px; } 
.logback:hover { background-position: -76px -39px; }
#login{ z-index:100; }
#recover{ z-index:1; opacity:0; filter: alpha(opacity=0); -moz-transform:rotateY(180deg); -webkit-transform:rotateY(180deg); transform:rotateY(180deg); }
.flipped #login{ opacity:0; filter: alpha(opacity=0); -moz-transform:rotateY(-180deg); -webkit-transform:rotateY(-180deg); transform:rotateY(-180deg); }
.loginWrapper.flipped #recover{ opacity:1; filter: alpha(opacity=100); -moz-transform:rotateY(0deg); -webkit-transform:rotateY(0deg); transform:rotateY(0deg); }
.loginWrapper form { width:100%; height:100%; position:absolute; top:0; left:0;

/* Enabling 3d space for the transforms */
-moz-transform-style: preserve-3d;
-webkit-transform-style: preserve-3d;
transform-style: preserve-3d;

/* When the forms are flipped, they will be hidden */
-moz-backface-visibility: hidden;
-webkit-backface-visibility: hidden;
backface-visibility: hidden;

/* Enabling a smooth animated transition */
-moz-transition:0.8s;
-webkit-transition:0.8s;
transition:0.8s;

/* Configure a keyframe animation for Firefox */
-moz-animation: pulse 2s infinite;

/* Configure it for Chrome and Safari */
-webkit-animation: pulse 2s infinite;
}

.loginPic { text-align: center; display: block; position: relative; overflow: hidden; }
.loginPic span { display: block; color: #5f5f5f; font-size: 14px; margin-top: 10px; font-weight: bold; text-shadow: 0 1px 1px #ffffff; }
.loginWrapper form { display: block; margin: 0 auto; width: 236px; }
.loginWrapper a { display: inline-block; }
.loginWrapper input[type=text], .loginWrapper input[type=password] { font-size: 11px; color: #858585; box-shadow: 0 0 0px 2px #ebebeb; -webkit-box-shadow: 0 0 0px 2px #ebebeb; -moz-box-shadow: 0 0 0px 2px #ebebeb; padding: 7px 27px 7px 9px; border: 1px solid #d7d7d7; width: 198px; display: inline-block; margin-top: 15px; }
.loginUsername { background: #fbfbfb url(http://i.imgur.com/yeEafuK.png) no-repeat 213px 7px; }
.loginPassword { background: #fbfbfb url(http://i.imgur.com/0sxpIbn.png) no-repeat 214px 7px; }
.loginEmail { background: #fbfbfb url(http://i.imgur.com/zI4zRWc.png) no-repeat 213px 7px; }
.logControl { margin-top: 15px; }
.logControl:after { content: ""; display: block; clear: both; }
.logControl .memory { float: left; margin-top: 5px; }
.logControl input[type=submit] { float: right; }

/* Checkboxes */

div.checker { width: 16px; height: 16px; position: relative; display: -moz-inline-box; display: block; vertical-align: middle; zoom: 1; float: left; margin-top: 3px; margin-right: 8px; box-shadow: 0 1px 0 #fff; -webkit-box-shadow: 0 1px 0 #fff; -moz-box-shadow: 0 1px 0 #fff; }
div.checker input { width: 16px; height: 16px; opacity: 0; filter: alpha(opacity:0); display: inline-block; background: none; }
div.checker span { background: url(http://i.imgur.com/gAJ5G4V.png) no-repeat 0 0; height: 16px; width: 16px; display: -moz-inline-box; display: inline-block; text-align: center; }
div.checker span.checked { background-position: 0 -17px; }

/* Button */

.bBlue {  border: 1px solid #3e76af; box-shadow: 0 1px 2px 0 #66b2d2 inset; -webkit-box-shadow: 0 1px 2px 0 #66b2d2 inset; -moz-box-shadow: 0 1px 2px 0 #66b2d2 inset;
	color:#fff;
background: #5ba5cb;
background: -moz-linear-gradient(top,  #5ba5cb 0%, #3a70ab 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#5ba5cb), color-stop(100%,#3a70ab));
background: -webkit-linear-gradient(top,  #5ba5cb 0%,#3a70ab 100%);
background: -o-linear-gradient(top,  #5ba5cb 0%,#3a70ab 100%);
background: -ms-linear-gradient(top,  #5ba5cb 0%,#3a70ab 100%);
background: linear-gradient(top,  #5ba5cb 0%,#3a70ab 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#5ba5cb', endColorstr='#3a70ab',GradientType=0 );
}
.bBlue:hover { opacity: 0.95; filter: alpha(opacity=95); -webkit-transition: opacity 0.2s ease-in-out; -moz-transition: opacity 0.2s ease-in-out; transition: opacity 0.2s ease-in-out; }
.bBlue:active { background: #4786b8; box-shadow: 0 0 2px #707070 inset, 0 1px 0 #fff; -webkit-box-shadow: 0 0 2px #707070 inset, 0 1px 0 #fff; -moz-box-shadow: 0 0 2px #707070 inset, 0 1px 0 #fff; }
.buttonM [class*="tablectrl"] {  font-size: 11px; color: #fff; font-weight: bold; text-shadow: 0 -1px #6f6f6f; display: inline-block; line-height: 14px; border-radius: 2px; -webkit-border-radius: 2px; -moz-border-radius: 2px; }
.buttonM span { text-shadow: 0 1px 0 #6f6f6f; margin-left: 10px; }
.buttonM { padding: 7px 15px; }
.memory label{font-size:12px; position:relative;top:-18px;left:20px;}

.error{
	position: relative;
	top: -32px;
	color: red;
	font-size: 20px;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div class="loginWrapper">
<span class="error">${msg}</span>
	<!-- Current user form -->
    <form action="register" id="login" method="post">
        <div class="loginPic">
            <a href="#" title=""><img src="https://cdn1.iconfinder.com/data/icons/Free-Medical-Icons-Set/128x128/Application.png" alt=""></a>
            <span>Register</span>
        </div>
        
        <input type="text" name="username" placeholder="Username" class="loginUsername">
        <input type="password" name="password" placeholder="Password" class="loginPassword">
        <input type="text" name="email" placeholder="Email" class="loginEmail">
        <div class="logControl">
            <input type="submit" name="submit" value="Register" class="buttonM bBlue">
        </div>
    </form>
</div>

<script type="text/javascript">

</script>
</body>
</html>