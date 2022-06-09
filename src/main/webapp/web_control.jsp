<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="main" scope="page" class="mainPage.mainDAO"></jsp:useBean>
<jsp:useBean id="noticeDTO" scope="page" class="notice.noticeDTO"></jsp:useBean>
<jsp:useBean id="communityDTO" scope="page" class="community.communityDTO"></jsp:useBean>
<jsp:setProperty property="*" name="noticeDTO" />
<jsp:setProperty property="*" name="communityDTO" />

<% 

	// 바로 이전의 form의 action 값에 따라서 값이 바뀝니다.
	String action = request.getParameter("action");

	if(action.equals("list")) {
	}
	else if(action.equals("notice-insert")) {
		// form에서 notice-insert를 보낼경우 DAO에 있는 method를 호출하여 DB처리
		if(main.noticeInsertDB(noticeDTO)) {
			// 처리가 완료되면 메인화면으로 다시 변경
			response.sendRedirect("index.jsp");
		} else {
			throw new Exception("DB입력 오류");
		}
	}
	else if(action.equals("commnuity-insert")) {
		// form에서 notice-insert를 보낼경우 DAO에 있는 method를 호출하여 DB처리
		if(main.communityInsertDB(communityDTO)) {
			// 처리가 완료되면 메인화면으로 다시 변경
			response.sendRedirect("index.jsp");
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