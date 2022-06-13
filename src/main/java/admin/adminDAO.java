package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc_mysql.JDBCUtil;
import notice.noticeDTO;
import user.UserDTO;

public class adminDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//내림차순으로 해서 마지막 게시글에 번호를 가져온다 
		public int getNext() {   
			String SQL = "SELECT userRow FROM user ORDER BY userRow DESC";
			try {
				conn = JDBCUtil.getConnection();
				// 위에서 초기화 했는데 또 초기화해서 써야함
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫번쨰 게시물인 경우 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// pstmt 닫으면 오류 뱉어서 빼고 close
				JDBCUtil.close(rs, conn);
			}
			//데이터베이스 오류
			return -1;
		}
	
	public ArrayList<UserDTO> getList(int pageNumber) throws SQLException { //co_id가 내림차순으로 10개까지만 가져온다
		String SQL = "SELECT * FROM user WHERE userRow < ? ORDER BY userRow DESC LIMIT 10";
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserDTO userdto = new UserDTO();
				userdto.setUserRow(rs.getInt(1));
				userdto.setUserID(rs.getString(2));
				userdto.setUserPassword(rs.getString(3));
				userdto.setUserName(rs.getString(4));
				userdto.setUserEmail(rs.getString(5));
				userdto.setUserGender(rs.getString(6));
				userdto.setUserAuth(rs.getString(7));
				list.add(userdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			JDBCUtil.close(rs, pstmt, conn);
		}
		return list; 
	}
	
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
