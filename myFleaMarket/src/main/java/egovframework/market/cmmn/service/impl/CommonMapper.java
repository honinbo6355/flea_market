package egovframework.market.cmmn.service.impl;

import java.util.List;

import egovframework.market.cmmn.service.Category;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {

	List<Category> selectCategoryList() throws Exception;
}
