package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jdbc_mysql.JDBCUtil;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
		
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
}
