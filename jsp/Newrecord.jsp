<%@ page import = "java.sql.*, java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
	
<html>
    <head><title>加入訂單紀錄</title></head>
    <body>
    
	<%request.setCharacterEncoding("utf-8");
		
		String select[] =request.getParameterValues("check");
		int count=0;
		int[] arr=new int[select.length];
		for(int i=0;i<select.length;i++){
			arr[i]=Integer.parseInt(select[i]);
		}
		
		
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
					for(int i=0;i<select.length;i++){
					sql="USE class";
					con.createStatement().execute(sql);
					
					sql = "SELECT proName FROM products WHERE no="+arr[i]+";"; 
					ResultSet rs = con.createStatement().executeQuery(sql);  
					rs.next();
					String product=rs.getString("proName");
					
					sql = "SELECT * FROM shoppingcar WHERE no="+arr[i]+";"; 
					ResultSet rs2 =con.createStatement().executeQuery(sql);
					rs2.next();
					int subtotal=rs2.getInt("subtotal");
					int amount=rs2.getInt("amount");
					
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					String formattedDate = df.format(new java.util.Date());	
					
					sql = "SELECT * FROM `order`";
					ResultSet rs3 =con.createStatement().executeQuery(sql);
					rs3.last();
					int n =rs3.getRow();
					sql = "INSERT INTO `order`(orNum,userName,product,subtotal,amount,b_date) VALUES ('aa00"+(n+1)+"','"+session.getAttribute("account")+"','"+product+"',"+subtotal+","+amount+",'"+formattedDate+"');";
					con.createStatement().execute(sql); 
					
					sql="select * from products where no="+arr[i]+";"; 
					ResultSet rs4 =con.createStatement().executeQuery(sql);
					rs4.next();
					int quantity=rs4.getInt("stoNum");
					sql="Update `products` SET `stoNum`="+(quantity-amount)+" where `no`="+arr[i];
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
	response.sendRedirect("finish.jsp");
    %>
		
    </body>
</html>