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
		<link rel="stylesheet" type="text/css" href="../../assets/main.css">
		<link rel="stylesheet" type="text/css" href="../../assets/bindex.css">
	</head>
<body>
	<header>
			<nav class="navbar navbar-expand-lg" >
				<a class="navbar-brand" href="../../index.jsp"><img src="../../image/logo.png" alt="" class="logo"><img src="../../image/name.png" alt="" class=fname></a>
				<div class="container justify-content-end">
					<ul class="navbar-nav">
						<li  class="nav-item"><form class="form-inline" action="" accept-charset="utf-8">
							<input class="form-control" type="text" placeholder="Search">
							<button class="btn" type="submit"><img src="../../image/search.png" alt="" class="search"></button>
						</form>
					</li>
					<li class="nav-item dropdown ">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"><button id="button"><img src="../../image/member.png" alt=""></button></a>
						<div class="dropdown-menu">
							<a href="borderrecord.jsp" title="" class="dropdown-item">訂購紀錄</a><br>
							<a href="../logout.jsp" title="" class="dropdown-item">登出</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<section>
	<div class="container">
			<div class="row">
			<form action="newPro.jsp" method="Post" accept-charset="utf-8" id="insert" name="form1"><!--新增產品-->
				<br>產品名稱: <input type="text" name="proName"><br><br>
				數量: <input type="text" name="stoNum"><br><br>
				價格: <input type="text" name="proPrice"><br><br>
				花語: <input type="text" name="note"><br><br>
				圖片: <input type="text" name="image"><br>&nbsp;
				<button type="submit" onclick="document.getElementById('insert').style.display='none'" class="sure" style="outline:none">確認</button>
				<button type="button" onclick="document.getElementById('insert').style.display='none'" class="cancel" style="outline:none">取消</button>
			</form>
			<form action="changePro.jsp" method="Post" accept-charset="utf-8" id="modify" name="form1"><!--修改產品-->
				產品名稱:<select name="proName">
					<%
			try {
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
						try {
							//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";

							Connection con=DriverManager.getConnection(url,"root","1234");   						
							if(con.isClosed())
								out.println("連線建立失敗");
							else
							{
								sql="USE class;";
								con.createStatement().execute(sql);
								sql = "SELECT * FROM products;";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print("<option value='"+rs.getInt("no")+"'>"+rs.getString("proName")+"</option>");
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
						</select><br><br>
				數量: <input type="text" name="stoNum"><br><br>
				價格: <input type="text" name="proPrice"><br>
				<button type="sumbit" onclick="document.getElementById('modify').style.display='none'" class="sure" style="outline:none">確認</button>
				<button type="button" onclick="document.getElementById('modify').style.display='none'" class="cancel" style="outline:none">取消</button>
			</form>
			
			<div class="col-sm-12 text-center">
			<button type="" id="insertbtn" onclick="document.getElementById('insert').style.display='block'">新增</button>
			<button type="" id="modifybtn" onclick="document.getElementById('modify').style.display='block'">修改</button><br><br>
			<form action="DelPro.jsp" method="Post" accept-charset="utf-8" name="form1"><!--刪除產品-->
			
	<%
			try {
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
						try {
							//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";

							Connection con=DriverManager.getConnection(url,"root","1234");   						
							if(con.isClosed())
								out.println("連線建立失敗");
							else
							{
								sql="USE class;";
								con.createStatement().execute(sql);
								sql = "SELECT `no`,proName,stoNum,proPrice FROM products;";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print("<div class='container-sm'>");
									out.print("<input type='checkbox' name='A' style='zoom:180%' id='check' value='"+rs.getInt("no")+"'>");
									out.print("產品名稱："+ rs.getString("proName"));
									out.print(" 數量："+ rs.getInt("stoNum"));
									out.print(" 小計：NT$"+ rs.getInt("proPrice"));
									out.print("</div><br>");
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

				<button type="submit" class="delete"><img src="../../image/delete.png" alt="" width="100px" height="100px"></button>
			</div>
			</form>		
	</div>	
	</div>
	
	<article>
		
	</article>
	</section>
	<footer>
		<span class="copyright">Copyright © 2020 花的店. All rights reserved</span>
	</footer>
</body>
</html>