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
    <title>인천재능대학교 컴퓨터정보과</title>
</head>
<body>
<script>
    $(window).on('load', function(){
        $(".loading").fadeOut(3000);
    });
</script>

<div class="loading"></div>

<% String a = "${pageContext.request.contextPath}"; %>

<jsp:include page="/components/topbar.jsp"></jsp:include>
<jsp:include page="/components/header.jsp"></jsp:include>
 
    <section class="banner">
        <div>
            <!--배너 타이틀 영역-->
            <div class="title">
                <h3>Department of Computer &amp; Information technology</h3>
                <h1>컴퓨터정보과</h1>
                <p>강하고 경쟁력있는 IT인재 양성의 요람<br>
                인천재능대학교 AI컴퓨터정보과</p>
            </div>
            <!--키 포인트 영역-->
            <ol>
                <li>
                    <a><br>전문대 최초<br>송도캠퍼스</a>
                </li>
                <li>
                    <a><br>AI&amp;Bio<br>선도대학</a>
                </li>
                <li>
                    <a><br>LINC 사업<br>연속 선정</a>
                </li>
                <li>
                    <a><br>자율개선대학<br>지속 선정</a>
                </li>
            </ol>
        </div>
        <!--동영상 배경-->
        <video muted autoplay loop>
            <source src="resource/video/background-video.mp4" type="video/mp4">
        </video>
    </section>
    <!--인트로 페이지-->
    <section class="intro">
        <aside>
            <div class="cardTitle">
                <a class="titleLeft" href="#">학과 공지사항</a>
                <a class="right" href="#">더보기 +</a>
            </div>
            <div class="titleArea">
                <table class="table_title">
                    <tbody>
                    <%
						mainDAO maintitle = new mainDAO();
						ArrayList<noticeDTO> title_lists = maintitle.getMainPageNoticeList();
						for(int i = 0; i < 5; i++) {
					%>
                    <tr>
                        <th class="title-ellipsis"><a href="#"><%=title_lists.get(i).getNo_title()%></a></th>
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
						for(int i = 0; i < 5; i++) {
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
                <a class="titleLeft" href="#">커뮤니티</a>
                <a class="right" href="#">더보기 +</a>
            </div>
            <div class="titleArea">
                <table class="table_title">
                    <tbody>
                    <%
						ArrayList<communityDTO> date_lists = maintitle.getMainPagecommunityList();
						for(int i = 0; i < 5; i++) {
					%>
                    <tr>
                        <th class="title-ellipsis"><a href="#"><%=date_lists.get(i).getCo_title()%></a></th>
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
						for(int i = 0; i < 5; i++) {
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
    <footer>
        <img src="resource/img/footer_logo.png" alt="">
        <div class="left">
            <div>
                <table>
                    <tr>
                        <td><h2>인천재능대학교</h2></td>
                    </tr>
                    <tr>
                        <td>22573 인천광역시 동구 재능로 178</td>
                    </tr>
                    <tr>
                        <td>Tel: 032-890-7000</td>
                    </tr>
                    <tr>
                        <td>Fax: 032-890-7065</td>
                    </tr>
                </table>
            </div>
        </div>
        <aside>
            <div>
            <table>
                <tr>
                    <td><h2>송림캠퍼스</h2></td>
                </tr>
                <tr>
                    <td>22573 인천광역시 동구 재능로 178</td>
                </tr>
                <tr>
                    <td>Tel: 032-890-7000</td>
                </tr>
                <tr>
                    <td>Fax: 032-890-7065</td>
                </tr>
            </table>
            </div>
            <div>
            <table>
                <tr>
                    <td><h2>송도캠퍼스</h2></td>
                </tr>
                <tr>
                    <td>21987 인천광역시 연수구 송도동 196-1</td>
                </tr>
                <tr>
                    <td>Tel: 021-890-7000</td>
                </tr>
            </table>
            </div>
        </aside>
    </footer>
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