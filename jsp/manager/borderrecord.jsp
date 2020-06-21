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
		<link rel="stylesheet" type="text/css" href="../../assets/borderrecord.css">
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
							<a href="bindex.jsp" title="" class="dropdown-item">後台首頁</a><br>
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
			<div class="col-sm-12 text-center">
				<p class="a"><br><span class="title">訂購紀錄</span></p><br>
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
								sql = "SELECT * FROM `order`;";  //查詢語句
								ResultSet rs=con.createStatement().executeQuery(sql); 
								while (rs.next()) {
									out.print("<div class='container-sm'>");
									out.print("<p><span class='uname'>"+rs.getString("userName")+":</span></p><br>");
									out.print(rs.getString("product")+" 數量:"+rs.getInt("amount")+" 總計:NT$"+rs.getInt("subtotal")+" 購買日期"+rs.getString("b_date"));
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
			</div>		
	</div>	
	</div>
	</section>
	<footer>
		<span class="copyright">Copyright © 2020 花的店. All rights reserved</span>
	</footer>
		<script>
		var Btn=document.getElementById("loginform");
		var oDiv=document.getElementById("inputpsw");
		Btn.onclick=function(e){                  //点击出现
			oDiv.style.display="block";
			e.stopPropagation();         //阻止冒泡
		}
		// 点击空白消失
		document.onclick=function(e){
			oDiv.style.display="none";
		}
	</script>
</body>
</html>