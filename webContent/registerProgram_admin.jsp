<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*, project.health.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	// 삭제 확인을 위한 자바스크립트
	function delcheck() {
		// 메시지 창을 통해 YES/NO 확인
		result = confirm("정말로 삭제하시겠습니까 ?");
		if (result == true) {
			document.form1.action.value = "delete";
			document.form1.submit();
		} else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>상품 수정, 삭제</title>
</head>
<%
	Program program = (Program) request.getAttribute("programs");
%>
<body>
	<center>
		<h2>상품 수정,삭제</h2>
		<hr>
		[<a href=registerProgramControl_admin.jsp?action=list>상품목록으로</a>]
		<form name=form1 method=post action=registerProgramControl_admin.jsp>
			<input type=hidden name="programid"
				value="<%=program.getProgramid()%>"> <input type=hidden
				name="action" value="update">
			<table cellpadding=5 cellspacing=0 border="1">

				<tr>
					<td bgcolor="#C97CBF">프로그램 이름</td>
					<td><input type="text" name="programname" value="<%=program.getProgramname()%>" size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#C97CBF">내용 및 일정</td>
					<td><textarea rows="5" name="content" cols="40"><%=program.getContent()%></textarea></td>
				</tr>
				<tr>
					<td bgcolor="#C97CBF">가격</td>
					<td><input type="text" name="price" value="<%=program.getPrice()%>" size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#C97CBF">담당 트레이너 이름</td>
					<td><input type="text" name="trainername" value="<%=program.getTrainername()%>"  size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#C97CBF">진행되는 센터 이름</td>
					<td><input type="text" name="centername" value="<%=program.getCentername()%>"  size="40"></td>
				</tr>


			
				<tr>
					<td colspan=2 align=center><input type=submit value="저장"><input
						type=reset value="취소"><input type="button" value="삭제"
						onClick="delcheck()"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>