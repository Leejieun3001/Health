<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.health.*, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="cart" class="project.health.Cart" scope="session" />
	<jsp:useBean id="cb" class="project.health.CartBean" scope="session" />
	<jsp:setProperty name="cart" property="*" />
	<jsp:useBean id="login" class="project.health.LoginBean"
		scope="session" />


	<%
		String action = request.getParameter("action");
		String user_id = (String) session.getAttribute("userid");
		login.setUserid(user_id);

		//장바구니에 추가
		if (action.equals("insert")) {
			if (cb.insertCart(cart)) {
				pageContext.forward("cartlist.jsp");
			} else
				throw new Exception("DB 입력오류");
		} else if (action.equals("delete")) {
			if (cb.deleteCartP(cart)) {
				pageContext.forward("cartlist.jsp");
			} else
				throw new Exception("DB 삭제오류");
		} else if (action.equals("order")) {

			String userid = login.getUserid();
			String cartid = (String) session.getAttribute("cartid");
			System.out.println(cartid);
			//구매 리스트 가져오기.
			ArrayList<String> register_list = (ArrayList<String>) session.getAttribute("register_list");
			ArrayList<Cart> carts = cb.getCartList(cartid);
			System.out.println(carts.size());
			//order_user에 회원 정보 입력, 구매 리스트 저장
			if (cb.insertRegister(carts, register_list)) {

				//카트 삭제
				if (cb.deleteCart(cart)) {
					pageContext.forward("order.jsp");
				} else
					throw new Exception("DB 삭제오류");
			} else
				throw new Exception("DB 입력오류");
		} else {
			out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
		}
	%>
</body>
</html>