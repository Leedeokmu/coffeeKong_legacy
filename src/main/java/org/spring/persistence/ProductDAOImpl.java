package org.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ProductVO;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);

	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.ProductMapper";
	
	@Override
	public List<ProductVO> prodList(String category) throws Exception {

		return sql.selectList(namespace+".getProdList", category);
	}

	@Override
	public ProductVO prodDeatil(int pid) throws Exception {
		return sql.selectOne(namespace+".getProdDetail", pid);
	}
	
}
