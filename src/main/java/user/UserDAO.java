package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jdbc_mysql.JDBCUtil;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
		
	// 로그인
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if(rs.getString(1).equals(userPassword))
					{
						return 1; // login 성공
					}
					else
						return 0; // password X
				}
				return -1; // id X
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt, conn);
			}
			return -2; // db오류
		}
	
	// 회원 가입
	public int join(UserDTO userdto) {
		String SQL = "INSERT INTO USER(UserID, UserPassword, userName, userEmail, userGender, userAuth) VALUES (?,?,?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userdto.getUserID());
			pstmt.setString(2, userdto.getUserPassword());
			pstmt.setString(3, userdto.getUserName());
			pstmt.setString(4, userdto.getUserEmail());
			pstmt.setString(5, userdto.getUserGender()); 
			pstmt.setString(6, userdto.getUserAuth());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}