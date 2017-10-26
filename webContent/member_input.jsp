<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("utf-8");
%>
<title>회원가입</title>
</head>
<body>

		<script language="JavaScript">
		
		
		function isValid() {
			if (joinform.userid.value == "")
				alert('ID를 입력해주세요')				
			else if (joinform.passwd.value == "" || joinform.rpasswd.value == "")
				alert('패스워드를 입력해주세요')
			else if(joinform.passwd.value != joinform.rpasswd.value)
				alert('패스워드가 같지 않습니다.')
			else if(joinform.passwd.value.length < 6)
				alert('패스워드는 6자리 이상으로 입력해주세요')
			else if (joinform.centerName.value == "")
				alert('헬스장을 선택해 주세요')
			else if (joinform.name.value == "")
				alert('이름을 입력해주세요')
		  	else if(joinform.sex.value=="")
			  alert('성별을 입력해 주세요')
			 else if(joinform.phone.value == "")
				  alert('핸드폰 번호를 입력해 주세요')
			 else if(joinform.address.value == "")
					 alert('주소를 입력해 주세요')
			else if(joinform.email.value == "")
				alert('이메일을 입력해 주세요')
				else
				 document.joinform.submit()

		}
	
		function Check_id() {
		
				browsing_window = window
						.open(
								"checkid.jsp?userid=" + joinform.userid.value,
								"_idcheck",
								"height=100,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
				browsing_window.focus();
		
		}

	</script>


	<center>
		<H2 >My Health 회원가입</H2>
		<HR>
	</center>
	<form name=joinform method=post action="member_output.jsp">
		<table cellpadding=5 cellspacing=0 border="1" align="center">
			<tr>
				<td bgcolor="#B7F0B1">아이디</td>
				<td><input type="text" name="userid" size="20"> <input
					type="button" OnClick='Check_id()' value='ID 중복검사'></td>
			</tr>
			<tr>
				<td bgcolor="#B7F0B1">비밀번호</td>
				<td><input type="password" name="passwd" size="20"></td>
			</tr>
				<tr>
				<td bgcolor="#B7F0B1">비밀번호 재 입력</td>
				<td><input type="password" name="rpasswd" size="20"></td>
			</tr>
			<tr>
				<td bgcolor="#B7F0B1">헬스장 이름</td>
				<td><select name="centerName">
						<option selected>1호점</option>
						<option>2호점</option>
						<option>3호점</option>
				</select></td>
			</tr>
			
			<tr>
				<td bgcolor="#B7F0B1">이름</td>
				<td><input type="text" name="name" size="13"></td>
			
			</tr>
			<tr>
				<td bgcolor="#B7F0B1">생년월일</td>
				<td><input type="text" name="ssn" size="13"></td>
			</tr>
			<tr>
				<td bgcolor="#B7F0B1">성별</td>
				<td><input type="radio" name="sex" value="M">남 <input
					type="radio" name="sex" value="F">여</td>
			</tr>
			<tr>
				<td bgcolor="#B7F0B1">전화번호(- 없이 입력해 주세요)</td>
				<td><input type="text" name="phone" size="20"></td>
			</tr>

			<tr>
				<td bgcolor="#B7F0B1">주소</td>
				<td><input type="text" name="address" size="20"></td>
			</tr>
			<tr>
				<td bgcolor="#B7F0B1">email</td>
				<td><input type="text" name="email" size="20"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
				<input type="button"
					name="submit_join"  OnClick='isValid()' value="회원가입"> 
					<input type="reset"
					name="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<center>
		<a href="login.html">로그인 </a>
	</center>
</body>
</html>