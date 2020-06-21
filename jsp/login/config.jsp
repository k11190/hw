<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
</%
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
//Step 3: 選擇資料庫           
        sql="USE `class`";
        con.createStatement().execute(sql);

	}
	catch (SQLException sExec){
        out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err){
       out.println("class錯誤"+err.toString());
	}
%/>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `class`";
con.createStatement().execute(sql);
%>