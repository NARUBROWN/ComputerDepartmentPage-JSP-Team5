<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header>
     <!-- 절대경로 (${pageContext.request.contextPath}, webapp 안에서 시작) -->
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/resource/img/header_logo.png" alt="학교로고">
        </a>
        <nav>
            <a href="${pageContext.request.contextPath}/pages/sub.jsp">학과소개</a>
            <a href="${pageContext.request.contextPath}/pages/sub.jsp">교육과정</a>
            <a href="${pageContext.request.contextPath}/pages/sub.jsp">졸업/진로</a>
            <a href="${pageContext.request.contextPath}/pages/sub.jsp">재능광장</a>
        </nav>
    </header>
        <!--드롭다운 네비게이션 영역-->
        <div class="dropNavBackgroundMain">
            <!--드롭다운 네비게이션 1-->
            <div class="dropNavBackground1" id="dropdownNav1">
                <ul>
                    <li>
                        <a href="#">학과소개</a>
                    </li>
                    <li>
                        <a href="#">교수소개</a>
                    </li>
                    <li>
                        <a href="#">실습실안내</a>
                    </li>
                    <li>
                        <a href="#">오시는 길</a>
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
                        <a href="#">학과SNS</a>
                    </li>
                    <li>
                        <a href="#">학생회 임원단</a>
                    </li>
                    <li>
                        <a href="#">학과공지</a>
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
                        <a href="#">커뮤니티</a>
                    </li>
                </ul>
            </div>
        </div>