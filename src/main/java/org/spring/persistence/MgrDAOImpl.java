package org.spring.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.domain.MgrVO;
import org.spring.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public class MgrDAOImpl implements MgrDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.MgrMapper";
	
	@Override
	public MgrVO login(LoginDTO dto) throws Exception {
		return sql.selectOne(namespace+".login", dto);
	}

	@Override
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("sess_id", sess_id);
		map.put("limit", limit);
		
		sql.update(namespace+".rmbLogin", map);
	}
	
}
