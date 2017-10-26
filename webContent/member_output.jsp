<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	request.setCharacterEncoding("utf-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mb" class="project.health.MemberBean" />
	<jsp:useBean id="member" class="project.health.Member" />
	<jsp:setProperty name="member" property="*" />
	<%
		
		if (mb.checkID(request.getParameter("userid"))) {
			if (mb.insertMember(member)) {
			
				response.sendRedirect("login.html");
			} else {throw new Exception("DB 입력 오류");}
		} else {
	%>
	<script>
		alert("중복된 ID가 있습니다!!");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>