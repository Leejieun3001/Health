<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제</title>
</head>
<body>
	<%--This is made by Lee Ji Eun --%>
	<%--date:  2016. 11. 1.  --%>


	<center>
		<h1>§ 헬스장 이용 홈페이지§</h1>

		<h5>
			각 지점별 헬스장 후기를 확인 하실수 있으며, <br>지점별로 운영되는 추가 유료프로그램을 신청하실 수 있는
			웹페이지 입니다. <br>많은 이용부탁드립니다 :)
		</h5>
		<hr>
		<h2>Menu</h2>

		<a href=centerReviewlist.jsp>헬스장 별 후기</a> <br> <br> <a
			href=registerProgramlist_user.jsp>프로그램 신청하기</a> <br> <br> <a
			href=checkProgram.jsp>내가 신청한 프로그램 확인</a> <br> <br> <a
			href=member_delete.jsp>회원 탈퇴하기</a> <br> <br>


		<%
			if (session.getAttribute("userid").equals("admin")) {
		%>
		<a href=registerProgramlist_admin.jsp>프로그램 등록하기</a> <br> <br>

		<%
			}
		%>

		<hr>
		<a href=login.html>로그인 화면으로 가기</a>



	</center>
</body>
</html>