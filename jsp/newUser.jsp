<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String account=request.getParameter("account");
	String psw=request.getParameter("psw");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String mail=request.getParameter("mail");
	String phone=request.getParameter("phone");
		
	try {
        	Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
			String sql="";
            Connection con=DriverManager.getConnection(url,"root","1234");   						
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				sql="USE `class`";
				con.createStatement().execute(sql);         
				sql="INSERT INTO `member`(userName,psw,name,birth,mail,phone) VALUES ('"+account+"','"+psw+"','"+name+"','"+birth+"','"+mail+"','"+phone+"')";
				con.createStatement().execute(sql);  
				con.close();
				out.print("註冊成功" +"<a href='../index.jsp'>按此</a>回首頁重新登入");
			}         
        }            
        catch (SQLException sExec) {
           out.println("SQL錯誤!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException e) {
          out.println("class錯誤" + e.toString());
    }
%>
