package org.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> getProdList(String category) throws Exception;
	public ProductVO getProdDetail(int pid) throws Exception;
}
