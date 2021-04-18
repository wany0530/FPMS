package zenkit.web.dao;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.User;
import zenkit.web.vo.UserInfoDetail;

@Repository
public interface A00_LoginDao {
	// 로그인
	public UserInfoDetail login(User mem); 
	// 회원정보 변경
	public void updateUserInfo(User mem);
	// 유저 정보 가져오기
	public User getUserInfo(User user);
	// 패스워드 변경
	public void updatePwd(User user);
}