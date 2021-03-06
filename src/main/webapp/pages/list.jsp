<%@ page language="java" contentType="text/html; charset=UTF-8"
    errorPage="./pages/404errorPage.jsp" pageEncoding="UTF-8" %>
    <%@ page import="notice.*" %>
    <%@ page import="user.*" %>
    <%@ page import="community.*" %>
    <%@ page import="admin.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.io.PrintWriter" %>
    
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
    
    	<%
	
		// ???????????? userID ??????????????????
		String user = (String) session.getAttribute("userID");
	
		// ???????????? ??????????????? ?????? ???????????? ???????????? 1??? ???????????? ????????? 
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		// session?????? Auth??? ????????????
		String Auth = (String) session.getAttribute("userAuth");
		
		// ?????? ?????????
		String contentTypeName = "";
		String webcontrolPush = "";
		String contentType = "";
		
		// type??? notice??? ??????
		if(request.getParameter("type").equals("notice")){
			contentTypeName = "???????????? ?????????";
			webcontrolPush = "notice";
			contentType = "no";
		
		// type??? community??? ??????
		} else if(request.getParameter("type").equals("community")) {
			contentTypeName = "???????????? ?????????";
			webcontrolPush = "commnuity";
			contentType = "co";
			
		// type??? member??? ??????
		} else if(request.getParameter("type").equals("member")) {
			// ???????????? ?????? ??? ??????
			if(Auth.equals("staff")) {
				contentTypeName = "?????? ??????";
				webcontrolPush = "member";
				contentType = "mem";
				// ????????? ?????? ??????
			} else { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('?????? ????????? ????????????.')");
				script.println("history.back()"); // ????????? ????????? ????????????
				script.println("</script>");
			}
		}
		
		
	%>
	
    <title><%= contentTypeName %> ??????</title>
</head>
<body>
	<!-- topBar??? header -->
    <jsp:include page="/components/topbarAction.jsp"></jsp:include>

    <section class="notice_table">

        <h2><%= contentTypeName %></h2>
            <%	
         	// notice??? ??????????????? ???????????? ??????
            if(contentType.equals("no")){ 
            	noticeDAO maintitle = new noticeDAO();
				ArrayList<noticeDTO> title_lists = maintitle.getList(pageNumber);%>
				<ul>
            		<li class="font_head">
                		<span>??????</span>
                		<span>??????</span>
                		<span>?????????</span>
                		<span>?????????</span>
           			 </li>
      
				<% for(int i = 0; i < title_lists.size(); i++) {
					// notice ?????? ??????
            %>
            <li>
                <span><%=title_lists.get(i).getNo_id()%></span>
                <span class="title_hover"><a href="view_content.jsp?id=<%=title_lists.get(i).getNo_id()%>&type=notice"><%=title_lists.get(i).getNo_title()%></a></span>
                <span><%=title_lists.get(i).getNo_date().replace("-", "/")%></span>
                <span><%=title_lists.get(i).getNo_author()%></span>
            </li>	
            <% } %>
         	   </ul>
         	   
         	   <!-- ???????????? ??????, ?????? ????????? -->
         		<div class="numCheck">
         			<%
				if(pageNumber != 1) {
					
					%>
				<a href="list.jsp?pageNumber=<%=pageNumber - 1%>&type=notice">??????</a>
					<%
				} if(maintitle.nextPage(pageNumber + 1)) {
					
					%>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>&type=notice">??????</a>
					<%
				}
					%>
        	</div>
        	
				<%// community??? ??????????????? ???????????? ??????
            	} else if (contentType.equals("co")){ 
            		communityDAO  maintitle = new communityDAO();
					ArrayList<communityDTO> title_lists = maintitle.getList(pageNumber);%>
					<ul>
					 <li class="font_head">
	                	<span>??????</span>
	                	<span>??????</span>
	                	<span>?????????</span>
	                	<span>?????????</span>
	            	</li>
					
					<% for(int i = 0; i < title_lists.size(); i++) {
						// community ?????? ??????
            %>
          
            <li>
                <span><%=title_lists.get(i).getCo_id()%></span>
                <span class="title_hover"><a href="view_content.jsp?id=<%=title_lists.get(i).getCo_id()%>&type=community"><%=title_lists.get(i).getCo_title()%></a></span>
                <span><%=title_lists.get(i).getCo_date().replace("-", "/")%></span>
                <span><%=title_lists.get(i).getCo_author()%></span>
            </li>
            	
           		<% 	}%>
           		</ul>
           			
           		<!-- ???????????? ??????, ?????? ????????? -->
         		<div class="numCheck">
         			<%
				if(pageNumber != 1) {
					
					%>
				<a href="list.jsp?pageNumber=<%= pageNumber - 1%>&type=community">??????</a>
					<%
				} if(maintitle.nextPage(pageNumber + 1)) {
					
					%>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>&type=community">??????</a>
					<%
				}
					%>
        	</div>
           			<% 
			// ????????? ??????
           	} else if (contentType.equals("mem")){ 
           			UserDAO userdao = new UserDAO();
           			ArrayList<UserDTO> title_lists = userdao.getList(pageNumber);%>
           			<ul>
            			<li class="font_head">
                			<span>?????? ??????</span>
                			<span>?????? ?????????</span>
                			<span>?????? ??????</span>
                			<span>?????? ??????</span>
           				 </li>
           			<% for(int i = 0; i < title_lists.size(); i++){
           		%>
           	
			<li>
                <span><%= title_lists.get(i).getUserRow() %></span>
                <span class="title_hover"><a href="user_profile.jsp?id=<%= title_lists.get(i).getUserRow()%>"><%= title_lists.get(i).getUserID() %></a></span>
                <span><%= title_lists.get(i).getUserName() %></span>
                <span><%= title_lists.get(i).getUserAuth() %></span>
            </li>

           <% } %>
                  </ul>
                <!-- ???????????? ??????, ?????? ????????? -->
         		<div class="numCheck">
         			<%
				if(pageNumber != 1) {
					
					%>
				<a href="list.jsp?pageNumber=<%=pageNumber - 1%>&type=member">??????</a>
					<%
				} if(userdao.nextPage(pageNumber + 1)) {
					
					%>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>&type=member">??????</a>
					<%
				}
					%>
        	</div>
                  
           <% }%>
           
        <% 
       	// type??? no??? ??????
        if(contentType.equals("no")){ 
        	// Auth??? staff??? ??? ?????? ????????? ?????????
			if(Auth == null){ %>
        	<% } else if(Auth.equals("staff")) { %>
        		<div class="write_notice">
            		<a href="form.jsp?type=notice">?????????</a>
        		</div>
        	<%}
			// type??? co??? ??????
        }else if(contentType.equals("co")){
        	// user??? null??? ??????
        	if(user == null){ 
        	 	// ???????????? ???????????? ??????
        	 }else{ %>
        		<div class="write_notice">
            		<a href="form.jsp?type=community">?????????</a>
        		</div>
        	<% }
        	//type??? mem??? ??????
        } else if(contentType.equals("mem")) { %>
        		<div class="add_notice">
            		<a href="sign_up.jsp?type=new">?????? ??????</a>
        		</div>
        	<% } else { %>
        		
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