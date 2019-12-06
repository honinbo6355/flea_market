package egovframework.market.category.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.market.category.service.CategoryService;
import egovframework.market.cmmn.service.Category;
import egovframework.myStore.register.service.ProductVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Resource(name = "categoryMapper")
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> getLeftCategoryList(Category category) throws Exception {
		return categoryMapper.selectLeftCategoryList(category);
	}

	@Override
	public List<ProductVO> getCateProductList(Map<String, Object> paramMap) throws Exception {
		return categoryMapper.selectCateProductList(paramMap);
	}

	@Override
	public int getCateProductCnt(Category category) throws Exception {
		return categoryMapper.selectCateProductCnt(category);
	}
}
