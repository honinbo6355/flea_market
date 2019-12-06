package egovframework.market.category.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.Category;
import egovframework.myStore.register.service.ProductVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("categoryMapper")
public interface CategoryMapper {

	List<Category> selectLeftCategoryList(Category category) throws Exception;

	List<ProductVO> selectCateProductList(Map<String, Object> paramMap) throws Exception;

	int selectCateProductCnt(Category category) throws Exception;
}
