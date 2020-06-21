<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="assets/main.css">
		<link rel="stylesheet" type="text/css" href="assets/first.css">
	</head>
	<body>
	<% 
		try {
//Step 1: 載入資料庫驅動程式 
        	Class.forName("com.mysql.jdbc.Driver");	  
	//使用JDBC去連結MySQL，所以該行語法的意思，就是要告訴電腦我要使用JDBC
        try {
//Step 2: 建立連線 
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");   
		//建立connection(連線)的語法，url代表我所要連結的MySQL所在IP，root是帳號，1234是密碼
//Step 3: 選擇資料庫	        
           String sql="USE `class`";
           con.createStatement().execute(sql);		
//Step 5: 顯示結果 				
		   if(con.isClosed())
		//con.isClosed()會回傳True或是false來表示是否連線成功
              out.println("連線建立失敗");
//Step 6: 關閉連線
           con.close();
        }            
        catch (SQLException sExec) {
           out.println("SQL錯誤!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException err) {
          out.println("class錯誤" + err.toString());
    }    
%>
		<header>
			<nav class="navbar navbar-expand-lg" >
				<a class="navbar-brand" href="index.jsp"><img src="image/logo.png" alt="" class="logo"><img src="image/name.png" alt="" class=fname></a>
				<ul class="nav col-sm-5" id="menu">
				<li class="nav-item">
					<a class="nav-link" href="index.jsp" style="color:black">首頁</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="jsp/range.jsp" style="color:black">排行</a>
				</li>
				<li class="nav-item">
					<div class="dropdown">
  						<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    						產品類別
  						</button>
  						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    						<a class="dropdown-item" href="jsp/product.jsp#rose">玫瑰</a>
    						<a class="dropdown-item" href="jsp/product.jsp#lily">百合</a>
   					 		<a class="dropdown-item" href="jsp/product.jsp#tulip">鬱金香</a>
   					 		<a class="dropdown-item" href="jsp/product.jsp#daisy">雛菊</a>
  						</div>
		            </div>
				</li>
				<li class="nav-item">
					<a class="nav-link " href="jsp/about.jsp" style="color:black">關於我們</a>
				</li>
			</ul>
				<div class="container justify-content-end" width="700px">
					<ul class="navbar-nav">
						<li  class="nav-item"><form class="form-inline" action="" accept-charset="utf-8">
							<input class="form-control" type="text" placeholder="Search">
							<button class="btn" type="submit"><img src="image/search.png" alt="" class="search"></button>
						</form>
					</li>
					<li class="nav-item dropdown ">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"><button id="button"><img src="image/member.png" alt=""></button></a>
						<div class="dropdown-menu">
						<%
						if(session.getAttribute("account") == null ){
							out.print("<button class='dropdown-item' href='' id='loginform'>登入</button><br>");	
						}else{
							out.print("<a href='jsp/login/logout.jsp' title='' class='dropdown-item'>登出</a><br>");
						}
						%>	
							<a href="jsp/profile.jsp" title="" class="dropdown-item">個人資訊</a><br>
							<a href="jsp/orderrecord.jsp" title="" class="dropdown-item">訂購紀錄</a><br>
							<a href="jsp/comment.jsp" title="" class="dropdown-item">評價紀錄</a><br>
						</div>
					</li>
					<li class="nav-item"><a href="jsp/cart/cart.jsp" title="" class="nav-link"><img src="image/shopping.png" alt="" class="shopping"></a></li>
				</ul>
			</div>
		</nav>
		
		<div id="inputpsw" style="border:1px solid;">
			<form action="jsp/login/login.jsp" method="post" accept-charset="utf-8">
				帳號:<input type="text" name="account" placeholder=""><br><br>
				密碼:<input type="password" name="psw" placeholder=""><br>
				<button type="submit" class="confirm" style="border:0">確認</button>
				<a href="jsp/register.jsp" action="jsp/register.jsp" title="" class="res">註冊</a>
			</form>
		</div>
	</header>
	<section>


				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/picture.jpg" class="d-block w-100" alt="First slide" id="rowpic" height="400px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/act.png" alt="Second slide" height="400px">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



		<article>
		<div class="container">
			<div class="row">
			<div class="col-sm-12">
				<div class="row text-center">
					<div class="col-sm-6"><a href="jsp/product.jsp#rose" title="" style="color:black">
					<img src="image/rose.png" alt="" class="pict" id="pict"><span id="pn" style="border-style:outset;">玫瑰Rose</span></a></div>
					<div class="col-sm-6"><a href="jsp/product.jsp#lily" title="" style="color:black"><img src="image/lily.png" alt="" class="pict"><span id="pn" style="border-style:outset;">百合Lily</span></a></div><br>
					<div class="col-sm-6"><a href="jsp/product.jsp#tulip" title="" style="color:black">&nbsp;&nbsp;&nbsp;<img src="image/tulip.png" alt="" class="pict"><span id="pn" style="border-style:outset;">鬱金香Tulip</span></a></div>
					<div class="col-sm-6"><a href="jsp/product.jsp#daisy" title="" style="color:black">&nbsp;<img src="image/daisy.png" alt="" class="pict"><span id="pn" style="border-style:outset;">雛菊Daisy</span></a></div>		
			</div>
			</div>
		</div>
		</div>
		
			
			
			
			<button type="button" id="BackTop" class="toTop-arrow" style="outline:none;"></button>
		</article>
	</section>
	<footer>
	
<%
	try {
        Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";

            Connection con=DriverManager.getConnection(url,"root","1234");   						
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				int count=0;
				String sql="USE `class`;";
				ResultSet rs =  con.createStatement().executeQuery(sql);
				sql = "SELECT `count` FROM `count`" ; 
				rs = con.createStatement().executeQuery(sql);
				while(rs.next()){					
					count=rs.getInt("count");
				}		
				if(session.isNew()){
					count++;
				}
					sql = "UPDATE `count` SET `count`="+String.valueOf(count);
					con.createStatement().executeUpdate(sql);			
%>
		<span class="copyright">Copyright © 2020 花的店. All rights reserved</span><span class="people" name="count"><%out.print("瀏覽人數:"+count+"人");%></span>

<%
					con.close();		
				
			}   
		}
		catch (SQLException sExec) {
		   out.println("SQL錯誤!" + sExec.toString());
		}
	}       
	catch (ClassNotFoundException e) {
		out.println("class錯誤" + e.toString());
	}

			
%>


	</footer>

	<script type="text/javascript" src="js/top.js"></script>
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
			$('.carousel').carousel({
  				interval: 3000
			})
		</script>
</body>
</html>