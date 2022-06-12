<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="community.*" %>
    
<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="../css/normalize.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_style.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_nav.css">
    <link type="text/css" rel="stylesheet" href="../css/sub/write_style.css">
    <script src='../script/jquery.js'></script>

    <link rel="apple-touch-icon" sizes="57x57" href="../resource/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="../resource/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../resource/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../resource/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../resource/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../resource/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="../resource/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../resource/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="../resource/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="../resource/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../resource/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../resource/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../resource/favicon/favicon-16x16.png">

    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
<title>커뮤니 게시글 수정</title>
</head>
<body>
	<jsp:include page="/components/topbar.jsp"></jsp:include>
	<jsp:include page="/components/header.jsp"></jsp:include>
	
	<%
		int co_id = 0;
		if (request.getParameter("co_id") != null) {
			co_id = Integer.parseInt(request.getParameter("co_id"));
		}
		
		communityDTO notice = new communityDAO().getCommunity(co_id);
	%>
		
	<section class="notice_table">
        <h2>커뮤니티 (수정)</h2>
        <form name="form1" method="POST" action="${pageContext.request.contextPath}/web_control.jsp">
        <input type="hidden" name="action" value="community-update">
        <input type="hidden" name="co_id" value="<%= co_id %>">
            <ul>
                <li class="font_head">
                    <span>제목</span>
                    <span><input type="text" name="co_title" value="<%=notice.getCo_title() %>"></span>
                </li>
                <li class="notice_content">
                    <span>내용</span>
                    <span><textarea name="co_content"><%= notice.getCo_content() %></textarea></span>
                </li>
            </ul>
            <div class="write_notice">
                <input type="submit" value="게시글 등록">
            </div>
            <div class="move_notice">
                <a href="notice_list.jsp">목록</a>
            </div>
        </form>
    </section>
    
	<jsp:include page="/components/footer.jsp"></jsp:include>
</body>
</html>