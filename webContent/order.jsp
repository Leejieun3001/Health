<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.health.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 완료</title>
</head>
<body>
	<jsp:useBean id="login" class="project.health.LoginBean"
		scope="session" />
	<jsp:useBean id="order" class="project.health.Order_okBean"
		scope="session" />

	<center>
		<h2>§ 신청 완료 §</h2>
		<hr>

		<h5>
			<%=login.getUserid()%>님, 프로그램 등록이 완료되었습니다. <br> 이용해주셔서 정말감사합니다
			:) <br> <br> [<a href="main.jsp">메인 화면으로</a>]
		</h5>


		<%
			Order_okBean ob = new Order_okBean();
			List list = new ArrayList();
			list = ob.getOrderList();
		%>
		<br> <br>
		<TABLE border='1' cellspacing=0 cellpadding=5 width='600'>
			<TR bgcolor='#FFD6FF'>
				<TD align='center' width='100'>등록 ID</TD>
				<TD align='center' width='100'>프로그램 번호</TD>
				<TD align='center' width='100'>프로그램이름</TD>
			</TR>
			<%
				for (int i = 0; i < list.size();) {
			%>
			<tr>
				<td><%=list.get(i).toString()%></td>
				<%
					i++;
				%>
				<td><%=list.get(i).toString()%></td>
				<%
					i++;
				%>
				<td><%=list.get(i).toString()%></td>
				<%
					i++;
				%>
			</tr>
			<%
				}
			%>
		</TABLE>
	</center>
</body>
</html>