package user;

public class UserDTO {

		private String userAuth; // 회원권한 구분
		private String userID; // 유저 아이디
		private String userPassword; // 유저 비밀번호
		private String userName; // 유저 이름
		private String userEmail; // 유저 이메일
		private String userGender; // 유저 성별
		public String getUserAuth() {
			return userAuth;
		}
		public void setUserAuth(String userAuth) {
			this.userAuth = userAuth;
		}
		public String getUserID() {
			return userID;
		}
		public void setUserID(String userID) {
			this.userID = userID;
		}
		public String getUserPassword() {
			return userPassword;
		}
		public void setUserPassword(String userPassword) {
			this.userPassword = userPassword;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserEmail() {
			return userEmail;
		}
		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}
		public String getUserGender() {
			return userGender;
		}
		public void setUserGender(String userGender) {
			this.userGender = userGender;
		}
		
}
