package org.spring.service;

import java.util.Date;

import org.spring.domain.MgrVO;
import org.spring.dto.LoginDTO;

public interface MgrService {
	public MgrVO login(LoginDTO dto) throws Exception;
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception;
}
