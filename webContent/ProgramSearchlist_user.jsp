<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, project.health.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>§ 검색된 상품목록 리스트 §</h2>
		<hr>
		<%
			String strTitle = request.getParameter("field");
			String strCont = request.getParameter("string");

			ProgramBean pb = new ProgramBean();
			ArrayList<Program> datas = pb.getsearchProgramlist(strTitle, strCont);
		%>

		<form>
			<table cellpadding=5 cellspacing=0 border="1" >
				<tr bgcolor="#C97CBF">
					<td>프로그램 아이디</td>
					<td>프로그램 이름</td>
					<td>내용 및 일정</td>
					<td>가격</td>
					<td>담당 트레이너 이름</td>
					<td>실행되는 센터 이름</td>
				</tr>
				<%
					// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
					for (Program program : datas) {
				%>
				<tr>
					<td><%=program.getProgramid()%></td>
					<td><%=program.getProgramname()%></a></td>
					<td><%=program.getContent()%></td>
					<td><%=program.getPrice()%></td>
					<td><%=program.getTrainername()%></td>
					<td><%=program.getCentername()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
		<br>
		<form method="post" action="ProgramSearchlist_user.jsp">
			<select name="field">
				<option value="trainername" selected>담당 트레이너
				<option value="centername">센터명
			</select> <input type="text" name="string"> <input type="submit"
				value="검색">
		</form>
		<a href="registerProgramlist_user.jsp">상품 전체 목록으로 가기</a> <a
			href="main.jsp">메인 화면으로 바로가기</a>
	</center>

</body>
</html>