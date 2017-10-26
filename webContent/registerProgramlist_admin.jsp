<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, project.health.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language=JavaScript>
	function check(programid) {
		document.location.href = "registerProgramControl_admin.jsp?action=edit&programid="
				+ programid;
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로그램 목록 화면</title>
</head>
<jsp:useBean id="login" class="project.health.LoginBean" scope="session" />
<%
	if (!session.getAttribute("userid").equals("admin")) {
%>
<script>
	alert("관리자가 아닙니다!!");
	history.go(-1);
</script>
<%
	}
%>
<body>
	<%
		ProgramBean pb = new ProgramBean();
		ArrayList<Program> datas = pb.getProgramList();
	%>
	<center>
		<h2>§ 프로그램 등록하기 §</h2>

		<h5>
			관리자 분 께서는 현재 진행되고 있는 프로그램을 등록해 주세요<br> 프로그램 정보를 잘 적어주시면 회원분들께 많은
			도움이 됩니다<br> 검색창을 통해서 강사별,지점별로 보실수 있습니다 ^^<br> [<a
				href="program_form.jsp">상품 등록 하기</a>]
		</h5>

		<hr>
		<form method="post" action="ProgramSearchlist_admin.jsp">
			<select name="field">
				<option value="trainername" selected>담당 트레이너
				<option value="centername">센터명
			</select> <input type="text" name="string"> <input type="submit"
				value="검색">
		</form>
		<form>
			<table cellpadding=5 cellspacing=0 border="1">
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
					<td><a href="javascript:check('<%=program.getProgramid()%>')"><%=program.getProgramname()%></a></td>
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
		<br> <a href="main.jsp">메인 화면으로 바로가기</a>


	</center>
</body>
</html>