<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="project.health.LoginBean" scope="page" />
<jsp:setProperty property="*" name="login" />
<html>

<%
		session.setAttribute("userid", request.getParameter("userid"));
		
	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login JSP</title>
</head>
<body>


<HR>
<% 
	if(!login.checkUser()) {
		out.println("로그인 실패 !!");	
	}
		else {
			
	
			session.setAttribute("userid", login.getUserid());
			response.sendRedirect("main.jsp");
		
		}
	%>

<HR>
사용자 아이디 : <jsp:getProperty name="login"  property="userid" /><BR>
사용자 패스워드 : <jsp:getProperty name="login" property="passwd" />

</div>
</BODY>
</HTML>
</body>
</html>