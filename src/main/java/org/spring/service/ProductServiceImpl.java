package org.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ProductVO;
import org.spring.persistence.ProductDAO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

	@Inject
	private ProductDAO dao;
	
	@Override
	public List<ProductVO> getProdList(String category) throws Exception {
		return dao.prodList(category);
	}
	@Override
	public ProductVO getProdDetail(int pid) throws Exception {
		return dao.prodDeatil(pid);
	}
}
