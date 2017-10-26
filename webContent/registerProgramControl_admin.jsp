
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

		// 상품 목록 요청인 경우
		if (action.equals("list")) {
			response.sendRedirect("registerProgramlist_admin.jsp");
		}
		// 상품 등록 요청인 경우
		else if (action.equals("insert")) {

			if (pb.insertProgram(program)) {
				response.sendRedirect("registerProgramlist_admin.jsp");
			} else
				throw new Exception("DB 입력오류");
		}
		// 상품 수정 요청인 경우
		else if (action.equals("edit")) {
			System.out.println(program.getProgramid());

			Program programs = pb.getprogram(program.getProgramid());

			request.setAttribute("programs", programs);
			pageContext.forward("registerProgram_admin.jsp");
		}
		// 상품 수정 처리인 경우
		else if (action.equals("update")) {
			if (pb.updateProgram(program)) {
				response.sendRedirect("registerProgramlist_admin.jsp");
			} else
				throw new Exception("DB 갱신오류");
		}
		// 상품 삭체 요청인 경우
		else if (action.equals("delete")) {
			if (pb.deleteProgram(program.getProgramid())) {
				response.sendRedirect("registerProgramlist_admin.jsp");
			} else
				throw new Exception("DB 삭제 오류");
		}
	%>
</body>
</html>