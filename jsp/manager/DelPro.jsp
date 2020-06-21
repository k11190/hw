<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<html>
    <head><title>刪除產品</title></head>
    <body>
    <%
	request.setCharacterEncoding("UTF-8");
		
		String select[] =request.getParameterValues("A");
		int count=0;
		int[] arr=new int[select.length];
		for(int i=0;i<select.length;i++){
			arr[i]=Integer.parseInt(select[i]);
		}
		
		
	try {
        	Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	count=select.length;
			String url="jdbc:mysql://localhost:3306/?serverTimezone=UTC";
			String sql="";
            Connection con=DriverManager.getConnection(url,"root","1234");   						
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				sql="USE class";
				con.createStatement().execute(sql); 
				
				for(int i=0;i<select.length;i++){
					sql="DELETE FROM products WHERE no="+arr[i];
					con.createStatement().execute(sql); 
				}
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