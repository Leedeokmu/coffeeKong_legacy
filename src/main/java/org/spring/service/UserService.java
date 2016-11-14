package org.spring.service;

import java.util.Date;
import java.util.List;

import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;


public interface UserService {
	public UserVO login(LoginDTO dto) throws Exception;
	public UserVO getUserWithSessionKey(String key) throws Exception;
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception;
	public String checkDuplicate(String email) throws Exception;
	public void register(UserVO uvo) throws Exception;
	public void update(UserVO uvo) throws Exception;
	public String checkUserPw(UserVO uvo) throws Exception;
	public void deleteUser(String email) throws Exception;
	public List<UserVO> list(SearchCriteria cri) throws Exception;
	public int listCount(SearchCriteria cri) throws Exception;
	public UserVO detail(String email) throws Exception;
}
