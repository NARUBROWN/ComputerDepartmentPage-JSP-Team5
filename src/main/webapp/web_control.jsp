<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="main" scope="page" class="mainPage.mainDAO"></jsp:useBean>
<jsp:useBean id="user" scope="page" class="user.UserDAO"></jsp:useBean>

<jsp:useBean id="noticeDTO" scope="page" class="notice.noticeDTO"></jsp:useBean>
<jsp:useBean id="communityDTO" scope="page" class="community.communityDTO"></jsp:useBean>
<jsp:useBean id="userDTO" scope="page" class="user.UserDTO"></jsp:useBean>


<jsp:setProperty property="*" name="noticeDTO" />
<jsp:setProperty property="*" name="communityDTO" />
<jsp:setProperty property="*" name="userDTO" />

<% 
	// 바로 이전의 form의 action 값에 따라서 값이 바뀝니다.
	String action = request.getParameter("action");

	if(action.equals("list")) {
		// 빈자리
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
		// 빈자리
	}
	else if(action.equals("login")) {
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 상태입니다')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
			int result = user.login(userDTO.getUserID(), userDTO.getUserPassword()); // 로그인 페이지에서 유저아이디 , 패스워드를 넘겨와서 실행해주는 함수
			if (result ==1 ) {
				session.setAttribute("userID", userDTO.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
			else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()"); // 전으로 돌리는 스크립트
			script.println("</script>");
			}
			else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()"); // 전으로 돌리는 스크립트
			script.println("</script>");
			}
			else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터 베이스 오류.')");
			script.println("history.back()"); // 전으로 돌리는 스크립트
			script.println("</script>");
			}
	}
	// web_control.jsp?action=logout 파라미터를 통해서 로그아웃 액션 처리 시켜줌
	else if(action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
	} else {
		// 빈자리
	}
%>