package org.spring.service;

import java.util.Date;

import javax.inject.Inject;

import org.spring.domain.MgrVO;
import org.spring.dto.LoginDTO;
import org.spring.persistence.MgrDAO;
import org.springframework.stereotype.Service;

@Service
public class MgrServiceImpl implements MgrService{

	@Inject
	private MgrDAO dao;
	
	@Override
	public MgrVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	@Override
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception {
		
	}
	
}
