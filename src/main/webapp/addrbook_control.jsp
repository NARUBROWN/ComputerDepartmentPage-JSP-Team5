<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="main" scope="page" class="mainPage.mainDAO"></jsp:useBean>
<jsp:useBean id="noticeDTO" scope="page" class="notice.noticeDTO"></jsp:useBean>
<jsp:useBean id="communityDTO" scope="page" class="community.communityDTO"></jsp:useBean>
<jsp:setProperty property="*" name="noticeDTO" />
<jsp:setProperty property="*" name="communityDTO" />

<% 
	String action = request.getParameter("action");

	if(action.equals("list")) {
	}
	else if(action.equals("notice-insert")) {
		if(main.noticeInsertDB(noticeDTO)) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else {
			throw new Exception("DB입력 오류");
		}
	}
	else if(action.equals("commnuity-insert")) {
		if(main.communityInsertDB(communityDTO)) {
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