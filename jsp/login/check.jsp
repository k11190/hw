<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

  
if(request.getParameter("account") !=null && request.getParameter("psw") != null){
      
    
    //sql = "SELECT * FROM member WHERE userName='" +request.getParameter("account") + 
	//      "'  AND psw='" + request.getParameter("psw") + "'"  ; 
    sql = "SELECT * FROM member WHERE userName=? AND psw=?";
	//' OR 1=1; #
	//out.println(sql);
	//out.close();//程式結束
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("account"));
    pstmt.setString(2,request.getParameter("psw"));
	
	ResultSet paperrs = pstmt.executeQuery();
	//ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next()){            
        session.setAttribute("account",request.getParameter("account"));
		con.close();//結束資料庫連結
        response.sendRedirect("../profile.jsp") ;
    }
    else{
        con.close();//結束資料庫連結
	    out.println("密碼帳號不符 !! <a href='../../index.jsp'>按此</a>重新登入") ;
	}
}

%>