<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.health.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="review" class="project.health.Review" scope="page" />
<jsp:useBean id="rb" class="project.health.ReviewBean" scope="page" />

<body>
	<%
		//사용자 요청을 구분하기 위한 파라미터를 저장할 변수
		String action = request.getParameter("action");
		String menu = request.getParameter("menu");

		if (action.equals("list")) {
			response.sendRedirect("centerReviewlist.jsp");
		}
		// 상품 등록 요청인 경우
		else if (menu.equals("insert")) {
	%>

	<jsp:setProperty name="review" property="userid" />
	<jsp:setProperty name="review" property="title" />
	<jsp:setProperty name="review" property="centerName" />
	<jsp:setProperty name="review" property="content" />
	<%
		System.out.println(review.getUserid());
			System.out.println(review.getTitle());
			System.out.println(review.getCenterName());
			System.out.println(review.getContent());

			System.out.println(review.getTitle());
			if (rb.insertReview(review)) {

				response.sendRedirect("centerReviewlist.jsp");
			} else
				throw new Exception("DB 입력오류");
		}

		// 상품 수정 요청인 경우
		else if (menu.equals("edit")) {
			Review re = rb.getReview(review.getReviewid());
			request.setAttribute("review", re);
			pageContext.forward("centerReview_form.jsp");
		}
		// 상품 수정 처리인 경우
		else if (menu.equals("update")) {
	%>
	<jsp:setProperty name="review" property="reviewid" />
	<jsp:setProperty name="review" property="userid" />
	<jsp:setProperty name="review" property="title" />
	<jsp:setProperty name="review" property="centerName" />
	<jsp:setProperty name="review" property="content" />
	<%
		if (rb.updateReview(review)) {

				response.sendRedirect("centerReviewlist.jsp");
			} else {
				throw new Exception("DB 갱신오류");
			}
		}
		// 상품 삭체 요청인 경우
		else if (menu.equals("delete")) {
	%>
	<jsp:setProperty name="review" property="reviewid" />

	<%
		System.out.println(request.getAttribute("reviewid"));

			if (rb.deleteReview(review.getReviewid())) {

				response.sendRedirect("centerReviewlist.jsp");
			} else
				throw new Exception("DB 삭제 오류");
		}
	%>
</body>
</html>