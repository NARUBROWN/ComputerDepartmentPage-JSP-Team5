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
	
		// 세션에서 userID 가져오는코드
		String user = (String) session.getAttribute("userID");
	
		// 페이지에 파라미터가 같이 넘어오지 않을경우 1을 기본으로 넣어줌 
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		// 변수 초기화
		String contentTypeName = "";
		String webcontrolPush = "";
		String contentType = "";
		
		// type이 notice일 경우
		if(request.getParameter("type").equals("notice")){
			contentTypeName = "공지사항 게시글";
			webcontrolPush = "notice";
			contentType = "no";
		
		// type이 community일 경우
		} else if(request.getParameter("type").equals("community")) {
			contentTypeName = "커뮤니티 게시글";
			webcontrolPush = "commnuity";
			contentType = "co";
			
		// type이 member일 경우
		} else if(request.getParameter("type").equals("member")) {
			// 관리자가 접근 할 경우
			if(user.equals("admin")) {
				contentTypeName = "회원 정보";
				webcontrolPush = "member";
				contentType = "mem";
				// 그렇지 않을 경우
			} else { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('접근 권한이 없습니다.')");
				script.println("history.back()"); // 전으로 돌리는 스크립트
				script.println("</script>");
			}
		}
		
		
	%>
	
    <title><%= contentTypeName %> 목록</title>
</head>
<body>
	<!-- topBar와 header -->
    <jsp:include page="/components/topbarAction.jsp"></jsp:include>

    <section class="notice_table">

        <h2><%= contentTypeName %></h2>
            <%	
         	// notice가 파라미터로 넘어왔을 경우
            if(contentType.equals("no")){ 
            	noticeDAO maintitle = new noticeDAO();
				ArrayList<noticeDTO> title_lists = maintitle.getList(pageNumber);%>
				<ul>
            		<li class="font_head">
                		<span>번호</span>
                		<span>제목</span>
                		<span>작성일</span>
                		<span>작성자</span>
           			 </li>
      
				<% for(int i = 0; i < title_lists.size(); i++) {
					// notice 요소 반영
            %>
            <li>
                <span><%=title_lists.get(i).getNo_id()%></span>
                <span><a href="view_content.jsp?id=<%=title_lists.get(i).getNo_id()%>&type=notice"><%=title_lists.get(i).getNo_title()%></a></span>
                <span><%=title_lists.get(i).getNo_date().replace("-", "/")%></span>
                <span><%=title_lists.get(i).getNo_author()%></span>
            </li>	
            <% } %>
         		 </ul>
				<%// community가 파라미터로 넘어왔을 경우
            	} else if (contentType.equals("co")){ 
            		communityDAO  maintitle = new communityDAO();
					ArrayList<communityDTO> title_lists = maintitle.getList(pageNumber);%>
					<ul>
					 <li class="font_head">
	                	<span>번호</span>
	                	<span>제목</span>
	                	<span>작성일</span>
	                	<span>작성자</span>
	            	</li>
					
					<% for(int i = 0; i < title_lists.size(); i++) {
						// community 요소 반영
            %>
          
            <li>
                <span><%=title_lists.get(i).getCo_id()%></span>
                <span><a href="view_content.jsp?id=<%=title_lists.get(i).getCo_id()%>&type=community"><%=title_lists.get(i).getCo_title()%></a></span>
                <span><%=title_lists.get(i).getCo_date().replace("-", "/")%></span>
                <span><%=title_lists.get(i).getCo_author()%></span>
            </li>
            	
           			<% 	}%>
           			</ul>
           			<% 
				// 멤버일 경우
           		} else if (contentType.equals("mem")){ 
           			adminDAO admindao = new adminDAO();
           			ArrayList<UserDTO> title_lists = admindao.getList(pageNumber);%>
           			<ul>
            			<li class="font_head">
                			<span>회원 번호</span>
                			<span>회원 아이디</span>
                			<span>회원 이름</span>
                			<span>회원 권한</span>
           				 </li>
           			<% for(int i = 0; i < title_lists.size(); i++){
           		%>
           	
			<li>
                <span><%= title_lists.get(i).getUserRow() %></span>
                <span><a href="view_content.jsp?id=<%= title_lists.get(i).getUserRow() %>&type=community"><%= title_lists.get(i).getUserID() %></a></span>
                <span><%= title_lists.get(i).getUserName() %></span>
                <span><%= title_lists.get(i).getUserAuth() %></span>
            </li>

           <% } %>
                  </ul>
           <% }%>
           

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
        <% 
       	// type이 no일 경우
        if(contentType.equals("no")){ 
        	// id가 admin이면 글 쓰기 버튼을 보여줌
			if(user.equals("admin")){ %>
        		<div class="write_notice">
            		<a href="form.jsp?type=notice">글쓰기</a>
        		</div>
        	<% } else { %>
        		
        	<%}
			// type이 co일 경우
        }else if(contentType.equals("co")){
        	// user가 null일 경우
        	if(user == null){ 
        	 	// 아무것도 보여주지 않음
        	 }else{ %>
        		<div class="write_notice">
            		<a href="form.jsp?type=community">글쓰기</a>
        		</div>
        	<% }
        	//type이 mem일 경우
        } else if(contentType.equals("mem")) {
       	 if(user.equals("admin")){ %>
        		<div class="write_notice">
            		<a href="sign_up.jsp?type=new">회원 추가</a>
        		</div>
        	<% } else { %>
        		
        	<%}
        		 } %>
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