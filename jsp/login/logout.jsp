<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
session.removeAttribute("account");
response.sendRedirect("../../index.jsp") ;
%>