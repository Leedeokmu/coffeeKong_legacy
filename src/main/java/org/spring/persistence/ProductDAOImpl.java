package org.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.ProductVO;
import org.spring.domain.ReviewVO;
import org.spring.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);

	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.ProductMapper";
	
	@Override
	public List<ProductVO> listByCategory(String category) throws Exception {

		return sql.selectList(namespace+".listByCategory", category);
	}

	@Override
	public ProductVO getByPid(int pid) throws Exception {
		return sql.selectOne(namespace+".getByPid", pid);
	}

	@Override
	public List<ProductVO> list(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace+".list", cri);
	}

	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace+".listCount", cri);
	}

	@Override
	public void delete(int pid) throws Exception {
		sql.delete(namespace+".delete", pid);
	}

	@Override
	public void update(ProductVO pvo) throws Exception {
		sql.update(namespace+".update", pvo);
	}

	@Override
	public void insert(ProductVO pvo) throws Exception {
		sql.insert(namespace+".insert", pvo);
	}

	@Override
	public List<ReviewVO> listReview(int pid, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pid", pid);
		map.put("cri", cri);
		return sql.selectList(namespace+".listReview", map);
		
	}

	@Override
	public int listReviewCount(int pid) throws Exception {
		return sql.selectOne(namespace+".listReviewCount", pid);
	}
	@Override
	public void addReview(ReviewVO rvo) throws Exception {
		sql.insert(namespace+".addReview", rvo);
	}

	@Override
	public void deleteReview(int rid) throws Exception {
		sql.delete(namespace+".deleteReview", rid);
	}

	
}