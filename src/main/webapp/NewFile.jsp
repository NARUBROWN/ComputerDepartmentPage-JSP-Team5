<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="mainPage.mainDAO" %>
 <%@ page import="notice.noticeDTO" %>
 <%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr><th>번호</th> <th>이름</th> <th>전화번호</th> <th>생일</th> <th>회사</th> <th>메모</th></tr>
	<%
	mainDAO maindao = new mainDAO();
	ArrayList<noticeDTO> lists = maindao.getMainPageNoticeList();
	out.print(lists.size());
	for(int i = 0; i < lists.size(); i++) {
	%>
	<tr> 
		<td><%=lists.get(i).getNo_title()%></td>
		<td><%=lists.get(i).getNo_author()%></td>
		<td><%=lists.get(i).getNo_content()%></td>
		<td><%=lists.get(i).getNo_date()%></td>
	</tr>
	<%
		}
	%>
</table>
	
	
</body>
</html>