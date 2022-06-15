# ComputerDepartmentPage-JSP-Team5
 ComputerDepartmentPage JSP Team 5 / 컴퓨터정보과 학과 페이지 JSP 5조 <br>
 5월 12일 ~ 6월 15일까지 인천재능대학교 인공지능컴퓨터정보과 JSP & Servlet 전공과목 시간에 진행했던 프로젝트 입니다.
 <br>
 <h3>인천재능대학교 Java Sever Pages 프로젝트</h3>
 
프로젝트 매니저 (Full stack) | 김원정  | 게시판 DB 설계, 게시판 DAO, DTO, Web_control.jsp 컨트롤러 설계 및 제작, 메인페이지 제작 | 
----- | ----- | -----
파트장(Backend) | 김정석 | 로그인 DB 설계, 유저 DAO, DTO
파트장(Frontend) | 최해성 | 메인 페이지 제작 보조, 서브 페이지 제작 및 JSP 예외처리
Backend | 김태완 | 게시판 DAO 게시판 이전, 다음 메소드 구현
Frontend | 최은성 | 메인페이지 및 서브페이지 디자인 및 디자인 제작 보조

## DB 및 Table 생성문
⚠️ 본  프로젝트 구동 전 설정되어 있어야 합니다. 
```
CREATE DATABASE `jspteam5` 
DEFAULT CHARACTER SET utf8mb3;

CREATE TABLE `community` (
  `co_id` int NOT NULL AUTO_INCREMENT,
  `co_title` varchar(50) NOT NULL,
  `co_date` varchar(50) NOT NULL,
  `co_author` varchar(15) NOT NULL,
  `co_content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `notice` (
  `no_id` int NOT NULL AUTO_INCREMENT,
  `no_title` varchar(50) NOT NULL,
  `no_date` varchar(50) NOT NULL,
  `no_author` varchar(15) NOT NULL,
  `no_content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`no_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `user` (
  `userRow` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `userPassword` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userGender` varchar(20) DEFAULT NULL,
  `userAuth` varchar(20) NOT NULL,
  PRIMARY KEY (`userRow`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

INSERT INTO `user` VALUES (1,'admin','1234','관리자','admin@jeiu.ac.kr','M','staff');

```


<h3>주요기능</h3>

<h5>web_control.jsp에 정의된 기능<h5> 
 
매개변수 이름 | 역할 
----- | -----
signup | 회원가입
notice-insert | (공지사항) 게시판에 게시글 입력
commnuity-insert | (커뮤니티) 게시판에 게시글 입려
login | 로그인
logout | 로그아웃
notice-update | (공지사항) 게시글 업데이트
community-update | (커뮤니티) 게시글 업데이트
user-update | 유저 정보 수정
no-delete | (공지사항) 게시판 게시글 삭제
pro-delete | (유저) 유저 삭제
co-delete | (커뮤니티) 게시판 게시글 삭제
adminPage | 관리자 페이지로 이동
 
 
 <h3>프로젝트 소감</h3>
 <h4>(프로젝트 매니저) 김원정</h4>
  - 본격적인 스프링 프레임워크 학습에 앞서, 게시판과 로그인 기능이 갖춰진 MVC1 형태의 사이트를 조원들과 함께 제작하게 되었습니다. 로직과 출력 코드가 뒤섞이게 되는 MVC1 모델의 단점을 보완하고자, 로그인, 글 입력, 추가, 삭제 등의 액션을 받아 처리해 주는 JSP 파일(가상 컨트롤러)을 개념을 도입하여 로직을 출력코드에서 분리하고 용이하게 관리하려고 노력하였습니다. 또 프로젝트의 매니저로서 팀의 핵심 성과지표(KPI)를 관리하고 추적하여 효율적인 팀 프로젝트를 진행하려 노력하였습니다.
 <h4>(파트장, Backend) 김정석</h4>
  - 처음으로 JSP를 공부하고 작은 프로젝트를 진행하면서 로그인 기능과 회원가입 기능을 구현하였습니다 처음 배워보는 거라 많이 낯설고 어려웠지만 기능을 직접 구현하고 실행되는 걸 보는 과정이 재밌어서 작업하는 기간 동안 즐겁게 한 거 같습니다
 <h4>(파트장, Frontend) 최해성</h4>
  - 저는 원래부터 프런트엔드에 관심이 있었고 어느 정도의 지식이 있었기 때문에 프런트엔드 파트장을 맡아 프로젝트 진행을 하게 되었는데, 정말 여태 알고 하던 것은 얕은 지식이라는 것을 깨달으며 더욱 세세하게 공부하기 위한 추진력을 얻는 기회가 됐으며, 아무래도 백엔드 부분을 피할 순 없기 때문에 자그마한 기능 정도 알아보며 넣는 데까지 성공을 하였습니다. 처음에는 무작정 피하기만 했는데 그래도 기능이 성공을 하니 뿌듯함을 얻으며 욕심이 더욱 생겨 앞으로 있는 시간 동안 프런트엔드, 백엔드 모두 지식을 쌓아 보려 합니다.
 <h4>(조원, Backend) 김태완</h4>
  - 게시판 구현 중에 이전과 다음 역할을 하는 기능을 구현했습니다. 숫자를 이용한 페이징 기능을 하지 못한 점이 아쉬우나 페이지의 기능을 넣는 것이 새롭고 재미있었습니다.
 <h4>(조원, Frontend) 최은성</h4>
 - 1학년 때 프런트엔드 부분의 기초적인 부분을 배워 약간의 관심이 생겼고 이번에 팀 프로젝트를 진행하며 아직은 잘 못하지만 파트장을 비롯해 많은 도움을 받아 로그인 페이지 디자인을 하였고 앞으로도 더욱 열심히 공부하여 다음에 이런 기회가 생긴다면 더욱 노력하여 잘 하고 싶은 생각이 들었습니다
 
