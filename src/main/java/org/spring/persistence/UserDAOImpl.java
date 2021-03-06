package org.spring.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.UserMapper";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return sql.selectOne(namespace+".login", dto);
	}

	@Override
	public UserVO getUserWithSessionKey(String key) throws Exception {
		return sql.selectOne(namespace+".getUserWithSession", key);
	}

	@Override
	public void rmbLogin(String email, String sess_id, Date limit) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("sess_id", sess_id);
		map.put("limit", limit);
		
		sql.update(namespace+".rmbLogin", map);
	}

	@Override
	public String checkId(String email) throws Exception {
		return sql.selectOne(namespace+".checkEmail", email);
	}

	@Override
	public void register(UserVO uvo) throws Exception {
		sql.insert(namespace+".register", uvo);
	}

	@Override
	public void update(UserVO uvo) throws Exception {
		sql.update(namespace+".update", uvo);
	}

	@Override
	public String checkUserPw(UserVO uvo) throws Exception {
		return sql.selectOne(namespace+".checkUserPw", uvo);
	}

	@Override
	public void delete(String email) throws Exception {
		sql.delete(namespace+".delete",email);
	}

	@Override
	public List<UserVO> list(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".list", cri);
	}

	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listCount", cri);
	}

	@Override
	public UserVO detail(String email) throws Exception {
		return sql.selectOne(namespace+".detail", email);
	}
}
