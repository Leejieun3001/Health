<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = (String) session.getAttribute("userid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mb" class="project.health.MemberBean" />
	<jsp:useBean id="member" class="project.health.Member" />
	<jsp:setProperty name="member" property="*" />
	<%
		if (mb.deleteMember(userid)) {

			response.sendRedirect("login.html");
		} else {
			throw new Exception("DB 삭제 오류");
		}
	%>
</body>
</html>