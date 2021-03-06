<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h2><b>홈쇼핑 회원 등록</b></h2><br>
	<form name="frm" method="post" action="action.jsp">
	<input type="hidden" name="mode" value="insert">
		<table>
		<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement stmt = null;
		String custno = "";
		
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "select max(custno)+1 as custno from member_tbl_02";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custno = rs.getString("custno");
		} catch(Exception e){
			e.printStackTrace();
		}
		%>
			<tr>
				<td>회원번호(자동발생)</td>
				<td class="tddd"><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td class="tddd"><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td class="tddd"><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td class="tddd"><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td class="tddd"><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP,B:일반,C:직원]</td>
				<td class="tddd"><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td class="tddd"><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="등록" onclick="return joinCheck()">
				<input type="button" value="조회" onclick="return search()">				
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
<script src="check.js"></script>
</html>