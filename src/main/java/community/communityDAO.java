package community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc_mysql.JDBCUtil;

public class communityDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 게시글 입력
	public boolean insertDB(communityDTO community) {
		
		String sql = "insert into community(co_title,co_date,co_author,co_content) values(?,?,?,?)";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,community.getCo_title());
			pstmt.setString(2,community.getCo_date());
			pstmt.setString(3,community.getCo_author());
			pstmt.setString(4,community.getCo_content());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true;
		
	}
	
	public boolean updateCommunity(communityDTO community) {
		String sql = "UPDATE community SET co_title = ?, co_content = ? WHERE co_id = ?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, community.getCo_title());
			pstmt.setString(2, community.getCo_content());
			pstmt.setInt(3, community.getCo_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true; //데이터베이스 오류
	}
	
	public boolean deleteCommunity(int co_id) {
		String sql = "delete from community where co_id=?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, co_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true; //데이터베이스 오류
	}
	
	
	//내림차순으로 해서 마지막 게시글에 번호를 가져온다 
	public int getNext() {   
		String SQL = "SELECT co_id FROM community ORDER BY co_id DESC";
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
	
	
	public ArrayList<communityDTO> getList(int pageNumber) throws SQLException { //co_id가 내림차순으로 10개까지만 가져온다
		String SQL = "SELECT * FROM community WHERE co_id < ? ORDER BY co_id DESC LIMIT 10";
		ArrayList<communityDTO> list = new ArrayList<communityDTO>();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				communityDTO community = new communityDTO();
				community.setCo_id(rs.getInt(1));
				community.setCo_title(rs.getString(2));
				community.setCo_date(rs.getString(3));
				community.setCo_author(rs.getString(4));
				community.setCo_content(rs.getString(5));
				list.add(community);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			JDBCUtil.close(rs, pstmt, conn);
		}
		return list; 
		
	}
	
	
	public boolean nextPage(int pageNumber) {  //게시글이 10개 아래일경우 페이징처리를 위해서 존재하는 함수
		String SQL = "SELECT * FROM community WHERE co_id < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public communityDTO getCommunity(int co_id) {
		String sql = "select * from community where co_id = ?";
		try { 
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, co_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				communityDTO community = new communityDTO();
				community.setCo_id(rs.getInt(1));
				community.setCo_title(rs.getString(2));
				community.setCo_date(rs.getString(3));
				community.setCo_author(rs.getString(4));
				community.setCo_content(rs.getString(5));
				return community;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return null; 
	}
}
