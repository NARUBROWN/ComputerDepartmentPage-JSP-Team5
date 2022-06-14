package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc_mysql.JDBCUtil;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public static UserDAO instance = new UserDAO();
	public UserDAO() {}
	public static UserDAO getInstance() {
		return instance;
	}
	
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
			return -1;
		}
	}
	
	//권한 가져오기
	public String getAuth(String userID) {

		String sql = "SELECT userAuth FROM USER WHERE userID = ?";
		String userAuth ="none";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userAuth = rs.getString(1);
				return userAuth;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return userAuth;
	}
	
	// 이름을 가져오기
	public String getName(String userID) {

		String sql = "SELECT userName FROM USER WHERE userID = ?";
		String userName ="none";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userName = rs.getString(1);
				return userName;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return userName;
	}
	
	// 아이디 가져오기
	public String getID(String userID) {

		String sql = "SELECT userRow FROM USER WHERE userID = ?";
		String userRow ="none";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userRow = rs.getString(1);
				return userRow;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return userRow;
	}
	
	// 유저정보 업데이트
	public boolean updateUser(UserDTO userdto) {
		String sql = "UPDATE user SET userID = ?, userPassword = ?, userName = ?, userEmail = ?, userGender = ?,  userAuth = ? WHERE userRow = ?";
		try {
			conn = JDBCUtil.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userdto.getUserID());
			pstmt.setString(2, userdto.getUserPassword());
			pstmt.setString(3, userdto.getUserName());
			pstmt.setString(4, userdto.getUserEmail());
			pstmt.setString(5, userdto.getUserGender());
			pstmt.setString(6, userdto.getUserAuth());
			pstmt.setInt(7, userdto.getUserRow());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return true; //데이터베이스 오류
	}
	
	// 유저 정보 삭제
	public boolean deleteUser(int userRow) {
		String sql = "delete from user where userRow = ?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userRow);
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
	
	// 유저 리스트
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
	
	// 리스트 페이지에 보여줄 로직(페이징 처리)
		public List<UserDTO> getList(int startRow, int endRow) throws SQLException {
			// 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
			String sql = "select * from "
					+ "(select rownum rn, userRow, userId, userPassword, userName, userEmail, userGender, userAuth from "
					+ "(select * from user order by no desc)) where rn between ? and ?";
			List<UserDTO> list_us = null;
			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow); // sql 물음표에 값 매핑
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery(); // sql 실행
				if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
					list_us = new ArrayList<>(); // list 객체 생성
					do {
						// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
						UserDTO board = new UserDTO();
						board.setUserRow(rs.getInt("userrow"));
						board.setUserID(rs.getString("userid"));
						board.setUserPassword(rs.getString("userpassword"));
						board.setUserName(rs.getString("username"));
						board.setUserEmail(rs.getString("useremail"));
						board.setUserGender(rs.getString("usergender"));
						board.setUserAuth(rs.getString("userauth"));
						list_us.add(board); // list에 0번 인덱스부터 board 객체의 참조값을 저장
					} while (rs.next());
				}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					rs.close();
					JDBCUtil.close(rs, pstmt, conn);
				}
				return list_us; 
				
			}

		public int getCount() throws SQLException{
			int count = 0;
			String sql = "select count(*) from community";
			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				rs.close();
				JDBCUtil.close(rs, pstmt, conn);
			}
			return count; // 총 레코드 수 리턴
		}
	
	// 다음 페이지
	public boolean nextPage(int pageNumber) throws SQLException {  //게시글이 10개 아래일경우 페이징처리를 위해서 존재하는 함수
		String SQL = "select * from user where userName < ?";
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
	
	// 프로필 게시글 가져오기
	public UserDTO getUser(int userRow) {
		String sql = "select * from user where userRow = ?";
		try { 
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				UserDTO userdto = new UserDTO();
				userdto.setUserRow(rs.getInt(1));
				userdto.setUserID(rs.getString(2));
				userdto.setUserPassword(rs.getString(3));
				userdto.setUserName(rs.getString(4));
				userdto.setUserEmail(rs.getString(5));
				userdto.setUserGender(rs.getString(6));
				userdto.setUserAuth(rs.getString(7));
				return userdto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return null; 
	}
}