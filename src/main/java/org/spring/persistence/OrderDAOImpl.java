package org.spring.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO{
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.spring.mapper.OrderMapper";
	
	
}
