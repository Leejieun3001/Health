<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.health.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
String userid =(String)session.getAttribute("userid");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		RegisterBean rb = new RegisterBean();
		ArrayList<Register> datas = rb.getRegisterList(userid);
	%>


	<center>
		<h2>§ 신청 완료 §</h2>
		<hr>

		<h5>
			<%=userid%>님, 그동안 등록하신 프로그램들 입니다. <br> 이용해주셔서 정말감사합니다
			:) <br> <br> [<a href="main.jsp">메인 화면으로</a>]
		</h5>


		<br> <br>
		<TABLE border='1' cellspacing=1 cellpadding=2 width='600'>
			<TR bgcolor='#00A2C9'>
				<TD align='center' width='100'>등록 id</TD>
				<TD align='center' width='100'>프로그램 id</TD>
				<TD align='center' width='100'>프로그램 이름</TD>	
				<TD align='center' width='110'>담당 트레이너분</TD>	
				<TD align='center' width='100'>등록날짜</TD>
			</TR>
			<%
				for (Register r : datas) {
					ProgramBean pb = new ProgramBean();
					Program p =pb.getprogram(r.getProgramid());
			%>
			<tr>
				<td><%=r.getRegisterid() %></td>
				<td><%=r.getProgramid() %></td>
				<td><%=p.getProgramname() %></td>
				<td><%=p.getTrainername() %></td>
				<td><%=r.getRedate() %></td>

			</tr>
			<%
				}
			%>
		</TABLE>
	</center>
</body>
</html>