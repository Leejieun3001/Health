<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,project.health.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선택 프로그램</title>
</head>
<body>
	<jsp:useBean id="program" class="project.health.Program" />
	<jsp:useBean id="pb" class="project.health.ProgramBean" />
	<jsp:setProperty name="program" property="*" />
	<%
		Program programs = pb.getprogram(program.getProgramid());
	%>

	<center>
		<h2>선택 상품</h2>
		<hr>
		[<a href="registerProgramlist_user.jsp">프로그램 목록으로</a>]
		<form name=form1 method="post" action="cart_input.jsp">
			<input type=hidden name="programid" value="<%=programs.getProgramid()%>" />
			<table cellpadding=5 cellspacing=0 border="1">
				<tr bgcolor="#C97CBF">
					<td>프로그램 아이디</td>
					<td>프로그램 이름</td>
					<td>내용 및 일정</td>
					<td>가격</td>
					<td>담당 트레이너 이름</td>
					<td>실행되는 센터 이름</td>
				</tr>

				<tr>
					<td><%=programs.getProgramid()%></td>
					<td><%=programs.getProgramname()%></td>
					<td><%=programs.getContent()%></td>
					<td><%=programs.getPrice()%></td>
					<td><%=programs.getTrainername()%></td>
					<td><%=programs.getCentername()%></td>
				</tr>
			
			</table>
			<br> 
			<input type="submit" value="장바구니에 담기" />
		</form>
		
</body>
</html>