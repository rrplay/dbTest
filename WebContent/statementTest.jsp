<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
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
		String sql = "insert into student(num, name) values (4,'황씨')";
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			if (result != 0) {
				out.print("등록ok");
			}
		} catch (Exception e) {
			out.print("등록 실패");
			e.printStackTrace();
		}
	%>

</body>
</html>