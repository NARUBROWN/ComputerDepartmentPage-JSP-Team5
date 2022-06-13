package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc_mysql.JDBCUtil;

public class noticeDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 게시글 입력
	public boolean insertDB(noticeDTO noticedto) {
		
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
	
	public boolean updateNotice(noticeDTO noticedto) {
		String sql = "UPDATE notice SET no_title = ?, no_content = ? WHERE no_id = ?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticedto.getNo_title());
			pstmt.setString(2, noticedto.getNo_content());
			pstmt.setInt(3, noticedto.getNo_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true; //데이터베이스 오류
	}
	
	public boolean deleteNotice(int no_id) {
		String sql = "delete from notice where no_id=?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no_id);
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
		String SQL = "SELECT no_id FROM notice ORDER BY no_id DESC";
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
	
	
	
	public ArrayList<noticeDTO> getList(int pageNumber) throws SQLException { //no_id가 내림차순으로 10개까지만 가져온다
		String SQL = "SELECT * FROM notice WHERE no_id < ? ORDER BY no_id DESC LIMIT 10";
		ArrayList<noticeDTO> list = new ArrayList<noticeDTO>();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				noticeDTO notice = new noticeDTO();
				notice.setNo_id(rs.getInt(1));
				notice.setNo_title(rs.getString(2));
				notice.setNo_date(rs.getString(3));
				notice.setNo_author(rs.getString(4));
				notice.setNo_content(rs.getString(5));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			JDBCUtil.close(rs, pstmt, conn);
		}
		return list; 
		
	}
	public boolean nextPage(int pageNumber) throws SQLException {  //게시글이 10개 아래일경우 페이징처리를 위해서 존재하는 함수
		String SQL = "select * from notice where no_id < ?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			JDBCUtil.close(rs, pstmt, conn);
		} 
		
		return false; 
	}
	
	public noticeDTO getNotice(int no_id) {
		String sql = "select * from notice where no_id = ?";
		try { 
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				noticeDTO notice = new noticeDTO();
				notice.setNo_id(rs.getInt(1));
				notice.setNo_title(rs.getString(2));
				notice.setNo_date(rs.getString(3));
				notice.setNo_author(rs.getString(4));
				notice.setNo_content(rs.getString(5));
				return notice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return null; 
	}
}
