<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="main" scope="page" class="mainPage.mainDAO"></jsp:useBean>
<jsp:useBean id="noticeDTO" scope="page" class="notice.noticeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="noticeDTO" />

<% 
	String action = request.getParameter("action");
	if(action.equals("list")) {
	}
	else if(action.equals("insert")) {
		if(main.insertDB(noticeDTO)) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else {
			throw new Exception("DB입력 오류");
		}
	}
	else if(action.equals("edit")) {
	}
	else if(action.equals("update")) {
	}
	else if(action.equals("delete")) {
	}
	else {
		
	}
%>