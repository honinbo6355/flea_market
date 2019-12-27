package egovframework.market.category.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.market.category.service.Inquiry;
import egovframework.market.cmmn.service.Category;
import egovframework.myStore.register.service.ProductResultVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("categoryMapper")
public interface CategoryMapper {

	List<Category> selectLeftCategoryList(Category category) throws Exception;

	List<ProductResultVO> selectCateProductList(Map<String, Object> paramMap) throws Exception;

	int selectCateProductCnt(Category category) throws Exception;
	
	ProductResultVO selectProductDetail(String prodId) throws Exception;

	void insertInquiry(Inquiry inquiry) throws Exception;

	List<Inquiry> selectInquiryList(String prodId) throws Exception;

	void updateInquiry(Inquiry inquiry) throws Exception;

	void deleteInquiry(Map<String, Object> paramMap) throws Exception;
}
