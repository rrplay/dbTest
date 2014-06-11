<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
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
		String sql = "INSERT INTO student(num, name) VALUES (?,'TEST')";
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql);

			for (int i = 5; i <= 10; i++) {
				pstmt.setInt(1, i);
				if (pstmt.executeUpdate() != 0) {
					out.println(i + "번 레코드 등록ok <br>");
				}
			}
		} catch (Exception e) {
			out.println("레코드 등록 실패 <br>");

		}
	%>
</body>
</html>