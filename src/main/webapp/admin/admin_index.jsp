<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <%@ page import="mainPage.*" %>
 <%@ page import="notice.*" %>
 <%@ page import="community.*" %>
 <%@ page import="user.*" %>
 <%@ page import="admin.*" %>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="java.io.PrintWriter" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <link type="text/css" rel="stylesheet" href="./css/normalize.css">
    <link type="text/css" rel="stylesheet" href="css/main/main_style.css">
    <link type="text/css" rel="stylesheet" href="css/main/main_nav.css">
    <link type="text/css" rel="stylesheet" href="css/main/main_banner.css">
    <script src='./script/jquery.js'></script>

    <link rel="apple-touch-icon" sizes="57x57" href="resource/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="resource/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="resource/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="resource/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="resource/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="resource/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="resource/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="resource/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="resource/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="resource/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="resource/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="resource/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="resource/favicon/favicon-16x16.png">

    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
    <title>인천재능대학교 컴퓨터정보과 관리자 페이지</title>
</head>
<body>
<script>
    $(window).on('load', function(){
        $(".loading").fadeOut(1000);
    });
</script>
<div class="loading"></div>

<jsp:include page="/components/admin_topbar.jsp"></jsp:include>
<jsp:include page="/components/admin_header.jsp"></jsp:include>
 
    <!--인트로 페이지-->
    <section class="intro">
        <aside>
            <div class="cardTitle">
                <a class="titleLeft">학과 공지사항</a>
                <a class="right" href="pages/notice_list.jsp">더보기 +</a>
            </div>
            <div class="titleArea">
                <table class="table_title">
                    <tbody>
                    <%
						mainDAO maintitle = new mainDAO();
						ArrayList<noticeDTO> title_lists = maintitle.getMainPageNoticeList();
						for(int i = 0; i < title_lists.size(); i++) {
					%>
                    <tr>
                        <th class="title-ellipsis"><a href="pages/view_content.jsp?id=<%=title_lists.get(i).getNo_id()%>&type=notice"><%=title_lists.get(i).getNo_title()%></a></th>
                    </tr>
                    <%
						}
					%>
                    </tbody>
                </table>
            </div>
            <div class="dateArea">
                <table>
                    <tbody>
                    <%
						for(int i = 0; i < title_lists.size(); i++) {
					%>
                    <tr>
                        <th><%=title_lists.get(i).getNo_date().replace("-", "/")%></th>
                    </tr>
                    <%
						}
					%>
                    </tbody>
                </table>
            </div>
        </aside>
        <aside>
            <div class="cardTitle">
                <a class="titleLeft">커뮤니티</a>
                <a class="right" href="pages/community_list.jsp">더보기 +</a>
            </div>
            <div class="titleArea">
                <table class="table_title">
                    <tbody>
                    <%
						ArrayList<communityDTO> date_lists = maintitle.getMainPagecommunityList();
						for(int i = 0; i < date_lists.size(); i++) {
					%>
                    <tr>
                        <th class="title-ellipsis"><a href="pages/view_content.jsp?id=<%=date_lists.get(i).getCo_id()%>&type=community"><%=date_lists.get(i).getCo_title()%></a></th>
                    </tr>
                    <%
						}
					%>
                    </tbody>
                </table>
            </div>
            <div class="dateArea">
                <table>
                    <tbody>
                    <%
						for(int i = 0; i < date_lists.size(); i++) {
					%>
                    <tr>
                        <th><%=date_lists.get(i).getCo_date().replace("-", "/")%></th>
                    </tr>
                    <%
						}
					%>
                    </tbody>
                </table>
            </div>
        </aside>
        <aside>
            <div class="cardTitle">
                <a class="titleLeft">회원정보</a>
                <a class="right" href="pages/list.jsp?type=member">더보기 +</a>
            </div>
            <div class="titleArea">
                <table class="table_title">
                    <tbody>
                    <%
                    	adminDAO admindao = new adminDAO();
						ArrayList<UserDTO> memberlist = admindao.getAdminPageMemberList();
						for(int i = 0; i < memberlist.size(); i++) {
					%>
                    <tr>
                        <th class="title-ellipsis"><a href="pages/view_content.jsp?id=<%=memberlist.get(i).getUserRow()%>&type=community"><%=memberlist.get(i).getUserName()%></a></th>
                    </tr>
                    <%
						}
					%>
                    </tbody>
                </table>
            </div>
            <div class="dateArea">
                <table>
                    <tbody>
                    <%
						for(int i = 0; i < memberlist.size(); i++) {
					%>
                    <tr>
                        <th><%=memberlist.get(i).getUserAuth()%></th>
                    </tr>
                    <%
						}
					%>
                    </tbody>
                </table>
            </div>
        </aside>
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