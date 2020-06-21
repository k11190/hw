<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>花の店</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../assets/main.css">
		<link rel="stylesheet" type="text/css" href="../assets/product.css">
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
			<form action="login/login.jsp" method="Post" accept-charset="utf-8">
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
						<span class="col-12 text-center" id="A"><a name="rose"><div class="fl">玫瑰</div></a></span><br><br><br>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="1" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=1;"; 
									ResultSet rs =con.createStatement().executeQuery(sql);	
									rs.next();
									out.print(rs.getString("image")); %> " alt="" class="p1"><br><span class="name"><%
									out.print(rs.getString("proName")); %></span></button>
							</form>
						</div>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="2" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=2;"; 
									ResultSet rs2 =con.createStatement().executeQuery(sql);	
									rs2.next();
									out.print(rs2.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs2.getString("proName")); %></span></button>
							</form>
						</div>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="3" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=3;"; 
									ResultSet rs3 =con.createStatement().executeQuery(sql);	
									rs3.next();
									out.print(rs3.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs3.getString("proName")); %></span></button>
							</form>
						</div>
						<span class="col-12 text-center" id="A"><a name="lily"><div class="fl">百合</div></a></span><br><br><br>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="4" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=4;"; 
									ResultSet rs4 =con.createStatement().executeQuery(sql);	
									rs4.next();
									out.print(rs4.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs4.getString("proName")); %></span></button>
							</form>
						</div>
						<div class="col-sm-4">
						<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
							<input type="hidden" value="5" name="eachflower">
							<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=5;"; 
									ResultSet rs5 =con.createStatement().executeQuery(sql);	
									rs5.next();
									out.print(rs5.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs5.getString("proName")); %></span></button>	
							</form>
						</div>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="6" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=6;"; 
									ResultSet rs6 =con.createStatement().executeQuery(sql);	
									rs6.next();
									out.print(rs6.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs6.getString("proName")); %></span></button>
							</form>
						</div>
						<span class="col-12 text-center" id="A"><a name="tulip"><div class="fl">鬱金香</div></a></span><br><br><br>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="7" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=7;"; 
									ResultSet rs7 =con.createStatement().executeQuery(sql);	
									rs7.next();
									out.print(rs7.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs7.getString("proName")); %></span></button>
							</form>
						</div>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="8" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=8;"; 
									ResultSet rs8 =con.createStatement().executeQuery(sql);	
									rs8.next();
									out.print(rs8.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs8.getString("proName")); %></span></button>
							</form>
						</div>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="9" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=9;"; 
									ResultSet rs9 =con.createStatement().executeQuery(sql);	
									rs9.next();
									out.print(rs9.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs9.getString("proName")); %></span></button>
							</form>
						</div>
						<span class="col-12 text-center" id="A"><a name="daisy"><div class="fl">其他</div></a></span><br><br><br>
						<div class="col-sm-4">
							<form action="eachproduct.jsp" method="post" accept-charset="utf-8" class="productform">
								<input type="hidden" value="10" name="eachflower">
								<button type="submit" class="pbtn" style="outline:none"><img src="../<%
									sql = "SELECT * FROM products where no=10;"; 
									ResultSet rs10 =con.createStatement().executeQuery(sql);	
									rs10.next();
									out.print(rs10.getString("image")); %>" alt="" class="p1"><br><span class="name"><%
									out.print(rs10.getString("proName")); %></span></button>
							</form>
						</div>
					</div>
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