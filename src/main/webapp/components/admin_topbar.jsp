<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
 <div class="top">
            <div>
            <%
	String loginCheck=(String)session.getAttribute("userID");
            %>
				<a href="#">대학 홈페이지</a>
                <a href="#"><%= loginCheck %>님 환영합니다.</a>
                <a href="${pageContext.request.contextPath}/web_control.jsp?action=adminPage">관리자 페이지</a>
                <a href="${pageContext.request.contextPath}/web_control.jsp?action=logout">로그아웃</a>
        	
            </div>
    </div>