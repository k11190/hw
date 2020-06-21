<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@ page import ="java.sql.*"%>

<html>
    <head><title>刪除購物車</title></head>
    <body>

    <%	
		
		
	try {
        	Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	
			String url="jdbc:mysql://localhost:3306/?serverTimezone=UTC";
			String sql="";
            Connection con=DriverManager.getConnection(url,"root","1234");   						
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				sql="USE class";
				con.createStatement().execute(sql); 
				
		if(request.getParameterValues("A")!=null){		
		String select[] =request.getParameterValues("A");
		int count=0;
		int[] arr=new int[select.length];
		for(int i=0;i<select.length;i++){
			arr[i]=Integer.parseInt(select[i]);
		}
		count=select.length;
				for(int i=0;i<select.length;i++){
					sql="DELETE FROM shoppingcar WHERE no="+arr[i];
					con.createStatement().execute(sql); 
				}
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
		response.sendRedirect("cart.jsp");
    %>
    </body>
</html>
