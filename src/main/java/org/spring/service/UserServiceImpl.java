package org.spring.service;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public UserVO getUserWithSessionKey(String key) throws Exception {
		return dao.getUserWithSessionKey(key);
	}

	@Override
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception {
		dao.rmbLogin(email, sess_id, limit);
	}

	@Override
	public String checkDuplicate(String email) throws Exception {
		return dao.checkId(email);
	}

	@Override
	public void register(UserVO uvo) throws Exception {
		dao.register(uvo);
	}

	@Override
	public void update(UserVO uvo) throws Exception {
		dao.update(uvo);
	}

	@Override
	public String checkUserPw(UserVO uvo) throws Exception {
		return dao.checkUserPw(uvo);
	}

	@Override
	public void deleteUser(String email) throws Exception {
		dao.delete(email);
		
	}

}
