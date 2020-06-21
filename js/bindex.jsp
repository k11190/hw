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
		<link rel="stylesheet" type="text/css" href="../assets/bindex.css">
	</head>
<body>
	<header>
			<nav class="navbar navbar-expand-lg" >
				<a class="navbar-brand" href="../index.html"><img src="../image/logo.png" alt="" class="logo"><img src="../image/name.png" alt="" class=fname></a>
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
							<a href="borderrecord.html" title="" class="dropdown-item">訂購紀錄</a><br>
							<a href="" title="" class="dropdown-item">登出</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<section>
	<div class="container">
			<div class="row">
			<form action="" method="get" accept-charset="utf-8" id="insert">
				<br>產品名稱: <input type="text" name="name"><br><br>
				數量: <input type="text" name="number"><br><br>
				價格: <input type="text" name="price"><br>&nbsp;
				<button type="submit" onclick="document.getElementById('modify').style.display='none'" class="sure" style="outline:none">確認</button>
				<button onclick="document.getElementById('modify').style.display='none'" class="cancel" style="outline:none">取消</button>
			</form>
			<form action="" method="get" accept-charset="utf-8" id="modify">
				產品名稱:<select name="name">
							<option value="">紅玫瑰</option>
							<option value="">藍玫瑰</option>
							<option value="">粉玫瑰</option>
							<option value="">白百合</option>
							<option value="">粉百合</option>
							<option value="">黃百合</option>
							<option value="">紅鬱金香</option>
							<option value="">粉鬱金香</option>
							<option value="">黃鬱金香</option>
							<option value="">雛菊</option>
						</select><br><br>
				數量: <input type="text" name="number"><br><br>
				價格: <input type="text" name="price"><br>
				<button type="sumbit" onclick="document.getElementById('modify').style.display='none'" class="sure" style="outline:none">確認</button>
				<button onclick="document.getElementById('modify').style.display='none'" class="cancel" style="outline:none">取消</button>
			</form>
			
			<div class="col-sm-12 text-center">
			<button type="" id="insertbtn" onclick="document.getElementById('insert').style.display='block'">新增</button>
			<button type="" id="modifybtn" onclick="document.getElementById('modify').style.display='block'">修改</button><br><br>
			<form action="" method="get" accept-charset="utf-8" name="form1">
				<div class="container-sm">
					<input type="checkbox" name="A" style="zoom:180%" id="check">產品名稱 數量:3 小計:NT$20
				</div><br>
				<div class="container-sm">
					<input type="checkbox" name="" style="zoom:180%" id="check">產品名稱  數量:3 小計:NT$20
				</div><br>
				<button type="submit" class="delete"><img src="../image/delete.png" alt="" width="100px" height="100px"></button>
			</div>
			</form>		
	</div>	
	</div>
	
	<article>
		
	</article>
	</section>
	<footer>
		<span class="copyright">Copyright © 2020 花的店. All rights reserved</span><span class="people">瀏覽人數:1000人</span>
	</footer>
</body>
</html>