<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../assets/main.css">
		<link rel="stylesheet" type="text/css" href="../assets/register.css">
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
						}else{
							out.print("<a href='logout.jsp' title='' class='dropdown-item'>登出</a><br>");
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
			<form action="login/login.jsp" method="post" accept-charset="utf-8">
				帳號:<input type="text" name="account" placeholder=""><br><br>
				密碼:<input type="password" name="psw" placeholder=""><br>
				<button type="submit" class="confirm">確認</button>
				<a href="register.jsp" title="" class="res">註冊</a>
			</form>
		</div>
	</header>
	<section>
		<div class="row">
			<div class="col-md-12">
				<div class="container-sm" style="display:block;">
				<span class="title">註冊</span>
					<form action="newUser.jsp" class="">
						<div class="row" width="600px">
							<div class="form-group col-sm-12">
								<label for="account">帳號:</label>
								<input type="text" class="form-control" id="uaccount" name="account" required>
							</div>
						</div>
						<div class="row" width="600px">
							<div class="form-group col-sm-12">
								<label for="psw">密碼:</label>
								<input type="password" class="form-control" id="upsw" name="psw" required>
							</div>
						</div>
						<div class="row" width="600px">
							<div class="form-group col-sm-12">
								<label for="name">姓名:</label>
								<input type="text" class="form-control" id="uname" name="name" required>
							</div>
						</div>
						<div class="row" width="600px">
							<div class="form-group col-sm-12">
								<label for="birthday">生日:</label>
								<input type="date" class="form-control" id="birthday" name="birth" required>
							</div>
						</div>
						<div class="row" width="600px">
							<div class="form-group col-sm-12">
								<label for="email">Email address:</label>
								<input type="email" class="form-control" placeholder="Enter email" id="email" name="mail">
							</div>
						</div>
						<div class="row" width="600px">
							<div class="form-group col-sm-12">
								<label for="phone">電話:</label>
								<input type="text" class="form-control" id="phone" name="phone">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 text-center">
								<button type="submit" class="btn"><img src="../image/send.png" alt="" width="100px" height="100px"></button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
		<br>
		<br>
		
	</article>
	<button type="button" id="BackTop" class="toTop-arrow" style="outline:none;"></button>
</section>
<footer>
	<span class="copyright">Copyright © 2020 花的店. All rights reserved</span>
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