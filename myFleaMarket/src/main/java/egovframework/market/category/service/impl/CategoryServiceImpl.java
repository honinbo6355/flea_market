package egovframework.market.category.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.market.category.service.CategoryService;
import egovframework.market.category.service.Inquiry;
import egovframework.market.cmmn.service.Category;
import egovframework.myStore.register.service.ProductResultVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Resource(name = "categoryMapper")
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> getLeftCategoryList(Category category) throws Exception {
		return categoryMapper.selectLeftCategoryList(category);
	}

	@Override
	public List<ProductResultVO> getCateProductList(Map<String, Object> paramMap) throws Exception {
		return categoryMapper.selectCateProductList(paramMap);
	}

	@Override
	public int getCateProductCnt(Category category) throws Exception {
		return categoryMapper.selectCateProductCnt(category);
	}
	
	@Override
	public ProductResultVO getProductDetail(String prodId) throws Exception {
		return categoryMapper.selectProductDetail(prodId);
	}

	@Override
	public void registerInquiry(Inquiry inquiry) throws Exception {
		categoryMapper.insertInquiry(inquiry);
	}

	@Override
	public List<Inquiry> getInqList(String prodId) throws Exception {
		return categoryMapper.selectInquiryList(prodId);
	}

	@Override
	public void modifyInquiry(Inquiry inquiry) throws Exception {
		categoryMapper.updateInquiry(inquiry);
	}

	@Override
	public void removeInquiry(Map<String, Object> paramMap) throws Exception {
		categoryMapper.deleteInquiry(paramMap);
	}
}
