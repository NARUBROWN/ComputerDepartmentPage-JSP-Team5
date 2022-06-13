package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import community.communityDTO;
import jdbc_mysql.JDBCUtil;

public class adminDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<communityDTO> getMainPagecommunityList() throws SQLException {
		
		String sql = "select * from community order by co_id desc limit 10";
		ArrayList<communityDTO> lists = new ArrayList<communityDTO>();
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				communityDTO communitydto = new communityDTO();
				communitydto.setCo_id(rs.getInt(1));
				communitydto.setCo_title(rs.getString(2));
				communitydto.setCo_date(rs.getString(3));
				communitydto.setCo_author(rs.getString(4));
				communitydto.setCo_content(rs.getString(5));
				lists.add(communitydto);
				
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			rs.close();
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return lists;
	}
}
