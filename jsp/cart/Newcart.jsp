<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
	
<html>
    <head><title>加入購物車</title></head>
    <body>
    
	<%request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String t_date = request.getParameter("t_date");
		
		
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
				if(session.getAttribute("account") != null ){
				sql="USE class";
				con.createStatement().execute(sql);
				sql="select * from shoppingcar";
				ResultSet rs2 = con.createStatement().executeQuery(sql);  
				while(rs2.next()){
					if(no==rs2.getInt("no")){
						out.println("購物車已有此物");
						out.print("<a href='cart.jsp'>按此前往購物車</a>");
						a=false;
						break;
						
					}
					else{
						continue;
					}
				}
				if(a){
					sql = "SELECT proName,proPrice FROM products WHERE no="+no+";"; 
					ResultSet rs = con.createStatement().executeQuery(sql);  
					rs.next();
					int proPrice=rs.getInt("proPrice");
					String product=rs.getString("proName");
			   
					sql = "INSERT INTO shoppingcar(userName,`no`,product,amount,subtotal,t_date) VALUES ('"+session.getAttribute("account")+"',"+no+",'"+product+"',"+amount+","+(amount*proPrice)+",'"+t_date+"');";
					con.createStatement().execute(sql);  
					response.sendRedirect("cart.jsp");
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
	
    %>
		
    </body>
</html>