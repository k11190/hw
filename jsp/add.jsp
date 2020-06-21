<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>

<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
		request.setCharacterEncoding("UTF-8");
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫  
				if(session.getAttribute("account") !=null){
					String sql="USE `class`";
					ResultSet rs = con.createStatement().executeQuery(sql);
					Object ob = session.getAttribute("account");
					String userName = ob.toString();
					String score=request.getParameter("rdStar");
					String comment=request.getParameter("comment");
					String no=request.getParameter("no");
					java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT INTO `board` (`userName`,`no`,`b_date`, `score`, `cmt`) VALUES ('"+userName+"','"+no+"','"+new_date+"','"+score+"','"+comment+"')";  

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("eachproduct.jsp?eachflower="+no);
				}
				else{
				out.print("留言失敗"+"<a href='../index.jsp'>按此</a>回首頁登入");
				con.close();//結束資料庫連結
			}
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
