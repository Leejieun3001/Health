<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ID 중복 체크 검사</title>
</head>
<body>
<center>
<jsp:useBean id="mb" class="project.health.MemberBean"/>
<%
	if(request.getParameter("userid") != ""){
		if(mb.checkID(request.getParameter("userid"))){
%>
<%= request.getParameter("userid") %>는 사용 가능한 ID 입니다.

<%
		}
		else {
%>
중복된 ID가 존재합니다.<Br>
다른 ID를 사용해 주세요.
<%
		}
	}
	else{
%>
ID에 입력된 값이 없습니다. <br>
다시 한번 입력해주세요.
<%
	}
%>
</center>
</body>
</html>