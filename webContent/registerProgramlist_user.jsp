<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, project.health.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	function check(programid) {
		document.location.href = "registerProgramControl_user.jsp?action=edit&programid="
				+ programid;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<%
		ProgramBean pb = new ProgramBean();
		ArrayList<Program> datas = pb.getProgramList();
	%>
	<center>
		
		<h2>§ 프로그램 신청하기 §</h2>

		<h5>
			회원 분 들께서는 추가로 진행되는 유료 프로그램을 신청 하실 수 있습니다<br> 진행되는 프로그램 강사분과  헬스장 지점을 잘 확인해 주세요! <br> 검색창을 통해서 강사별,지점별로 보실수 있습니다 ^^<br> 
		</h5>
		
		<hr>
		
			<form method="post" action="ProgramSearchlist_user.jsp">
			<select name="field">
				<option value="trainername" selected>담당 트레이너
				<option value="centername">센터명
			</select> <input type="text" name="string"> <input type="submit"
				value="검색">
		</form>

<br>
<br>
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
		
	
<br><a href="main.jsp">메인 화면으로 바로가기</a>

	</center>
</body>
</html>