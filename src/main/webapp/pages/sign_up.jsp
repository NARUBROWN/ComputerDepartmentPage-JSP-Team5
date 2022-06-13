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
                <form method="post" action="../web_control.jsp">
                <input type="hidden" name="action" value="signup">
                    <div id="content">

                        <div>
                            <h3 class="join_title">
                                <label for="id">아이디</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="id" class="int" maxlength="20" name="userID">
                            </span>
                        </div>

                        <div>
                            <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                            <span class="box int_pass">
                                <input type="password" id="pswd1" class="int" maxlength="20" name="userPassword" style="font-family: sans-serif;">
                            </span>
                        </div>

                        <div>
                            <h3 class="join_title"><label for="name">이름</label></h3>
                            <span class="box int_name">
                                <input type="text" id="name" class="int" maxlength="20" name="userName">
                            </span>
                        </div>

                        <div>
                            <h3 class="join_title">
                                <label for="id">이메일</label>
                            </h3>
                            <span class="box int_id">
                                <input type="text" id="id" class="int" maxlength="20" name="userEmail">
                                <span class="step_url">
                                </span>
                            </span>
                        </div>

                        <div>
                            <h3 class="join_title"><label for="gender">성별</label></h3>
                            <span class="box gender_code">
                                <select id="gender" class="sel" name="userGender">
                                    <option>성별</option>
                                    <option value="M">남자</option>
                                    <option value="F">여자</option>
                                </select>                            
                            </span>
                        </div>
                        <%
                        	// 현재 유저 권한 받아오기
							String userAuth = (String) session.getAttribute("userAuth");

                            // 현재 유저에게 권한이 없을때 (새로 가입하는 상황)
           					if(userAuth == null){ %>
           						<input type="hidden" name="userAuth" value="student">
           					<%
           					// 현재 유저가 관리자일때 (관리자가 계정을 생성하는 상황)
           					} else if(userAuth.equals("staff")) {%>
                				<div>
                                 <h3 class="join_title"><label for="auth">구분</label></h3>
                                 <span class="box gender_code">
                                     <select id="auth" class="sel" name="userAuth">
                                         <option>구분</option>
                                         <option value="student">학생</option>
                                         <option value="staff">교직원</option>
                                     </select>                            
                                 </span>
                             </div>
                					<%
           						
           					}else { }%>

                        <div class="btnJoin">
                        <% if(request.getParameter("type") == null){ %>
                            <input type="submit" value="가입하기">
                         <% } else if(request.getParameter("type").equals("new")){ %>
                        	<input type="submit" value="생성하기">
                        <% }%> 
                        </div>
                    </div> 
                </form>
            </div>
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