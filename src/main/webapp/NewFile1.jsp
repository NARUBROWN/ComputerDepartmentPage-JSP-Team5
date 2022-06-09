<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> <!-- 이것도 다적어줘야함 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JDBC 연동 테스트 예제</title>
</head>
<body>
 
<%
    Connection conn=null;
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/jspteam5?useUnicode=true&characterEncoding=utf8"; /* 반드시 이렇게 적어야함 */
 
    Boolean connect = false;
     
    try{
        Class.forName(driver);
        conn=DriverManager.getConnection(url,"root","1q2w3e4r!"); //자신의 아이디와 비밀번호
        connect = true;
        conn.close();
    }catch(Exception e){
        connect = false;
        e.printStackTrace();
    }
%>
<%
if(connect==true){%>
    연결되었습니다.
<%}else{ %>
    연결에 실패하였습니다.
<%}%>
 
 
</body>
</html>
