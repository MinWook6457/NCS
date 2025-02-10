<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
<%
	String pId = "", pPw = "", cName = "", cEmail = "", cTel = "";
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>고객 관리 시스템</h2>
	<form name="insertfrm" id="insertfrm" method="post" action="insertUsr.jsp">
	<table border="1" cellspacing="1">
		<tr>
			<th width="100">아이디</th>
			<td width="200"><input type="text" name="pId" id="pId" maxlength="20" size="40" value="<%=pId%>"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pPw" id="pPw" maxlength="30" size="40" value="<%=pPw%>"></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="cName" id="cName" maxlength="30" size="40" value="<%=cName%>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="cEmail" id="cEmail" size="30" maxlength="50" value="<%=cEmail%>"> 
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="cTel" id="cTel" size="40" maxlength="11" value="<%=cTel%>"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="button" name="saveBtn" id="saveBtn" value="등록" onclick="clickSave();">
				<input type="button" name="selectBtn" id="selectBtn" value="조회" onclick="location.href='selectUsrInfo.jsp'">
			</td>
			
		</tr>
	</table>
	</form>
</body>
</html>

<script type="text/javascript">

function clickSave() {
	var frm = document.insertfrm;
		
	frm.submit();	
}


</script>