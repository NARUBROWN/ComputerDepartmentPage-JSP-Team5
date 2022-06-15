<%@page import="user.*"%>
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

	// 파라미터가 안 넘어오면
	if(action == null){
		action = "none";
		// 해당하는 액션이 없을 경우
		// 403 페이지로 이동
		response.sendRedirect("pages/error/403errorPage.jsp");
	} else {
		action = request.getParameter("action");
	}
	
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
				script.println("location.href='pages/login.jsp';");
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
		// Auth 로 현재 권한 가져오기
		String Auth = (String) session.getAttribute("userAuth");
		//권한이 Staff면 조건 통과
		if(Auth.equals("staff")) {
			// form에서 notice-insert를 보낼경우 DAO에 있는 method를 호출하여 DB처리
			notice.insertDB(noticeDTO);
			// 처리가 완료되면 메인화면으로 다시 변경
			response.sendRedirect("pages/list.jsp?type=notice");
		} else {
			// 403 오류
			response.sendRedirect("pages/error/403errorPage.jsp");
		}
	}
	
	// community DB 정보 입력
	else if(action.equals("commnuity-insert")) {
		// form에서 notice-insert를 보낼경우 DAO에 있는 method를 호출하여 DB처리
		if(main.communityInsertDB(communityDTO)) {
			// 처리가 완료되면 메인화면으로 다시 변경
			response.sendRedirect("pages/list.jsp?type=community");
		} else {
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
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
				// getName로 String 이름 리턴 받아서 userName으로 대입
				String userName = user.getName(userDTO.getUserID());
				// getID로 String 이름 리턴 받아서 userRow으로 대입
				String userRow = user.getID(userDTO.getUserID());
				
				// setAttribute userAuth
				session.setAttribute("userAuth", userAuth);
				// setAttribute userID
				session.setAttribute("userID", userDTO.getUserID());
				// setAttribute userName
				session.setAttribute("userName", userName);
				// setAttribute userRow
				session.setAttribute("userRow", userRow);
				
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
				// 500 페이지로 이동
				response.sendRedirect("pages/error/500errorPage.jsp");
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
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
		}
	} 
	
	// community DB 정보 수정
	else if(action.equals("community-update")){
		if(community.updateCommunity(communityDTO)){
			response.sendRedirect("pages/view_content.jsp?id=" + communityDTO.getCo_id()+ "&type=community");
		} else {
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
		}
	}
	
	// user 정보 수정
	else if(action.equals("user-update")){
		if(user.updateUser(userDTO)){
			  	String myaccount = "";
				
				if(request.getParameter("type") != null){
					myaccount = "myaccount";
				}
				
			
			// 현재 권한 가져오기
			String Auth = (String) session.getAttribute("userAuth");
			
			if(Auth.equals("student") || Auth == null){
				// getAuth로 String 권한 리턴 받아서 userAuth로 대입
				String userAuth = user.getAuth(userDTO.getUserID());
				// getName로 String 이름 리턴 받아서 userName으로 대입
				String userName = user.getName(userDTO.getUserID());
				// getID로 String 이름 리턴 받아서 userRow으로 대입
				String userRow = user.getID(userDTO.getUserID());
				
				// setAttribute userAuth
				session.setAttribute("userAuth", userAuth);
				// setAttribute userID
				session.setAttribute("userID", userDTO.getUserID());
				// setAttribute userName
				session.setAttribute("userName", userName);
				// setAttribute userRow
				session.setAttribute("userRow", userRow);
				response.sendRedirect("pages/user_profile.jsp?id=" + userDTO.getUserRow());
				
			} else if(Auth.equals("staff") && myaccount.equals("myaccount")){
				// getAuth로 String 권한 리턴 받아서 userAuth로 대입
				String userAuth = user.getAuth(userDTO.getUserID());
				// getName로 String 이름 리턴 받아서 userName으로 대입
				String userName = user.getName(userDTO.getUserID());
				// getID로 String 이름 리턴 받아서 userRow으로 대입
				String userRow = user.getID(userDTO.getUserID());
				
				// setAttribute userAuth
				session.setAttribute("userAuth", userAuth);
				// setAttribute userID
				session.setAttribute("userID", userDTO.getUserID());
				// setAttribute userName
				session.setAttribute("userName", userName);
				// setAttribute userRow
				session.setAttribute("userRow", userRow);
				
				response.sendRedirect("pages/user_profile.jsp?id=" + userDTO.getUserRow() + "&type=myaccount");	
			}	else if(Auth.equals("staff")){
				response.sendRedirect("pages/user_profile.jsp?id=" + userDTO.getUserRow());	
			}
		} else {
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
		}
	
	// notice DB 정보 삭제
	}else if(action.equals("no-delete")) {
		String no_con_id = request.getParameter("id");
		int no_id = Integer.parseInt(no_con_id);
		if(notice.deleteNotice(no_id)){
			response.sendRedirect("pages/list.jsp?type=notice");
		} else { 
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
		}
	 
	
	// user 계정 삭제
	}else if(action.equals("pro-delete")) {
		String userRow = request.getParameter("userRow");
		int userRowInt = Integer.parseInt(userRow);
		String authType = request.getParameter("type");
		
		if(authType.equals("student")){
			if(user.deleteUser(userRowInt)){
				session.invalidate();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('계정이 성공적으로 제거되었습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			} else { 
				// 500 페이지로 이동
				response.sendRedirect("pages/error/500errorPage.jsp");
			}
		}else if(authType.equals("staff")){
			if(user.deleteUser(userRowInt)){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('계정이 성공적으로 제거되었습니다.')");
				script.println("location.href = 'pages/list.jsp?type=member'");
				script.println("</script>");
			} else { 
				// 500 페이지로 이동
				response.sendRedirect("pages/error/500errorPage.jsp");
			}
		}else{
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
		}
		
	 
	
	// community DB 정보 삭제
	}else if(action.equals("co-delete")) {
		String co_con_id = request.getParameter("id");
		int co_id = Integer.parseInt(co_con_id);
		if(community.deleteCommunity(co_id)){
			response.sendRedirect("pages/list.jsp?type=community");
		} else { 
			// 500 페이지로 이동
			response.sendRedirect("pages/error/500errorPage.jsp");
		}
	} 
	
	// adminPage 로 보내는 로직
	else if(action.equals("adminPage")) {
		// 유저권한 받아오기
		
		String Auth ="";
		if(session.getAttribute("userAuth") != null){
			Auth = (String)session.getAttribute("userAuth");
		} else{
			Auth = "none";
		}
		
		if(Auth.equals("staff")) {
		%><jsp:forward page="admin/admin_index.jsp"/><%
		} else {
		// 403 페이지로 이동
		response.sendRedirect("pages/error/403errorPage.jsp");
		}
		
		
		
		
	}
	
	
%>