
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.health.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="program" class="project.health.Program" />
<jsp:useBean id="pb" class="project.health.ProgramBean" />
<jsp:setProperty name="program" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//사용자 요청을 구분하기 위한 파라미터를 저장할 변수
		String action = request.getParameter("action");
		if (action.equals("list")) {
			response.sendRedirect("registerProgramlist_admin.jsp");
		}

		// 특정 상품 조회 요청인 경우
		else if (action.equals("edit")) {
			Program programs = pb.getprogram(program.getProgramid());
			request.setAttribute("programs", programs);
			pageContext.forward("registerProgram_user.jsp");
		}
		
		
	%>

</body>
</html>