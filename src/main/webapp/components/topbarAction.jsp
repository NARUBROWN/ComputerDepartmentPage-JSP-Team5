<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<% // userID 확인
		String user = (String)session.getAttribute("userID");
		// user가 null 일 경우 기본 탑바를 보여줌 
		if(user == null) { %>
		<jsp:include page="topbar.jsp"></jsp:include>
		
	<% // user가 admin일 경우 관리자용 탑바를 보여줌
		}else if (user.equals("admin")) {%>
		<jsp:include page="admin_topbar.jsp"></jsp:include>
	<%} // user가 null과 admin을 제외한 값이 들어있을때 (일반 사용자)) 기본 탑 바를 보여줌 
		else if (user != null){ %>
		<jsp:include page="topbar.jsp"></jsp:include>
	<%} %>
	
	<% // userID 확인
		// user가 null 일 경우 기본 헤더를 보여줌 
		if(user == null) { %>
		<jsp:include page="/components/header.jsp"></jsp:include>
	<% // user가 admin일 경우 관리자용 헤더를 보여줌
		}else if (user.equals("admin")) {
			// 현재 위치가 index.jsp일 경우에는 일반헤더를 보여줌
			if(request.getServletPath().equals("/index.jsp")){%>
				<jsp:include page="/components/header.jsp"></jsp:include>
			<%} else {  %>
				<jsp:include page="/components/admin_header.jsp"></jsp:include>
			<% }%>
		
	<%
		} // user가 null과 admin을 제외한 값이 들어있을때 (일반 사용자)) 기본 헤더를 보여줌 
		else if (user != null){ %>
		<jsp:include page="/components/header.jsp"></jsp:include>
	<%} %>