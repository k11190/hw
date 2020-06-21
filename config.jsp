<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `class`;";
con.createStatement().execute(sql);
%>