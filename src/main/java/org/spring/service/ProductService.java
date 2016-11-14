package org.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ProductVO;
import org.spring.domain.SearchCriteria;

public interface ProductService {
	public List<ProductVO> listByCategory(String category) throws Exception;
	public ProductVO getByPid(int pid) throws Exception;
	public List<ProductVO> list(SearchCriteria cri) throws Exception;
	public int listCount(SearchCriteria cri) throws Exception;
	public void delete(int pid) throws Exception;
	public void update(ProductVO pvo) throws Exception;
}
