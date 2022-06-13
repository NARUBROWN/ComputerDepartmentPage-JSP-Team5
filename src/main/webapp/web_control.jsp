<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="main" scope="page" class="mainPage.mainDAO"></jsp:useBean>
<jsp:useBean id="user" scope="page" class="user.UserDAO"></jsp:useBean>
<jsp:useBean id="notice" scope="page" class="notice.noticeDAO"></jsp:useBean>
<jsp:useBean id="community" scope="page" class="community.communityDAO"></jsp:useBean>

<jsp:useBean id="noticeDTO" scope="page" class="notice.noticeDTO"></jsp:useBean>
<jsp:useBean id="communityDTO" scope="page" class="community.communityDTO"></jsp:useBean>
<jsp:useBean id="userDTO" scope="page" class="user.UserDTO"></jsp:useBean>


<jsp:setProperty property="*" name="noticeDTO" />
<jsp:setProperty property="*" name="communityDTO" />
<jsp:setProperty property="*" name="userDTO" />

<% 
	// action 파라미터 처리
	String action = request.getParameter("action");
	
	// 회원가입
	if(action.equals("signup")) {
		//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		String userPassword = null;
		String userName = null;
		String userEmail = null;
		String userGender = null;
		String userAuth = null;

		if (request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
		}

		if (request.getParameter("userPassword") != null) {
			userPassword = (String) request.getParameter("userPassword");
		}
		if (request.getParameter("userName") != null) {
			userName = (String) request.getParameter("userName");
		}
		if (request.getParameter("userEmail") != null) {
			userEmail = (String) request.getParameter("userEmail");
		}
		if (request.getParameter("userGender") != null) {
			userGender = (String) request.getParameter("userGender");
		}
		if (request.getParameter("userAuth") != null) {
			userAuth = (String) request.getParameter("userAuth");
		}

		if (userID == null || userPassword == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("</script>");
			script.close();
			return;
		}
		
		int result = user.join(userDTO);
		if (result == 1) {
			// Auth 로 현재 권한 가져오기
			String Auth = (String) session.getAttribute("userAuth");
			// Auth가 없을경우는 처음 회원가입 하는 상황
			if(Auth == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입에 성공했습니다.')");
				script.println("location.href='index.jsp';");
				script.println("</script>");
				script.close();
				return;
			// Auth가 있을 경우는 관리자가 추가하는 상황
			} else if(Auth.equals("staff")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보를 성공적으로 생성했습니다.')");
				script.println("location.href='pages/list.jsp?type=member';");
				script.println("</script>");
				script.close();
				return;
			} 
		} else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 ID 입니다.')");
			script.println("</script>");
			script.close();
			return;
		}
	}
	
	// notice DB에 정보 입력
	else if(action.equals("notice-insert")) {
		//user 정보를 불러옴
		String userID = (String)session.getAttribute("userID");
		//ID가 admin이면 조건 통과
		if(userID.equals("admin")) {
			// form에서 notice-insert를 보낼경우 DAO에 있는 method를 호출하여 DB처리
			notice.insertDB(noticeDTO);
			// 처리가 완료되면 메인화면으로 다시 변경
			response.sendRedirect("pages/list.jsp?type=notice");
		} else {
			// 403 오류로 보내야함
			throw new Exception("DB입력 오류");
		}
	}
	
	// community DB 정보 입력
	else if(action.equals("commnuity-insert")) {
		// form에서 notice-insert를 보낼경우 DAO에 있는 method를 호출하여 DB처리
		if(main.communityInsertDB(communityDTO)) {
			// 처리가 완료되면 메인화면으로 다시 변경
			response.sendRedirect("pages/list.jsp?type=community");
		} else {
			throw new Exception("DB입력 오류");
		}
	}
	
	
	else if(action.equals("edit")) {
		// 빈자리
	}
	
	// 로그인 로직 
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
				
				// getAuth로 String 권한 리턴 받아서 userAuth로 대입
				String userAuth = user.getAuth(userDTO.getUserID());
				session.setAttribute("userAuth", userAuth);
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
	
	
	// 로그아웃 로직 
	else if(action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
	} 
	
	// notice DB 정보 수정
	else if(action.equals("notice-update")){
		if(notice.updateNotice(noticeDTO)) {
			// 처리가 완료되면 쓰던 페이지로 다시 변경
			response.sendRedirect("pages/view_content.jsp?id=" + noticeDTO.getNo_id()+ "&type=notice");
		} else {
			throw new Exception("DB입력 오류");
		}
	} 
	
	// community DB 정보 수정
	else if(action.equals("community-update")){
		if(community.updateCommunity(communityDTO)){
			response.sendRedirect("pages/view_content.jsp?id=" + communityDTO.getCo_id()+ "&type=community");
		} else {
			throw new Exception("DB입력 오류");
		}
	}
	
	// notice DB 정보 삭제
	else if(action.equals("no-delete")) {
		String no_con_id = request.getParameter("id");
		int no_id = Integer.parseInt(no_con_id);
		if(notice.deleteNotice(no_id)){
			response.sendRedirect("pages/list.jsp?type=notice");
		} else { 
			throw new Exception("DB입력 오류");
		}
	} 
	
	// community DB 정보 삭제
	else if(action.equals("co-delete")) {
		String co_con_id = request.getParameter("id");
		int co_id = Integer.parseInt(co_con_id);
		if(community.deleteCommunity(co_id)){
			response.sendRedirect("pages/list.jsp?type=community");
		} else { 
			throw new Exception("DB입력 오류");
		}
	} 
	
	// adminPage 로 보내는 로직
	else if(action.equals("adminPage")) {
		String userID = (String)session.getAttribute("userID");
		if(userID.equals("admin")) {
		%><jsp:forward page="admin/admin_index.jsp"/><%
		} else {
			// 오류 페이지로 보내야 함
			response.sendRedirect("index.jsp");
		}
	}
%>