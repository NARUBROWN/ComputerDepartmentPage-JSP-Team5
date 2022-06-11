<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <link type="text/css" rel="stylesheet" href="../css/normalize.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_style.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_nav.css">
    <link type="text/css" rel="stylesheet" href="../css/sub/signUp_style.css">
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
            <!-- 회원가입 -->
            <div id="wrapper">
                <div id="content">
                    <div>
                        <h3 class="join_title">
                            <label for="id">아이디</label>
                        </h3>
                        <span class="box">
                            <input type="text" id="id" class="int" maxlength="20">
                        </span>
                    </div>

                    <div>
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="box int_pass">
                            <input type="text" id="pswd1" class="int" maxlength="20">
                        </span>
                    </div>

                    <div>
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="box int_name">
                            <input type="text" id="name" class="int" maxlength="20">
                        </span>
                    </div>

                    <div>
                        <h3 class="join_title">
                            <label for="id">이메일</label>
                        </h3>
                        <span class="box int_id">
                            <input type="text" id="id" class="int" maxlength="20">
                            <span class="step_url">
                                <select id="email" class="select">
                                    <option>도메인 선택</option>
                                    <option value="naver">@naver.com</option>
                                    <option value="daum">@daum.net</option>
                                </select>   
                            </span>
                        </span>
                    </div>

                    <div>
                        <h3 class="join_title"><label for="gender">성별</label></h3>
                        <span class="box gender_code">
                            <select id="gender" class="sel">
                                <option>성별</option>
                                <option value="M">남자</option>
                                <option value="F">여자</option>
                            </select>                            
                        </span>
                    </div>

                    <div>
                        <h3 class="join_title"><label for="auth">구분</label></h3>
                        <span class="box gender_code">
                            <select id="auth" class="sel">
                                <option>구분</option>
                                <option value="student">학생</option>
                                <option value="staff">교직원</option>
                            </select>                            
                        </span>
                    </div>

                    <div class="btn_area">
                        <button type="button" id="btnJoin">
                            <span>가입하기</span>
                        </button>
                    </div>
                </div> 
            </div>
    <footer>
        <img src="../resource/img/footer_logo.png" alt="">
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