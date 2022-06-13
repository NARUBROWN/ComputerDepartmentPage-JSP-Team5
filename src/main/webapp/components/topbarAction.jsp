<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<% // Auth 확인
		String Auth = (String) session.getAttribute("userAuth");
		// Auth null 일 경우 기본 탑바를 보여줌 
		if(Auth == null) { %>
		<jsp:include page="topbar.jsp"></jsp:include>
		
	<% // Auth가 staff일 경우 관리자용 탑바를 보여줌
		}else if (Auth.equals("staff")) {%>
		<jsp:include page="admin_topbar.jsp"></jsp:include>
	<%} // Auth가 null과 staff를 제외한 값이 들어있을때 (일반 사용자)) 기본 탑 바를 보여줌 
		else if (Auth != null){ %>
		<jsp:include page="topbar.jsp"></jsp:include>
	<%} %>
	
	<% // Auth가 확인
		// Auth가 null 일 경우 기본 헤더를 보여줌 
		if(Auth == null) { %>
		<jsp:include page="/components/header.jsp"></jsp:include>
	<% // Auth가 staff일 경우 관리자용 헤더를 보여줌
		}else if (Auth.equals("staff")) {
			// 현재 위치가 index.jsp일 경우에는 일반헤더를 보여줌
			if(request.getServletPath().equals("/index.jsp")){%>
				<jsp:include page="/components/header.jsp"></jsp:include>
			<%} else {  %>
				<jsp:include page="/components/admin_header.jsp"></jsp:include>
			<% }%>
		
	<%
		} // Auth가 null과 staff를 제외한 값이 들어있을때 (일반 사용자)) 기본 헤더를 보여줌 
		else if (Auth != null){ %>
		<jsp:include page="/components/header.jsp"></jsp:include>
	<%} %>