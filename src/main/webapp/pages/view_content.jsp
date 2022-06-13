<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="notice.*" %>
    <%@ page import="community.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link type="text/css" rel="stylesheet" href="../css/normalize.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_style.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_nav.css">
    <link type="text/css" rel="stylesheet" href="../css/sub/notice_main_style.css">
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
	
	<%
	
		int id = 0;
		if(request.getParameter("id") != null){
			id = Integer.parseInt(request.getParameter("id"));
		}
		
		// userName 확인;
		String user = (String)session.getAttribute("userName");

		
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
		String type = "";
		String typeName = "";
		
		if(request.getParameter("type").equals("notice")){
			noticeDTO notice = new noticeDAO().getNotice(id);
			title = notice.getNo_title();
			author = notice.getNo_author();
			date = notice.getNo_date();
			content = notice.getNo_content();
			mainTitle ="공지사항";
			parameter = "no-delete";
			query = "update.jsp?id=";
			type = "&type=notice";
			typeName = "notice";
			
			
		} else if(request.getParameter("type").equals("community")) {
			communityDTO community = new communityDAO().getCommunity(id);
			title = community.getCo_title();
			author = community.getCo_author();
			date = community.getCo_date();
			content = community.getCo_content();
			mainTitle = "커뮤니티";
			parameter = "co-delete";
			query = "update.jsp?id=";
			type = "&type=community";
			typeName = "community";
		}
		
	%>
	
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
    <title><%= mainTitle + " : " + title %></title>
</head>
<body>

    <!-- topBar와 header -->
    <jsp:include page="/components/topbarAction.jsp"></jsp:include>
	
	
    <section class="notice_table">
        <h2><%= mainTitle %></h2>
        <ul>
            <li class="font_head">
                <h3><%= title %></h3>
            </li>
            <li class="notice_writer">
                <span>작성자 : <%= author %></span>
                <span>작성일 : <%= date %></span>
            </li>
            <li class="notice_content">
                <img src="./">
                <%= content %>
            </li>
        </ul>
        
        <% 
     		// 현재 권한 가져오기
			String Auth = (String) session.getAttribute("userAuth");
        	
        	// type이 공지사항 경우
        	if(typeName.equals("notice")){
        		// staff일 경우
        		if(user == null || Auth.equals("student")) { %>
				 <!--  user에 로그인 정보가 없거나 학생이면 버튼이 안 보임 -->
        		<% } else if(Auth.equals("staff"))  { %>			
        		<div class="write_notice">
            		<a href="<%= query + id + type %>">수정</a>
        		</div>
            	<div class="write_notice">
            		<a href="${pageContext.request.contextPath}/web_control.jsp?action=<%= parameter %>&id=<%= id %>">삭제</a>
        		</div>	
        		<% }
        		
        		// type이 커뮤니티일 경우
        	} else if (typeName.equals("community")) {
        		if(user == null){ %>		
        		<% } else if(user.equals(author) ||  Auth.equals("staff")){ %>
        		<div class="write_notice">
            		<a href="<%= query + id + type %>">수정</a>
        		</div>
            	<div class="write_notice">
            		<a href="${pageContext.request.contextPath}/web_control.jsp?action=<%= parameter %>&id=<%= id %>">삭제</a>
        		</div>
        		
        		<% }
        	
        	}
        %>
        
        <div class="move_notice">
            <a href="javascript:window.history.back();">목록</a>
        </div>
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