<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
 <div class="top">
            <div>
            <%
			String nameName =(String)session.getAttribute("userName");
            String nameRow =(String)session.getAttribute("userRow");
            %>
				<a href="#">대학 홈페이지</a>
                <a href="${pageContext.request.contextPath}/pages/user_profile.jsp?id=<%= nameRow %>"><%= nameName %>님 환영합니다.</a>
                <a href="${pageContext.request.contextPath}/web_control.jsp?action=adminPage">관리자 페이지</a>
                <a href="${pageContext.request.contextPath}/web_control.jsp?action=logout">로그아웃</a>
        	
            </div>
    </div>