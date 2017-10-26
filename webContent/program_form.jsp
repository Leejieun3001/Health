<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로그램 등록 화면</title>
</head>
<body>
	<center>
		<h2>프로그램 등록 하기</h2>
		<hr>

		[<a href=registerProgramControl_admin.jsp?action=list>상품목록으로</a>]
		<form name=form1 method=post action=registerProgramControl_admin.jsp>
			<input type=hidden name="action" value="insert">
			<table cellpadding=5 cellspacing=0 border="1">
				<tr>
					<td bgcolor="#FF9436">프로그램 이름</td>
					<td><input type="text" name="programname" size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#FF9436">내용 및 일정</td>
					<td><textarea rows="5" name="content" cols="40"></textarea></td>
				</tr>
				<tr>
					<td bgcolor="#FF9436">가격</td>
					<td><input type="text" name="price" size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#FF9436">담당 트레이너 이름</td>
					<td><input type="text" name="trainername" size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#FF9436">진행되는 센터 이름</td>
					<td><input type="text" name="centername" size="40"></td>
				</tr>


				<tr>
					<td colspan=2 align=center><input type=submit value="등록"><input
						type=reset value="취소"></td>
				</tr>
			</table>
		</form>

	</center>

</body>
</html>