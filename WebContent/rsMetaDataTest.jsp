<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
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
		String sql = "SELECT * FROM student";
		Connection conn = null;
		Context cxt = new InitialContext();

		DataSource ds = (DataSource) cxt
				.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("컬럼수 : " + rsmd.getColumnCount() + "<br><br>");

		for (int i = 1; i <= rsmd.getColumnCount(); i++) {
			out.println(i + "번째 컬럼명 : " + rsmd.getColumnName(i) + "<br>");
			out.println(i + "번째 컬럼 데이터 타입 : " + rsmd.getColumnTypeName(i)
					+ "<br><br>");

		}
	%>

</body>
</html>