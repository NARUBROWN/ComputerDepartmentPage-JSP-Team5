package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; //데이터 베이스에 접근하게 해주는 객체
	private PreparedStatement pstmt; // Statement를 상속받아 인터페이스로 SQL구문을 실행시키는 객체
	private ResultSet rs; //어떤 정보를 담을수 있는 하나의 객체
	
	//	생성자 만들기 // UserDAO 를 객체로 만들었을때 자동으로 데이터베이스에 커넥션이 가능
	public UserDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/JSP";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");  // SQL 드라이버 찾기
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); //오류 출력
		}
	}
	
	public int login(String userID, String userPassword) {  //실제로 로그인 시도해주는 함수
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; // user테이블에서 해당사용자의 비밀번호를 가져오는 쿼리문
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디 불일치
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터 베이스 오류
	}
}