package org.spring.persistence;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;

public interface UserDAO {
	public UserVO login(LoginDTO dto) throws Exception;
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception;
	public UserVO getUserWithSessionKey(String key) throws Exception;
	public String checkId(String email) throws Exception;
	public void register(UserVO uvo) throws Exception;
	public void update(UserVO uvo) throws Exception;
	public String checkUserPw(UserVO uvo) throws Exception;
	public void delete(String email) throws Exception;
	
}
