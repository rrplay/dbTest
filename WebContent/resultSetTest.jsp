<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sql = "SELECT num,name FROM student";
		Connection conn = null;
		Context cxt = new InitialContext();
		try{
		DataSource ds = (DataSource) cxt
				.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			out.println(rs.getInt(1) + " : " + rs.getString(2));

		}
		rs.close();}
		catch(Exception e){
			out.print("실패");
			e.printStackTrace();
		}
	%>
</body>
</html>