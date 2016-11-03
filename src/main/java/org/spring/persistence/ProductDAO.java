package org.spring.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ProductVO;

public interface ProductDAO {
	public List<ProductVO> prodList(String category) throws Exception;
	public ProductVO prodDeatil(int pid) throws Exception;
	
}

