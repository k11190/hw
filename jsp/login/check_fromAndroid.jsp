<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%  
if(request.getParameter("account") !=null && request.getParameter("psw") != null){
    //sql = "SELECT * FROM `lgoin` WHERE account='" +request.getParameter("account") + 
	//      "'  AND psw='" + request.getParameter("psw") + "'"  ; 
    sql = "SELECT * FROM login WHERE account=? AND psw=?";
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
        out.print("密碼帳號正確");
    }
    else
        out.print("密碼帳號不符 !!");
}
%>