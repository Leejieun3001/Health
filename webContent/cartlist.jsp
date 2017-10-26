<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, project.health.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String cartid = (String) session.getAttribute("cartid");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 리스트</title>
</head>
<script language=JavaScript>
	function check(programid) {
		document.location.href = "cartControl.jsp?action=delete&programid=" + programid;
	}
	function order() {
		document.location.href = "cartControl.jsp?action=order";
	}
</script>
<body>
	<center>

		<h2> § 내 장바구니 § </h2>
		
		<hr>
		[<a href="registerProgramlist_user.jsp">상품 목록으로(장바구니 추가 담기)</a>] <br>
		<br>
		<table cellpadding=5 cellspacing=0 border="1"  width='600'>
			<TR bgcolor='#FFD6FF'>
				<TD align='center' width='250'>프로그램 ID</TD>
				<TD align='center' width='250'>프로그램 이름</TD>
				<TD align='center' width='700'>프로그램 내용</TD>
				<TD align='center' width='100'>프로그램 가격</TD>

				<TD align='center' width='200'>삭제</TD>
			</TR>
			<%
				CartBean cb = new CartBean();
				ArrayList<Cart> datas = cb.getCartList((String) session.getAttribute("cartid"));
				ProgramBean pb = new ProgramBean();

				ArrayList<String> register_list = new ArrayList<String>();
				int intSum = 0;

				for (Cart cart : datas) {
					Program program = pb.getprogram(cart.getProgramid());
					int intPSum = program.getPrice();
					intSum = intSum + intPSum;
			%>
			<tr>
				<td><%=cart.getProgramid()%></td>
				<td><%=program.getProgramname()%></td>
				<td><%=program.getContent()%></td>
				<td><%=program.getPrice()%>
				<td><a href="javascript:check('<%=cart.getProgramid()%>')">수정/삭제</a></td>
			</tr>

			<%		    register_list.add(Integer.toString(program.getProgramid()));
				    register_list.add(program.getProgramname());
					//order_list.add(Integer.toString(cart.getAmount()));
					//order_list.add(good.getTitle());
					//order_list.add(Integer.toString(good.getPrice()));

					//order_list.add(Integer.toString(intPSum));

				}

				//cart에 있는 품목들만 session 속성인 "order_list"에 저장
				session.setAttribute("register_list", register_list);
			%>

		</TABLE>
		<br> #총액 :
		<%=intSum%>
		<br> <br> <a href="javascript:order()">최종 구매하기</a>
	</center>
</body>
</html>