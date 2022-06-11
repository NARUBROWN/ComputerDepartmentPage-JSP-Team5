<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link type="text/css" rel="stylesheet" href="../css/normalize.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_style.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_nav.css">
    <link type="text/css" rel="stylesheet" href="../css/sub/notice_style.css">
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
    <title>로그인 페이지</title>
</head>
<body>
    <jsp:include page="/components/topbar.jsp"></jsp:include>
	<jsp:include page="/components/header.jsp"></jsp:include>

    <section class="notice_table">
        <h2>공지사항</h2>
        <ul>
            <li class="font_head">
                <span>번호</span>
                <span>제목</span>
                <span>작성일</span>
                <span>작성자</span>
            </li>
            <li>
                <span>10</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Remote</span>
            </li>
            <li>
                <span>9</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>United States</span>
            </li>
            <li>
                <span>8</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Philadelphia</span>
            </li>
            <li>
                <span>7</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Canada</span>
            </li>
            <li>
                <span>6</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>United States</span>
            </li>
            <li>
                <span>5</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Germany</span>
            </li>
            <li>
                <span>4</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Sylhet, Bangladesh</span>
            </li>
            <li>
                <span>3</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Canada</span>
            </li>
            <li>
                <span>2</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>Shenzhen, China</span>
            </li>
            <li>
                <span>1</span>
                <span><a href="#">WordPress Developer Contractor</a></span>
                <span>2022-06-09</span>
                <span>N/A</span>
            </li>
        </ul>
        <div class="numCheck">
            <a href="#">&lt;</a>
            <a href="#">&gt;</a>
            <ol>
                <li>
                    <a href="#">1</a>
                </li>
                <li>
                    <a href="#">2</a>
                </li>
                <li>
                    <a href="#">3</a>
                </li>
                <li>
                    <a href="#">4</a>
                </li>
                <li>
                    <a href="#">5</a>
                </li>
                <li>
                    <a href="#">6</a>
                </li>
                <li>
                    <a href="#">7</a>
                </li>
                <li>
                    <a href="#">8</a>
                </li>
                <li>
                    <a href="#">9</a>
                </li>
                <li>
                    <a href="#">10</a>
                </li>
            </ol>
        </div>
        <div class="write_notice">
            <a href="notice_content_form.jsp">글쓰기</a>
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