<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<%
	if(request.getParameter("account") != null && request.getParameter("psw") != null){
		request.setCharacterEncoding("utf-8");
		String manid =new String(request.getParameter("account").getBytes("ISO-8859-1"),"utf-8");
		String manpsw =new String(request.getParameter("psw"));
		if(manid.equals("manager") && manpsw.equals("1234")){
			out.print("<a href='../manager/bindex.jsp'>管理者登入</a>");
		}
		else{
			sql = "SELECT * FROM `member` WHERE `userName`='" +request.getParameter("account")+"' and `psw` = '" + request.getParameter("psw") + "' ;"; 
			ResultSet rs =con.createStatement().executeQuery(sql);
			if(rs.next()){
				session.setAttribute("account", request.getParameter("account"));
				con.close();
				out.print("登入成功" +"<a href='../profile.jsp'>按此</a>到會員基本資料");
			}
			else{
				out.print("登入失敗"+"<a href='../../index.jsp'>按此</a>回首頁");
				con.close();//結束資料庫連結
			}
		}
	}
	else{
		out.print("<h1>登入失敗</h1>"+"<a href='../../index.jsp'>按此</a>回首頁");
	con.close();//結束資料庫連結
	}
%>
