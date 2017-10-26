<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, project.health.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

</script>
<body>

	<jsp:useBean id="revb" class="project.health.ReviewBean" scope="page" />
	<%
	
		
		//게시 목록을 위한 배열리스트를 자바빈즈를 이용하여 확보 
		ArrayList<Review> list = revb.getReviewList();
	%>
	<center>
		<h2>§ 헬스장 이용 후기 게시판 §</h2>

		<h5>
			회원 분들 께서 직접 남겨주신 후기 게시글 입니다<br> 각 지점의 헬스장 후기를 직접 작성 할 수 있고 열람 할
			수 있습니다. <br> 좋은 이용후기를 작성해 주시면 감사하겠습니다 :)
		</h5>
		<hr>
		<table border="3" bordercolor="#6B9900">

			<tr>
				<td bgcolor="#CEF279">번호</td>
				<td bgcolor="#CEF279">작성자 id</td>
				<td bgcolor="#CEF279">제목</td>
				<td bgcolor="#CEF279">센터 이름</td>
				<td bgcolor="#CEF279">작성일</td>
				<td bgcolor="#CEF279">내용</td>
			</tr>
			<%
				for (Review review : list) {
			%>
			<tr>

				<td><a
					href="centerReview_form.jsp?reviewid=<%=review.getReviewid()%>"><%=review.getReviewid()%></a></td>
				<td><%=review.getUserid()%></td>
				<td><%=review.getTitle()%></td>
				<td><%=review.getCenterName()%></td>
				<td><%=review.getRegdate()%></td>
				<td><%=review.getContent()%></td>

			</tr>
			<%
				}
			%>

		</table>
	</center>
	<hr>
	<center>
		<form name=form method=post action=centerReview_form.jsp>
			<input type=submit value="후기 등록 하러 가기!">
		</form>
		<br>
		[<a href="main.jsp">메인화면으로 바로가기</a>]
	</center>
</body>
</html>