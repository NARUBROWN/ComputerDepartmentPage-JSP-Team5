<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <%@ page import="mainPage.mainDAO" %>
 <%@ page import="notice.noticeDTO" %>
 <%@ page import="community.communityDTO" %>
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
    <title>????????????????????? ??????????????????</title>
</head>
<body>
<script>
    $(window).on('load', function(){
        $(".loading").fadeOut(1000);
    });
</script>

<div class="loading"></div>

	<!-- topBar??? header -->
    <jsp:include page="/components/topbarAction.jsp"></jsp:include>
 
    <section class="banner">
        <div>
            <!--?????? ????????? ??????-->
            <div class="title">
                <h3>Department of Computer &amp; Information technology</h3>
                <h1>??????????????????</h1>
                <p>????????? ??????????????? IT?????? ????????? ??????<br>
                ????????????????????? AI??????????????????</p>
            </div>
            <!--??? ????????? ??????-->
            <ol>
                <li>
                    <a><br>????????? ??????<br>???????????????</a>
                </li>
                <li>
                    <a><br>AI&amp;Bio<br>????????????</a>
                </li>
                <li>
                    <a><br>LINC ??????<br>?????? ??????</a>
                </li>
                <li>
                    <a><br>??????????????????<br>?????? ??????</a>
                </li>
            </ol>
        </div>
        <!--????????? ??????-->
        <video muted autoplay loop>
            <source src="resource/video/background-video.mp4" type="video/mp4">
        </video>
    </section>
    <!--????????? ?????????-->
    <section class="intro">
        <aside>
            <div class="cardTitle">
                <a class="titleLeft">?????? ????????????</a>
                <a class="right" href="pages/list.jsp?type=notice">????????? +</a>
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
                <a class="titleLeft">????????????</a>
                <a class="right" href="pages/list.jsp?type=community">????????? +</a>
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