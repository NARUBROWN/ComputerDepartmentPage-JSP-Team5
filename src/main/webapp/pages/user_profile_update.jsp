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
    <link type="text/css" rel="stylesheet" href="../css/sub/user_profile_change_style.css">
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
	
	String type = request.getParameter("type");
	
	// userID ??????;
	String user = (String)session.getAttribute("userID");
	// userName ??????;
	String userName = (String)session.getAttribute("userName");
	// Auth ??????;
	String Auth = (String)session.getAttribute("userAuth");
	// UserRow;
	String userRow = (String)session.getAttribute("userRow");
	int userRowInt = Integer.valueOf(userRow);
	
	if(id == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('???????????? ?????? ????????? ?????????.')");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
	}
	
	if(Auth.equals("staff")){
		
	} else if(id != userRowInt){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('???????????? ?????? ????????? ?????????.')");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
	} else {
		
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
			setParameter = "?type=myaccount";
		}
	} else if(Auth.equals("student")){
		auth = "??????";
		intro = "???????????????";
	}
	
  %>
    <title><%= name %> ?????? ????????? ??????</title>
</head>
<body>

     <!-- topBar??? header -->
    <jsp:include page="/components/topbarAction.jsp"></jsp:include>


    <section class="notice_table">
            <h2><%= intro %></h2>
            <form method="POST" action="../web_control.jsp<%= setParameter %>" class="userForm">
            <input type="hidden" name="action" value="user-update">
            <input type="hidden" name="userRow" value="<%= id %>">
                <ul>
                    <li class="font_head">
                        <span>??????</span>
                        <span><input type="text" name="userName" value="<%= name %>"></span>
                    </li>
                    <li class="font_head">
                        <span>?????????</span>
                        <span><input type="text" name="userID" value="<%= userdto.getUserID() %>"></span>
                    </li>
                    <li class="font_head">
                        <span>????????????</span>
                        <span><input type="password" name="userPassword" value="<%= userdto.getUserPassword()%>" style="font-family: sans-serif;"></span>
                    </li>
                    <li class="notice_writer">
                        <span>?????????</span>
                        <span><input type="text" name="userEmail" value="<%= userdto.getUserEmail() %>"></span>
                    </li>
                    <li class="notice_writer">
                        <span>??????</span>
                        <span>
                            <select class="sel" name="userGender">
                            	<% if(gender.equals("??????")) { %>
                                <option value="M" selected>??????</option>
                                <option value="F">??????</option>
                                <%}else if(gender.equals("??????")) {%>
                                <option value="M">??????</option>
                                <option value="F" selected>??????</option>
                                <%} else { %>
                                <option value="M">??????</option>
                                <option value="F">??????</option>
                                <% }%>
                            </select>
                        </span>
                    </li>
					<% if(Auth.equals("staff")) {  %>
                     <li class="notice_readme">
                        <span>??????</span>
                        <span>
                            <select class="sel" name="userAuth">
                            	<% if(auth.equals("??????")) { %>
                                <option value="student" selected>??????</option>
                                <option value="staff">?????????</option>
                                <% } else if(auth.equals("?????????")) {%>
                                <option value="student">??????</option>
                                <option value="staff" selected>?????????</option>
                                <% } else { } %>
                            </select>  
                        </span>
                    </li>
                    </ul>
                    <% } else if(Auth.equals("student")) {%>
                    <input type="hidden" name="userAuth" value="student">
                    <% } %>
                <div class="write_notice">
                    <input type="submit" value="??????">
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