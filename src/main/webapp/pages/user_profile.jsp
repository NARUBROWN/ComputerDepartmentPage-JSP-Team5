<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="user.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link type="text/css" rel="stylesheet" href="../css/normalize.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_style.css">
    <link type="text/css" rel="stylesheet" href="../css/main/main_nav.css">
    <link type="text/css" rel="stylesheet" href="../css/sub/user_profile_style.css">
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
  	String myaccount = "";
  	
	if(request.getParameter("id") != null){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	if(request.getParameter("type") != null){
		myaccount = "myaccount";
	}
	
	// userID ??????;
	String user = (String)session.getAttribute("userID");
	// userName ??????;
	String userName = (String)session.getAttribute("userName");
	// UserRow;
	String userRow = (String)session.getAttribute("userRow");
	// UserAuth;
	String Auth = (String)session.getAttribute("userAuth");
	
	if(id == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('???????????? ?????? ????????? ?????????.')");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
	}
	
	String gender = "";
	String auth = "";
	String name = "";
	String intro = "";
	String setParameter = "";
	
	UserDTO userdto = new UserDAO().getUser(id);
	gender = userdto.getUserGender();
	auth = userdto.getUserAuth();
	name = userdto.getUserName();
	
	// ???????????? ??????
	if(gender.equals("F")){
		gender = "??????";
	} else if(gender.equals("M")) {
		gender = "??????";
	}
	
	// ???????????? ??????
	if(Auth.equals("staff")){
		auth = "?????????";
		intro = name + "?????? ????????? ?????????.";
		if(myaccount.equals("myaccount")){
			setParameter = "&type=myaccount";
		}
	} else if(Auth.equals("student")){
		auth = "??????";
		intro = "???????????????";
	} else {
		
	}
	
  %>
    <title><%= name %>?????? ?????????</title>
</head>
<body>

	 <!-- topBar??? header -->
    <jsp:include page="/components/topbarAction.jsp"></jsp:include>

    <section class="notice_table">
            <h2><%= intro %></h2>
            <ul>
                <li class="font_head">
                    <span>??????</span>
                    <span><%= name %></span>
                </li>
                <li class="font_head">
                    <span>?????????</span>
                    <span><%= userdto.getUserID() %></span>
                </li>
                <li class="notice_writer">
                    <span>?????????</span>
                    <span><%= userdto.getUserEmail() %></span>
                </li>
                <li class="notice_writer">
                    <span>??????</span>
                    <span><%= gender %></span>
                </li>
                <li class="notice_readme">
                    <span>??????</span>
                    <span><%= auth %></span>
                </li>
                <!-- <li class="notice_content">
                    <img src="./">
                </li> -->
            </ul>
            <div class="write_notice">
                <a href="user_profile_update.jsp?id=<%= userdto.getUserRow() %><%= setParameter %>">??????</a>
            </div>
          
            <%if(Auth.equals("student")){%>
            <div class="write_notice">
                <a href="../web_control.jsp?action=pro-delete&userRow=<%= userRow %>&type=student">??????</a>
            </div>
            <% } else if(Auth.equals("staff")) {%>
           	<div class="write_notice">
                <a href="list.jsp?type=member">??????</a>
             </div>
           	 <div class="write_notice">
               	<a href="../web_control.jsp?action=pro-delete&userRow=<%= userRow %>&type=staff">??????</a>
             </div>
             <%} %>
            
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