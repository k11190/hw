<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>關於我們</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../assets/main.css">
		<link rel="stylesheet" type="text/css" href="../assets/about.css">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg" >
				<a class="navbar-brand" href="../index.jsp"><img src="../image/logo.png" alt="" class="logo"><img src="../image/name.png" alt="" class=fname></a>
				<ul class="nav col-sm-5" id="menu">
				<li class="nav-item">
					<a class="nav-link" href="../index.jsp" style="color:black">首頁</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="range.jsp" style="color:black">排行</a>
				</li>
				<li class="nav-item">
					<div class="dropdown">
  						<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    						產品類別
  						</button>
  						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    						<a class="dropdown-item" href="product.jsp#rose">玫瑰</a>
    						<a class="dropdown-item" href="product.jsp#lily">百合</a>
   					 		<a class="dropdown-item" href="product.jsp#tulip">鬱金香</a>
   					 		<a class="dropdown-item" href="product.jsp#daisy">雛菊</a>
  						</div>
		            </div>
				</li>
				<li class="nav-item">
					<a class="nav-link " href="about.jsp" style="color:black">關於我們</a>
				</li>
			</ul>
				<div class="container justify-content-end">
					<ul class="navbar-nav">
						<li  class="nav-item"><form class="form-inline" action="" accept-charset="utf-8">
							<input class="form-control" type="text" placeholder="Search">
							<button class="btn" type="submit"><img src="../image/search.png" alt="" class="search"></button>
						</form>
					</li>
					<li class="nav-item dropdown ">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"><button id="button"><img src="../image/member.png" alt=""></button></a>
						<div class="dropdown-menu">
							<%
						  if(session.getAttribute("account") == null ){
						   out.print("<button class='dropdown-item' href='' id='loginform'>登入</button><br>"); 
						  }
						  else{
						   out.print("<a href='../index.jsp' title='' class='dropdown-item'>登出</a><br>");
						  }
						  %>
						   <a href="profile.jsp" title="" class="dropdown-item">個人資訊</a><br>
						   <a href="orderrecord.jsp" title="" class="dropdown-item">訂購紀錄</a><br>
						   <a href="comment.jsp" title="" class="dropdown-item">評價紀錄</a><br>
						</div>
					</li>
					<li class="nav-item"><a href="cart/cart.jsp" title="" class="nav-link"><img src="../image/shopping.png" alt="" class="shopping"></a></li>
				</ul>
			</div>
		</nav>
		<div id="inputpsw" style="border:1px solid;">
			<form action="" method="Post" accept-charset="utf-8">
				帳號:<input type="text" name="account" placeholder=""><br><br>
				密碼:<input type="password" name="psw" placeholder=""><br>
				<button type="submit" class="confirm">確認</button>
				<a href="register.jsp" title="" class="res">註冊</a>
			</form>
		</div>
	</header>
	<section>
		<article>
				<div class="row text-center">
				<img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side">
				<div class="col-sm-12 text-center" id="title">
					<span class="our">關於我們</span>
				</div>
				
					<div class="col-sm-6 text-center">
					<div class="container-sm text-center" id="p">
    					<div class="flipBox">
        					<figure class="pic front"><img src="../image/kao.png" alt="" class="head"></figure>
       						<figure class="pic back">
       							資管二乙 <br> 10744252 <br> 高婕瑀 <br> 負責前端 <br>興趣愛好:看小說<br>
       							<a href="https://www.facebook.com/profile.php?id=100010007831022" title=""><img src="../image/fb.png" alt="" width="50px" height="50px"></a>
       							<a href="https://www.instagram.com/l_05_24/?hl=zh-tw" title=""><img src="../image/ig.png" alt="" width="50px" height="50px"></a>
       						</figure>
    					</div>
					</div>
					</div>
					<div class="col-sm-6 text-center">
						<div class="container-sm text-center" id="p">
							<div class="flipBox">
								<figure class="pic front"><img src="../image/qiu.jpg" alt="" class="head"></figure>
       							<figure class="pic back">
       								資管二乙 <br>10744272<br> 邱琬渝<br> 負責前端 <br>興趣愛好:閱讀,製作手工藝品<br>
       								<a href="https://www.facebook.com/wendyyow175" title=""><img src="../image/fb.png" alt="" width="50px" height="50px"></a>
       								<a href="https://www.instagram.com/fishball175/" title=""><img src="../image/ig.png" alt="" width="50px" height="50px"></a>
       							</figure>
							</div>
						</div>
					</div>
				</div><br>		
				<div class="row">
					<div class="col-sm-6 text-center">
							<div class="container-sm text-center" id="p">
								<div class="flipBox">
								<figure class="pic front"><img src="../image/lin.jpg" alt="" class="head"></figure>
       							<figure class="pic back">
       								資管二甲 <br>10744141 <br>林晏如<br> 負責後端<br>興趣愛好:<br> 聽音樂,和動物小孩玩<br>
       								<a href="https://www.facebook.com/profile.php?id=100004019807033" title=""><img src="../image/fb.png" alt="" width="50px" height="50px"></a>
       								<a href=" https://www.instagram.com/ru______sss/" title=""><img src="../image/ig.png" alt="" width="50px" height="50px"></a>
       							</figure>
							</div>
							</div>
						</div>
						<div class="col-sm-6 text-center">
							<div class="container-sm text-center" id="p">
								<div class="flipBox">
								<figure class="pic front"><img src="../image/van.jpg" alt="" class="head"></figure>
       							<figure class="pic back">
       								資管二甲<br> 10744146 <br>范欣媛<br> 負責後端<br>興趣愛好:聽音樂,觀察事物<br>
       								<a href="https://www.facebook.com/zootw147369/" title=""><img src="../image/fb.png" alt="" width="50px" height="50px"></a>
       								<a href="https://www.instagram.com/chloe_fan1004/?hl=zh-tw" title=""><img src="../image/ig.png" alt="" width="50px" height="50px"></a>
       							</figure>
							</div><br>
							</div>
						</div>
				<img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side"><img src="../image/side.png" alt="" class="side">
					</div>	
					<button type="button" id="BackTop" class="toTop-arrow" style="outline:none;"></button>
		</article>
	</section>
	<footer>
		<span class="copyright">Copyright © 2020 花的店. All rights reserved</span>
		<a href='https://pngtree.com/so/彩色花朵' class="pngtree">彩色花朵 png from pngtree.com</a>

	</footer>
	<script type="text/javascript" src="../js/top.js"></script>
	<script>
			$(function () { 
				$('#loginform').click(function (event) { 
					event.stopPropagation(); 
					$('#inputpsw').toggle('slow'); 
					return false;
				}); 
				$(document).click(function(event){
					var _con = $('#inputpsw'); 
					if(!_con.is(event.target) && _con.has(event.target).length === 0){ 
						$('#inputpsw').hide(1000); 
					}
				});
			})
		</script>
</body>
</html>