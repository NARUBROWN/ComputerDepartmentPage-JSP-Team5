package mainPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import notice.noticeDTO;
import community.communityDTO;
import jdbc_mysql.JDBCUtil;

public class mainDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public boolean noticeInsertDB(noticeDTO noticedto) {
		
		String sql = "insert into notice(no_title,no_date,no_author,no_content) values(?,?,?,?)";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,noticedto.getNo_title());
			pstmt.setString(2,noticedto.getNo_date());
			pstmt.setString(3,noticedto.getNo_author());
			pstmt.setString(4,noticedto.getNo_content());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true;
		
	}
	
	public boolean communityInsertDB(communityDTO communitydto) {
		
		String sql = "insert into community(co_title,co_date,co_author,co_content) values(?,?,?,?)";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,communitydto.getCo_title());
			pstmt.setString(2,communitydto.getCo_date());
			pstmt.setString(3,communitydto.getCo_author());
			pstmt.setString(4,communitydto.getCo_content());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true;
		
	}
	
	
	// 제네릭에 DTO 추가해야함
	public ArrayList<noticeDTO> getMainPageNoticeList() throws SQLException {
		
		String sql = "select * from notice order by no_id desc";
		ArrayList<noticeDTO> lists = new ArrayList<noticeDTO>();
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				noticeDTO noticedto = new noticeDTO();
				noticedto.setNo_id(rs.getInt(1));
				noticedto.setNo_title(rs.getString(2));
				noticedto.setNo_date(rs.getString(3));
				noticedto.setNo_author(rs.getString(4));
				noticedto.setNo_content(rs.getString(5));
				lists.add(noticedto);
				
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			rs.close();
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return lists;
	}
	
	public ArrayList<communityDTO> getMainPagecommunityList() throws SQLException {
		
		String sql = "select * from community order by co_id desc";
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
