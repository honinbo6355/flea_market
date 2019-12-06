package egovframework.market.category.service;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.Category;
import egovframework.myStore.register.service.ProductVO;

public interface CategoryService {
	List<Category> getLeftCategoryList(Category category) throws Exception;

	List<ProductVO> getCateProductList(Map<String, Object> paramMap) throws Exception;

	int getCateProductCnt(Category category) throws Exception;
}
