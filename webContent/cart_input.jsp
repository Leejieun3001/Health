<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*, project.health.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>장바구니에 담기</title>
</head>
<jsp:useBean id="cart" class="project.health.Cart" scope="session" />
<jsp:useBean id="cb" class="project.health.CartBean" scope="session" />
<jsp:setProperty name="cart" property="*" />
<%

	String strCartid = (String) session.getAttribute("sesCart");
	String userid = (String) session.getAttribute("userid");

	//strCartid를 session id의 10자리까지로 지정한다.
	if (strCartid == "" || strCartid == null) {
		strCartid = session.getId().substring(0, 10);
	}

	//strCartid를 cart_id로 cart에 넣는다.
	cart.setCartid(strCartid);
	session.setAttribute("cartid", strCartid);

	cart.setUserid(userid);
	System.out.println(cart.getProgramid());
	System.out.println(cart.getCartid());

	if (!cb.checkCart(cart.getCartid(), cart.getProgramid())) {
%>
<script language=JavaScript>
	document.location.href = "cartControl.jsp?action=insert";
</script>
<%
	} else { //카트에 이미 상품이 있다.
		pageContext.forward("cartlist.jsp");
	}
%>

<body>
</body>
</html>