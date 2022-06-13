<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@page import="java.text.SimpleDateFormat"%>
    
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
    
    	<%
		
		String contentTypeName = "";
		String webcontrolPush = "";
		String contentType = "";
		
		if(request.getParameter("type").equals("notice")){
			contentTypeName = "공지사항";
			webcontrolPush = "notice-insert";
			contentType = "no";
			
		} else if(request.getParameter("type").equals("community")) {
			contentTypeName = "커뮤니티";
			webcontrolPush = "commnuity-insert";
			contentType = "co";
		}
	
	%>
	
<title><%= contentTypeName %> 게시글 등록</title>
</head>
<body>
	<jsp:include page="/components/topbar.jsp"></jsp:include>
	<jsp:include page="/components/header.jsp"></jsp:include>
	
	<!-- user에 유저의 ID를 받아주세요 -->
		<% String user = "관리자"; 
		
		// 오늘 날짜 받는 부분
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String strdate = simpleDate.format(date);
		%>
		
	<section class="notice_table">
        <h2><%= contentTypeName %> (글쓰기)</h2>
        <form name="form1" method="POST" action="${pageContext.request.contextPath}/web_control.jsp">
        <input type="hidden" name="action" value="<%= webcontrolPush %>">
            <ul>
                <li class="font_head">
                    <span>제목</span>
                    <span><input type="text" name="<%= contentType %>_title"></span>
                </li>
				<li>
					<!-- 이용자 ID 처리 -->
					<input type="hidden" name="<%= contentType %>_author" value="<%=user%>">
				</li>
                <li class="notice_content">
                    <span>내용</span>
                    <span><textarea name="<%= contentType %>_content"></textarea></span>
                </li>
                <li>
                	<!-- 오늘 날짜 처리 -->
                	<input type="hidden" name="<%= contentType %>_date" value="<%=strdate%>">
                </li>
            </ul>
            <div class="write_notice">
                <input type="submit" value="저장">
            </div>
            <div class="move_notice">
                <a href="#">목록</a>
            </div>
        </form>
    </section>
    
	<jsp:include page="/components/footer.jsp"></jsp:include>
		<script>
        $('body > header > nav > a:nth-child(1)').hover(function() {
            $('#dropdownNav1').fadeIn(200);
            $('#dropdownNav2, #dropdownNav3, #dropdownNav4' ).fadeOut(200);
        });
    
        $('body > header > nav > a:nth-child(2)').hover(function() {
            $('#dropdownNav2').fadeIn(200);
            $('#dropdownNav1, #dropdownNav3, #dropdownNav4').fadeOut(200);
        });
    
        $('body > header > nav > a:nth-child(3)').hover(function() {
            $('#dropdownNav3').fadeIn(200);
            $('#dropdownNav2, #dropdownNav1, #dropdownNav4').fadeOut(200);
        });
    
        $('body > header > nav > a:nth-child(4)').hover(function() {
            $('#dropdownNav4').fadeIn(200);
            $('#dropdownNav2, #dropdownNav3, #dropdownNav1').fadeOut(200);
        });
    
        $('#dropdownNav1, #dropdownNav2, #dropdownNav3, #dropdownNav4').bind('mouseleave', function(){
            $(this).fadeOut(200);
        });
    
        $('.top, .banner').hover(function() {
            $('#dropdownNav1, #dropdownNav2, #dropdownNav3, #dropdownNav4').fadeOut(200);
        });
    </script>
</body>
</html>