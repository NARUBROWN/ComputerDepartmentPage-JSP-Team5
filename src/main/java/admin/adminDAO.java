package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc_mysql.JDBCUtil;
import user.UserDTO;

public class adminDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<UserDTO> getAdminPageMemberList() {
		
		String sql = "select * from user order by userRow desc limit 5";
		ArrayList<UserDTO> lists = new ArrayList<UserDTO>();
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserDTO userdto = new UserDTO();
				userdto.setUserRow(rs.getInt(1));
				userdto.setUserID(rs.getString(2));
				userdto.setUserPassword(rs.getString(3));
				userdto.setUserName(rs.getString(4));
				userdto.setUserEmail(rs.getString(5));
				userdto.setUserGender(rs.getString(6));
				userdto.setUserAuth(rs.getString(7));
				lists.add(userdto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return lists;
	}
	
	
}
