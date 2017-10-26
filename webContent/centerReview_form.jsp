<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.health.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 작성 페이지</title>
</head>

<script type="text/javascript">
	function checkuser() {

	}
	function deletecheck() {

		ok = confirm("삭제하시겠습니까?");
		if (ok) {
			document.Reviewform.menu.value = 'delete'
			document.Reviewform.submit()
		} else {
			return;
		}
	}

	function insertcheck() {
		if (document.Reviewform.title.value == "") {
			alert("제목을 입력해 주세요.");
			document.Reviewform.title.focus();
			return;
		}
		if (document.Reviewform.content.value == "") {
			alert("내용을 입력해 주세요.");
			document.Reviewform.content.focus();
			return;
		}
		document.Reviewform.menu.value = 'insert'
		document.Reviewform.submit()
	}

	function updatecheck() {
		if (document.Reviewform.title.value == "") {
			alert("제목을 입력해 주세요.");
			document.Reviewform.title.focus();
			return;
		}
		if (document.Reviewform.content.value == "") {
			alert("내용를 입력해 주세요.");
			document.Reviewform.content.focus();
			return;
		}
		document.Reviewform.menu.value = 'update';
		document.Reviewform.submit();
	}
</script>

<%
	request.setCharacterEncoding("utf-8");
	String userid = (String) session.getAttribute("userid");
%>

<%
	int reviewid;
	String title = "";
	String reviewuserid = "";
	String centername = "";
	String content = "";
	String headline = "등록";

	String id = request.getParameter("reviewid");

	String nowuserid = (String) session.getAttribute("userid");
	request.setAttribute("reviewid", id);

	if (id != null) {
		//등록이 아닌 경우, 출력을 위해 선택한 게시의 각 필드 내용을 저장 
		int idnum = Integer.parseInt(id);

		ReviewBean revb = new ReviewBean();
		Review rev = revb.getReview(idnum);
		reviewid = rev.getReviewid();
		reviewuserid = rev.getUserid();
		title = rev.getTitle();
		centername = rev.getCenterName();
		content = rev.getContent();
		headline = "수정 삭제";

		System.out.println("if문 이전");
		System.out.println(reviewuserid);
		System.out.println(userid);
		if (!reviewuserid.equals((String) userid)) {
%>
<script>
	alert("본인이 작성한 글이 아닙니다! ");
	history.go(-1);
</script>
<%
	}
	}
%>





<body>
	<center>
		<h2>
			후기
			<%=headline%>
			페이지
		</h2>
		<h5>솔직한 후기 작성 부탁드립니다. 이용해주셔서 감사합니다 :)</h5>

		[ <a href=centerReviewControl.jsp?action=list>후기 게시판 으로</a>]
		<form name=Reviewform method=post action=centerReviewControl.jsp>

			<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
			<input type=hidden name="menu" value="insert">
			<!-- 수정 또는 삭제를 위한 게시 id를 hidden으로 전송 -->
			<input type=hidden name="reviewid" value=<%=id%>> <input
				type=hidden name="action" value="insert">
			<table cellpadding=5 cellspacing=0 border="1" >
				<tr>
					<td bgcolor="#CEF279">작성자id</td>
					<td><input type="hidden" name="userid" size="40"
						value="<%=userid%>"> <%=userid%></td>
				</tr>
				<tr>
					<td bgcolor="#CEF279">제목</td>
					<td><input type="text" value="<%=title%>" name="title"
						size="40"></td>
				</tr>
				<tr>
					<td bgcolor="#CEF279">헬스장 이름</td>
					<td><select name="centerName">
							<option>1호점</option>
							<option>2호점</option>
							<option>3호점</option>
					</select></td>
				</tr>
				<tr>
					<td bgcolor="#CEF279">내용</td>
					<td><textarea rows="5" name="content" cols="40"><%=content%></textarea></td>
				</tr>
				<tr>
					<td colspan=5 align=center>
						<%
							if (id == null) {
						%> <!-- 버튼을 누르면 boardform.js의 함수를 실행하여 processboard.jsp로 이동 --> <input
						type=button value="등록" onClick="insertcheck()"> <%
 	} else {
 %> <!-- 버튼을 누르면 boardform.js의 각 함수를 실행하여 processboard.jsp로 이동 --> <input
						type=button value="수정완료" onClick="updatecheck()"> <input
						type=button value="삭제" onClick="deletecheck()"> <%
 	}
 %> <!-- 목록보기 버튼은 listboard.jsp로 이동 --> <input type=button value="목록보기"
						onClick="location.href='centerReviewlist.jsp'"> <input
						type=reset value="취소">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>