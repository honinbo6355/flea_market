package egovframework.market.cmmn.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.Category;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("commonMapper")
public interface CommonMapper {

	List<Category> selectCategoryList() throws Exception;
}
