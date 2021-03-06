package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.dto.UserSch;
import zenkit.web.vo.User;
import zenkit.web.vo.UserInfoDetail;

@Repository
public interface A01_userDao {
	public ArrayList<UserSch> userList(UserSch user);
	public void userDeptUp(String d_name);
	public void userDelete(String id);
	public void userUpdate(UserSch user);
	public void userInsert(UserInfoDetail user);
	public int getU_no();
}