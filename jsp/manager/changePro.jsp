<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<html>
    <head><title>更改產品</title></head>
    <body>
    <%
	request.setCharacterEncoding("UTF-8");
		
		int proName = Integer.parseInt(request.getParameter("proName"));
		int stoNum = Integer.parseInt(request.getParameter("stoNum"));
		int proPrice = Integer.parseInt(request.getParameter("proPrice"));
		
		
	try {
        	Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");  
			String sql="use class";
			con.createStatement().execute(sql);			
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				sql="UPDATE products SET proPrice="+proPrice+",stoNum="+stoNum+" WHERE no="+proName;
				con.createStatement().execute(sql);  
			}
		   
           con.close();
        }            
        catch (SQLException sExec) {
           out.println("SQL錯誤!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException e) {
          out.println("class錯誤" + e.toString());
    }
		response.sendRedirect("bindex.jsp");
    %>
    </body>
</html>