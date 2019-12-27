package egovframework.market.category.service;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.Category;
import egovframework.myStore.register.service.ProductResultVO;

public interface CategoryService {
	List<Category> getLeftCategoryList(Category category) throws Exception;

	List<ProductResultVO> getCateProductList(Map<String, Object> paramMap) throws Exception;

	int getCateProductCnt(Category category) throws Exception;
	
	ProductResultVO getProductDetail(String prodId) throws Exception;

	void registerInquiry(Inquiry inquiry) throws Exception;

	List<Inquiry> getInqList(String prodId) throws Exception;

	void modifyInquiry(Inquiry inquiry) throws Exception;

	void removeInquiry(Map<String, Object> paramMap) throws Exception;
}
