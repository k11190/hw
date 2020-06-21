<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		<link rel="stylesheet" type="text/css" href="../assets/eachproduct.css">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg" >
				<a class="navbar-brand" href="../index.jsp" style="color:black;font-size:38px"><img src="../image/logo.png" alt="" class="logo"><img src="../image/name.png" alt="" class=fname></a>
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
				<div class="col-sm-6 text-right"><br><img src="../	
				<%
			try {
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
						try {
							//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";
							int no = Integer.parseInt(request.getParameter("eachflower"));
							Connection con=DriverManager.getConnection(url,"root","1234");   						
							if(con.isClosed())
								out.println("連線建立失敗");
							else
							{
								sql="USE class;";
								con.createStatement().execute(sql);
								sql = "SELECT image FROM products WHERE no="+no+";";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print(rs.getString("image"));
								} 
							}
							con.close();
							}
							
						catch (SQLException sExec) {
							out.println("SQL錯誤"+sExec.toString());
						}
					}
					catch (ClassNotFoundException err) {
						out.println("class錯誤"+err.toString());
					}
				
						
				%>" alt="" class="imgp"></div>
				<div class="col-sm-6 text-left pl-5">
				
				<form action="cart/Newcart.jsp" method="Post" accept-charset="utf-8" name="form1"><br>
					<b><%
			try {
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
						try {
							//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";
							int no = Integer.parseInt(request.getParameter("eachflower"));
							Connection con=DriverManager.getConnection(url,"root","1234");   						
							if(con.isClosed())
								out.println("連線建立失敗");
							else
							{
								sql="USE class;";
								con.createStatement().execute(sql);
								sql = "SELECT proName FROM products WHERE no="+no+";";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print(rs.getString("proName"));
								} 
							}
							con.close();
							}
							
						catch (SQLException sExec) {
							out.println("SQL錯誤"+sExec.toString());
						}
					}
					catch (ClassNotFoundException err) {
						out.println("class錯誤"+err.toString());
					}
				
						
				%><font size="4"></font></b><br><br>
					<input type="hidden" name="no" value="<%int no2 = Integer.parseInt(request.getParameter("eachflower"));out.print(no2);%>">
					數量:<input name="amount" type="number" min="1" value="1" style="zoom:60%; border-radius:20px; width:150px;outline:none;text-align: center" >株 <br><br>
					取貨日期:<input name="t_date" type="date" style="zoom:60%; border-radius:20px; outline:none;text-align: center" value="2020-05-01"><br>
					<button type="submit" class="add"><img src="../image/cart.png" alt="" width="110px" height="100px"></button>
					<font size="5"><b>庫存量:<%
			try {
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
						try {
							//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";
							int no = Integer.parseInt(request.getParameter("eachflower"));
							Connection con=DriverManager.getConnection(url,"root","1234");   						
							if(con.isClosed())
								out.println("連線建立失敗");
							else
							{
								sql="USE class;";
								con.createStatement().execute(sql);
								sql = "SELECT stoNum FROM products WHERE no="+no+";";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print(rs.getString("stoNum"));
								} 
							}
							con.close();
							}
							
						catch (SQLException sExec) {
							out.println("SQL錯誤"+sExec.toString());
						}
					}
					catch (ClassNotFoundException err) {
						out.println("class錯誤"+err.toString());
					}
				
						
				%></font></b>
				</form>
				</div><br>
				
				<div class="row" id="row2">
					<div class="col-sm-12 text-left"> <br>
					<div class="container-sm" id="explain">
						花語解讀&nbsp;:&nbsp;&nbsp;<%
			try {
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
						try {
							//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";
							int no = Integer.parseInt(request.getParameter("eachflower"));
							Connection con=DriverManager.getConnection(url,"root","1234");   						
							if(con.isClosed())
								out.println("連線建立失敗");
							else
							{
								sql="USE class;";
								con.createStatement().execute(sql);
								sql = "SELECT note FROM products WHERE no="+no+";";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print(rs.getString("note"));
								} 
							}
							con.close();
							}
							
						catch (SQLException sExec) {
							out.println("SQL錯誤"+sExec.toString());
						}
					}
					catch (ClassNotFoundException err) {
						out.println("class錯誤"+err.toString());
					}
				
						
				%>
				</div><hr width="95%">
				</div>

				<div class="col-sm-6 text-left"> 
					<div class="container-sm " id="point">
					<form action="add.jsp" method="post" accept-charset="utf-8">
					<input type="hidden" name="no" value="<%int no3 = Integer.parseInt(request.getParameter("eachflower"));out.print(no3);%>">
						<div class="container-sm" style="border:none; width:250px;padding:0;margin:0;">打分 :
    						<input type="radio" name="rdStar" value="1" id="item1" style="display:none"/><label for="item1">1</label>
    						<input type="radio" name="rdStar" value="2" id="item2" style="display:none"/><label for="item2">2</label>
    						<input type="radio" name="rdStar" value="3" id="item3" style="display:none"/><label for="item3">3</label>
    						<input type="radio" name="rdStar" value="4" id="item4" style="display:none"/><label for="item4">4</label>
    						<input type="radio" name="rdStar" value="5" id="item5" style="display:none"/><label for="item5">5</label>&nbsp;分
						</div>
						
						你的想法&nbsp;:&nbsp;&nbsp;<br><textarea name="comment"></textarea> <br>
						<button type="submit" class="send" style="outline:none;cursor:pointer">提交</button> <br>
					</form>
					</div>
				</div>
				<div class="col-sm-6 text-left"> 
					<div class="container-sm " id="comment">
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
			String sql="USE `class`";
			con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
			no3 = Integer.parseInt(request.getParameter("eachflower"));
			sql="SELECT * FROM `board` WHERE `no`='"+no3+"'";
			ResultSet rs=con.createStatement().executeQuery(sql);
			int bno=0;
			String score="",comment="";
			while(rs.next()){
				Object ob=session.getAttribute("account");
				String userName = ob.toString();
				score=rs.getString("score");
				comment=rs.getString("cmt");
%>
					Username :<%=userName%>  <br>
					評分&nbsp;:&nbsp;&nbsp;<%=score%> 分 <br>
					評論&nbsp;:&nbsp;&nbsp;<%=comment%> <hr>
<%
			}
//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤");
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤");
}
%>

					</div>
				</div>
				</div>		
			</div>
		</div>
			<button type="button" id="BackTop" class="toTop-arrow" style="outline:none;"></button>
		</article>
	</section>
	<footer>
		<span class="copyright">Copyright © 2020 花的店. All rights reserved</span>
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