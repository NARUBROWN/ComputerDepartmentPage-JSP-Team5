package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import notice.noticeDTO;
import mainPage.mainDAO;

public class noticeDAO {
	
	private Connection conn;
	private ResultSet rs;

	public noticeDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/jspteam5";
			String dbID = "root";
			String dbPassword = "1q2w3e4r";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
				e.printStackTrace();
				
		}
	}
	
	public String getDate() {    //현재의 시간을 가져오는
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() {   //내림차순으로 해서 마지막 게시글에 번호를 가져온다 
		String SQL = "SELECT no_id FROM notice ORDER BY no_id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번쨰 게시물인 경우 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String no_title, String no_author, String no_content) {
		String SQL = "INSERT INTO notice VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, no_title);
			pstmt.setString(3, getDate());
			pstmt.setString(4, no_author);
			pstmt.setString(5, no_content);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<noticeDTO> getList(int pageNumber) { //no_id가 내림차순으로 10개까지만 가져온다
		String SQL = "SELECT * FROM notice WHERE no_id < ? ORDER BY no_id DESC LIMIT 10";
		ArrayList<noticeDTO> list = new ArrayList<noticeDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
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
		}
		return list; 
		
	}
	public boolean nextPage(int pageNumber) {  //게시글이 10개 아래일경우 페이징처리를 위해서 존재하는 함수
		String SQL = "SELECT * FROM notice WHERE no_id < ?";
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
	
	public int update(int no_id, String no_title, String no_content) {
		String SQL = "UPDATE notice SET no_title = ?, no_content = ? WHERE no_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, no_title);
			pstmt.setString(2, no_content);
			pstmt.setInt(3, no_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	
	}
	
	public int delete(int bbsID) {
		String SQL = "UPDATE notice SET WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	
	}   
	
}
