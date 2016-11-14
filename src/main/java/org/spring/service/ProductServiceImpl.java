package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ProductVO;
import org.spring.domain.SearchCriteria;
import org.spring.persistence.ProductDAO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Inject
	private ProductDAO dao;
	
	@Override
	public List<ProductVO> listByCategory(String category) throws Exception {
		return dao.listByCategory(category);
	}
	@Override
	public ProductVO getByPid(int pid) throws Exception {
		return dao.getByPid(pid);
	}
	@Override
	public List<ProductVO> list(SearchCriteria cri) throws Exception {
		return dao.list(cri);
	}
	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		return dao.listCount(cri);
	}
	@Override
	public void delete(int pid) throws Exception {
		dao.delete(pid);
	}
	@Override
	public void update(ProductVO pvo) throws Exception {
		dao.update(pvo);
	}
	
}
