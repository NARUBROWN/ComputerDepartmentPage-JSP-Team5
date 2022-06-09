<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 등록</title>
</head>
<body>
	<h1>커뮤니티 게시글 등록</h1>
	<br>
	
	<!-- user에 유저의 ID를 받아주세요 -->
		<% String user = "관리자"; 
		
		// 오늘 날짜 받는 부분
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String strdate = simpleDate.format(date);
		%>
		 
	<form name="form1" method="POST" action="web_control.jsp">
	<input type="hidden" name="action" value="commnuity-insert">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="co_title"></td>
			</tr>
			<tr>
			<!-- 이용자 ID 처리 -->
				<td><input type="hidden" name="co_author" value="<%=user%>"></td>
			</tr>
			<tr>
				<th>글 본문</th>
				<td><textarea placeholder="글 내용" name="co_content"></textarea></td>
			</tr>
			<tr>
				<!-- 오늘 날짜 처리 -->
				<td><input type="hidden" name="co_date" value="<%=strdate%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="저장"><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>