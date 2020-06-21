<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
    <head><title>新增產品</title></head>
    <body>
    
	<%request.setCharacterEncoding("UTF-8");	
	String proName = request.getParameter("proName");
	String stoNum = request.getParameter("stoNum");
	String proPrice = request.getParameter("proPrice");
	String image = request.getParameter("image");
	String note = request.getParameter("note");	
	try {
        	Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");  
			String sql;		
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				
				boolean a=true;
				sql="USE class";
				con.createStatement().execute(sql);
				sql="select * from products";
				ResultSet rs2 = con.createStatement().executeQuery(sql);
				while(rs2.next()){
					if(rs2.getString("proName").equals(proName)){
						out.println("已有此物");
						out.print("<a href='bindex.jsp'>按此前往後台</a>");
						a=false;
						
					}
					else{
						continue;
					}
				}
				if(a){
				sql = "SELECT `no`,proName,stoNum,proPrice FROM products;";
				ResultSet rs = con.createStatement().executeQuery(sql);        
				rs.last();
				int n=rs.getRow();
				out.println(n);
				sql="INSERT INTO products(`no`,proName,stoNum,proPrice,image,note) VALUES ("+(n+1)+",'"+proName+"',"+stoNum+","+proPrice+",'"+image+"','"+note+"')";
				con.createStatement().execute(sql);  
				response.sendRedirect("bindex.jsp");
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
    %>
		
    </body>
</html>