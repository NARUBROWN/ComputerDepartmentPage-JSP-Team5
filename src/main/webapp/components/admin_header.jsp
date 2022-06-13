<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header>
     <!-- 절대경로 (${pageContext.request.contextPath}, webapp 안에서 시작) -->
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/resource/img/header_logo.png" alt="학교로고">
        </a>
        <nav>
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
            <a href="${pageContext.request.contextPath}/pages/notice.jsp">관리도구</a>
        </nav>
    </header>
        <!--드롭다운 네비게이션 영역-->
        <div class="dropNavBackgroundMain">
            <!--드롭다운 네비게이션 1-->
            <div class="dropNavBackground1" id="dropdownNav1">
                <ul>
                    <li>
                        <a href="#"></a>
                    </li>
                    <li>
                        <a href="#"></a>
                    </li>
                    <li>
                        <a href="#"></a>
                    </li>
                    <li>
                        <a href="#">관리도구</a>
                    </li>
                </ul>
            </div>
            <!--드롭다운 네비게이션 2-->
            <div class="dropNavBackground2" id="dropdownNav2">
                <ul>
                    <li>
                        <a href="#">로드맵</a>
                    </li>
                    <li>
                        <a href="#">교과목 소개</a>
                    </li>
                </ul>
            </div>
            <!--드롭다운 네비게이션 3-->
            <div class="dropNavBackground3" id="dropdownNav3">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/pages/notice_list.jsp">공지사항</a>
                    </li>
                    <li>
                        <a href="#">학생회 임원단</a>
                    </li>
                    <li>
                        <a href="#">학과SNS</a>
                    </li>
                    <li>
                        <a href="#">자료실</a>
                    </li>
                    <li>
                        <a href="#">갤러리</a>
                    </li>
                </ul>
            </div>
            <!--드롭다운 네비게이션 4-->
            <div class="dropNavBackground4" id="dropdownNav4">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/pages/community_list.jsp">공지사항 게시판 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pages/community_list.jsp">커뮤니티 게시판 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pages/community_list.jsp">회원 관리</a>
                    </li>
                </ul>
            </div>
        </div>