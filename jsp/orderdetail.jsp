<%@ page import = "java.sql.*, java.util.*,javax.servlet.*,java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

	

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>訂單明細</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../assets/main.css">
		<link rel="stylesheet" type="text/css" href="../assets/orderdetail.css">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-fixed-top" >
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
		<div class="row">
				<div class="col-sm-12" style="margin-top:20px;margin-bottom:20px">
				<div class="container-sm"><p class="title"><span>訂單明細</span></p>
			<%
				if(session.getAttribute("account") != null ){
		if(request.getParameterValues("A")!=null){
		String select[] =request.getParameterValues("A");
		int count=0;
		int[] arr=new int[select.length];
		for(int i=0;i<select.length;i++){
			arr[i]=Integer.parseInt(select[i]);
		}
		
					int sum=0;
				for(int i=0;i<select.length;i++){
					sql = "SELECT proName,proPrice FROM products WHERE no="+arr[i];
					ResultSet rs =con.createStatement().executeQuery(sql);
					rs.next();
					String product=rs.getString("proName");
					int proPrice=rs.getInt("proPrice");	
								
					sql = "SELECT * FROM shoppingcar WHERE no="+arr[i];
					ResultSet rs2 =con.createStatement().executeQuery(sql);
					
					
					
					while(rs2.next()){
						
						int a = Integer.parseInt(rs2.getString("amount"));
						
						out.print("產品名稱:<span class='ans'>"+rs2.getString("product")+"</span><br>");
						out.print("數量:<span class='ans'>"+rs2.getInt("amount")+"</span><br>");
						out.print("價格:<span class='ans'>NT$"+proPrice+"</span><br>");
						out.print("小計:<span class='ans'>NT$"+(a*proPrice)+"</span><br>");
						sum+=(a*proPrice);
						
					}	
					out.print("<hr>");
					}    
					out.print("總計:<span class='ans'>NT$"+sum+"</span><br>");
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					String formattedDate = df.format(new java.util.Date());					
					out.print("購買日期:<span class='ans'>"+formattedDate+"</span>");
					
				
		
%>		
					</div><br>
					<div class="col-sm-12 text-center">
						<form action="Newrecord.jsp" method="Post" accept-charset="utf-8" name="form1">
						<%
						for(int i=0;i<select.length;i++){
							out.print("<input type='checkbox' name='check' value='"+select[i]+"' checked='checked' /hidden>");	
						}
		}
				}	
						%>
							<button type="submit" class="sure" style="outline:none;"><img src="../image/send.png" alt="" width="100px" height="100px"></button>
							<a href="cart/cart.jsp"><img src="../image/cancel.png" alt="" width="104px" height="104px"></a>
						</form>
					</div>
				</div>		
				</div> 
			</div>
			<button type="button" id="BackTop" class="toTop-arrow" style="outline:none;"></button>
			</article>
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