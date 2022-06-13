<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="notice.*" %>
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
	<%
		
	int id = 0;
	if(request.getParameter("id") != null){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	if(id == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
	}
	
	String mainTitle = "";
	String title = "";
	String author = "";
	String date = "";
	String content = "";
	String parameter = "";
	String query = "";
	String pushType = "";
	String type = "";
	
	if(request.getParameter("type").equals("notice")){
		noticeDTO notice = new noticeDAO().getNotice(id);
		title = notice.getNo_title();
		author = notice.getNo_author();
		date = notice.getNo_date();
		content = notice.getNo_content();
		mainTitle ="공지사항";
		parameter = "notice-update";
		query = "notice_content_update_form.jsp?no_id=";
		pushType = "no";
		type = "notice";
		
	} else if(request.getParameter("type").equals("community")) {
		communityDTO community = new communityDAO().getCommunity(id);
		title = community.getCo_title();
		author = community.getCo_author();
		date = community.getCo_date();
		content = community.getCo_content();
		mainTitle = "커뮤니티";
		parameter = "community-update";
		query = "community_content_update_form.jsp?co_id=";
		pushType = "co";
		type = "community";
	}
	
	%>
<title><%= mainTitle %> 게시글 수정</title>
</head>
<body>
	<jsp:include page="/components/topbar.jsp"></jsp:include>
	<jsp:include page="/components/header.jsp"></jsp:include>
		
	<section class="notice_table">
        <h2><%= mainTitle %> (수정)</h2>
        <form name="form1" method="POST" action="${pageContext.request.contextPath}/web_control.jsp">
        <input type="hidden" name="action" value="<%= parameter %>">
        <input type="hidden" name="<%= pushType %>_id" value="<%= id %>">
            <ul>
                <li class="font_head">
                    <span>제목</span>
                    <span><input type="text" name="<%= pushType %>_title" value="<%= title %>"></span>
                </li>
                <li class="notice_content">
                    <span>내용</span>
                    <span><textarea name="<%= pushType %>_content"><%= content %></textarea></span>
                </li>
            </ul>
            <div class="write_notice">
                <input type="submit" value="게시글 등록">
            </div>
            <div class="move_notice">
                <a href="<%= type %>_list.jsp">목록</a>
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