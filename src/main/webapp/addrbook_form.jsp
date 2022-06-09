<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 등록 화면</title>
</head>
<body>
	<h1>주소록 작성 화면</h1>
	<br>
	<a href="addrbook_list.jsp">주소록 목록으로</a>
	<br>
	
	<form name="form1" method="POST" action="addrbook_control.jsp">
	<input type="hidden" name="action" value="insert">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="no_title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="no_author"></td>
			</tr>
			<tr>
				<th>글 본문</th>
				<td><input type="text" name="no_content"></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="date" name="no_date"></td>
			</tr>
			<tr>
				<td><input type="submit" value="저장"><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>